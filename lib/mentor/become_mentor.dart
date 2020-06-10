import 'package:acmcssdeadline/Widgets/textFormFields.dart';
import 'package:acmcssdeadline/constants.dart';
import 'package:flutter/material.dart';

class BecomeMentor extends StatelessWidget {
  static const String routeName = '/become-mentor-page';
  final _mentorKey = GlobalKey<FormState>();

  final _skill_1 = TextEditingController();
  final _skill_2 = TextEditingController();
  final _skill_3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Become Mentor'),
      ),
      body: Form(
        key: _mentorKey,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 15.0,
              ),
              child: Container(
                child: Text(
                  'Please enter your top 3 skills',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: greenColor,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            BuildTextFormFields(
              editingController: _skill_1,
              hintText: 'Skill 1',
              errorMessage: "This field can't be empty",
              preIcon: Icon(Icons.stars),
            ),
            BuildTextFormFields(
              editingController: _skill_2,
              hintText: 'Skill 2',
              errorMessage: "This field can't be empty",
              preIcon: Icon(Icons.stars),
            ),
            BuildTextFormFields(
              editingController: _skill_3,
              hintText: 'Skill 3',
              errorMessage: "This field can't be empty",
              preIcon: Icon(Icons.stars),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RaisedButton(
                elevation: 10.0,
                color: greenColor,
                onPressed: () {
                  if(_mentorKey.currentState.validate()){
                    print("validated");
                  }
                },
                child: Text('Submit',style: TextStyle(fontSize: 18.0),),
                textColor: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}