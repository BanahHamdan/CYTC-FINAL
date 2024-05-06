
import 'package:cytc/main.dart';
import 'package:cytc/view/homePage.dart';
import 'package:cytc/view/screen/auth/Signup.dart';
import 'package:cytc/view/screen/auth/login.dart';
import 'package:get/get.dart';

import 'core/constants/routes.dart';

List<GetPage<dynamic>>? routes = [
  // GetPage(name: '/', page: () =>  WelcomePage()),

  GetPage(name: RouteApp.login, page: () =>  LoginPage()),
  
  GetPage(name: RouteApp.home, page: () =>  homePage()),
  GetPage(name: RouteApp.signup, page: () =>  Signup()),
  
];