// // request link to server (URIs)
// class LinkApi {
//   static const String server = "http://localhost:9999"; //http://10.0.2.2:9999

//   //==================== user =================================
//   static const String user = "$server/user"; // http://10.0.2.2:9999/user

//   //==================== Auth =================================
//   static const String login =
//       "$user/signin"; // http://10.0.2.2:9999/user/signin
//   static const String signup = "$user/signup";
//   static const String activateUser = "$user/activate-user";
//   static const String resendCode = "$user/resendCode";

//   //====================Event==================================
//   static const String event = "$server/event"; //http://localhost:9999/event
//   static const String allevents = "$event/all";

//   //====================Intrest==================================
//   static const String interest = "$server/interest";

//   static const String allInterests = "$interest/all";
//   static const String addUserInterest = "$interest/user-interest/add";
// }

// request link to server (URIs)
class LinkApi {
  static const String server = "http://localhost:9999"; //http://10.0.2.2:9999

  //==================== user =================================
  static const String user = "$server/user"; // http://10.0.2.2:9999/user
  static const String editUser = "$user/edit-user";

  //==================== Auth =================================
  static const String login =
      "$user/signin"; // http://10.0.2.2:9999/user/signin
  static const String signup = "$user/signup";
  static const String activateUser = "$user/activate-user";
  static const String resendCode = "$user/resendCode";

  //====================Event==================================
  static const String event = "$server/event"; //http://localhost:9999/event
  static const String allevents = "$event/all";

  //====================Intrest==================================
  static const String interest = "$server/interest";
  static const String allInterests = "$interest/all";
  static const String addUserInterest = "$interest/user-interest/add";
}