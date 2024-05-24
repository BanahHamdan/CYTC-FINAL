// request link to server (URIs)
class LinkApi {
  static const String server = "http://localhost:9999";  //http://10.0.2.2:9999
  
  //==================== user =================================
  static const String user = "$server/user";  // http://10.0.2.2:9999/user

  //==================== Auth =================================
  static const String login = "$user/signin";// http://10.0.2.2:9999/user/signin
  static const String signup = "$user/signup";

  //====================Event==================================
  static const String event = "$server/event";  //http://localhost:9999/event
  static const String allevents = "$event/all";
}