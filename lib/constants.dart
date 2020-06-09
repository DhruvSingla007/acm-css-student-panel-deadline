import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: greenColor,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Ask your question...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: greenColor, width: 2.0),
  ),
);

const Color greenColor = Color(0xFF2AC0AF);

const String appbarLabelHomePage = "PEC ACM";
const String facebookPageURL = "https://www.facebook.com/" ;
const String instagramPageURL = "https://www.instagram.com/";
const String twitterPageUrl = "https://twitter.com/";

const String facebookLogoPath = "assets/images/facebook.png";
const String instagramLogoPath = "assets/images/instagram.png";
const String twitterLogoPath = "assets/images/twitter.png";
const String myProfilePageLogoPath = "assets/images/profileLogo.png";

const String drawerFollowLine = "Follow us on :)";

const String indAboutLabel = "About";

const String firestoreNameLabel = "Name";
const String firestoreDateLabel = "Date";
const String firestoreTimeLabel = "Time";
const String firestoreDescriptionLabel = "Description";
const String firestoreLocationLabel = "Location";
const String firestoreHostNameLabel = "Host Name";
const String firestoreImageUrl = "photoURL";

const String firestoreTeamMemberNameLabel = "Name";
const String firestoreTeamMemberEmailIDLabel = "EmailID";
const String firestoreTeamMemberPositionLabel = "Position";
const String firestoreTeamMemberContactLabel = "Contact";

const String firestoreNewsTitleLabel = "Title";
const String firestoreNewsDescriptionLabel = "Description";

const String fireStoreEventCollectionLabel = "events";
const String fireStoreWorkshopCollectionLabel = "workshops";
const String fireStoreSessionsCollectionLabel = "sessions";
const String fireStoreSponsorCollectionLabel = "sponsors";
const String fireStoreAboutCollectionLabel = "about";
const String fireStoreTeamMembersCollectionLabel = "teamMembers";
const String fireStoreNewsCollectionLabel = "news";
const String fireStoreDevelopmentTeamCollectionLabel = "developmentTeamMembers";

const String fireStoreAttendanceUniqueKey = "UniqueKey";

const String mainLogoImagePath = "assets/images/acm.png";
