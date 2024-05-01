class LinkApp {
  static const String server = "http://localhost:9999";
  
  //==================== user =================================
  static const String user = "$server/user";  // http://localhost:9999/user

  //==================== Auth =================================
  static const String login = "$user/signin";// http://localhost:9999/user/signin
  static const String signup = "$user/signup";

}