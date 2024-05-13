// request link to server (URIs)
class LinkApi {
  static const String server = "http://10.0.2.2:9999";
  
  //==================== user =================================
  static const String user = "$server/user";  // http://10.0.2.2:9999/user

  //==================== Auth =================================
  static const String login = "$user/signin";// http://10.0.2.2:9999/user/signin
  static const String signup = "$user/signup";

}