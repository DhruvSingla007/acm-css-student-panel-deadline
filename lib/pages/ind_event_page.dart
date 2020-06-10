import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:acmcssdeadline/Widgets/info_column.dart';
import 'package:acmcssdeadline/constants.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:get_ip/get_ip.dart';

class IndEventPage extends StatefulWidget {
  static const String routeName = "/ind-event-page";

  final DocumentSnapshot documentSnapshot;

  IndEventPage({
    @required this.documentSnapshot,
  });

  @override
  _IndEventPageState createState() => _IndEventPageState();
}

class _IndEventPageState extends State<IndEventPage> {
  String studentID = "";
  String deviceIP = "";
  SharedPreferences sharedPreferences;

  bool isLoading = false;

  Future<void> updateAttendedStudentsArray() async {
    setState(() {
      isLoading = true;
    });

    DocumentReference docRef = Firestore.instance
        .collection('events')
        .document(widget.documentSnapshot.data[firestoreNameLabel]);
    DocumentSnapshot docSnapshot = await docRef.get();
    List attendedStudents = docSnapshot.data['studentsAttended'];
    List deviceAddresses = docSnapshot.data['ip'];

    if (attendedStudents.contains(studentID) == true || deviceAddresses.contains(deviceIP) == true) {
      Toast.show("Attendance already marked", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    } else {

      docRef.updateData({
        'studentsAttended': FieldValue.arrayUnion([studentID]),
        'ip': FieldValue.arrayUnion([deviceIP])
      });

      Toast.show("Attendance marked successfully", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<void> scan() async {
    String barcode = await BarcodeScanner.scan();
    if (barcode.toString().toLowerCase().trim() ==
        widget.documentSnapshot.data[fireStoreAttendanceUniqueKey]) {
      updateAttendedStudentsArray();
    } else {
      Toast.show("Invalid QR Code", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    }
    //UniqueKey
    //print(barcode);
  }

  Future<void> _getInfo() async {
    String ipAddress = await GetIp.ipAddress;
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      studentID = sharedPreferences.getString("studentSID");
      deviceIP = ipAddress;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event', style: TextStyle(fontFamily: 'Montserrat')),
        centerTitle: true,
      ),
      body: infoListView(
        context: context,
        imageUrl: widget.documentSnapshot.data[firestoreImageUrl],
        name: widget.documentSnapshot.data[firestoreNameLabel],
        hostName: widget.documentSnapshot.data[firestoreHostNameLabel],
        time: widget.documentSnapshot.data[firestoreTimeLabel],
        date: widget.documentSnapshot.data[firestoreDateLabel],
        location: widget.documentSnapshot.data[firestoreLocationLabel],
        description: widget.documentSnapshot.data[firestoreDescriptionLabel],
        attendanceButtonFunction: () => scan(),
      ),
    );
  }
}
