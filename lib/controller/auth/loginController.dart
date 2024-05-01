// import 'package:flutter/material.dart';
// import '../../core/constants/routes.dart';
// import '../../data/auth/login.dart';
// // import '/global.dart' as globals;

// import '../../core/class/statusrequest.dart';
// // import '../../core/constant/color.dart';
// import '../../core/functions/handlingdatacontroller.dart';
// // import '../../data/datasource/remote/auth/login.dart';
// // import '/core/constant/routes.dart';
// import 'package:get/get.dart';

import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constants/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/auth/login.dart';

class LoginController {
  // This method simulates a login process.
  // You can replace it with your actual login logic.
  static Future<void> login(String email, String password) async {
    LoginData loginData = LoginData(Get.find());
    StatusRequest statusRequest = StatusRequest.none;
    var response = await loginData.postData(email, password);
    statusRequest = handlingData(response);
    print('Email: $email');
    print('Password: $password');
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == true) {
        if (response['role'] == '0') {
          // if user is normal
          Get.offNamed(RouteApp.home, arguments: {
            'id': response['user']['_id'],
            'email': response['user']['email'],
            'role': response['user']['role'],
          });
        } else if (response['role'] == '1') {
          // paramidic
          Get.offNamed(RouteApp.home, arguments: {
            'id': response['user']['_id'],
            'email': response['user']['email'],
            'role': response['user']['role'],
          });
        } else if (response['role'] == '2') {
          // admin
          Get.offNamed(RouteApp.home, arguments: {
            'id': response['user']['_id'],
            'email': response['user']['email'],
            'role': response['user']['role'],
          });
        }
      } else if (response['status'] == false) {
        print("login faild");
        
      } else {
        print("no status in api");
        
      }
    } else {
      print("else login");
    }
  }
}

// abstract class LoginController  {
//   void login(String email , String password);
//   goToSignUp();
// }

// class LoginControllerImp extends LoginController {
//   GlobalKey<FormState> formstatelogin = GlobalKey<FormState>();

//   // late TextEditingController email;
//   // late TextEditingController password;
 
//   StatusRequest statusRequest = StatusRequest.none;

//   LoginData loginData = LoginData(Get.find());
//   List data = [];
//   @override
//   void onInit() {
//     // email = TextEditingController();
//     // password = TextEditingController();
//     super.onInit();
//   }

//   @override
//   void dispose() {
//     // email.dispose();
//     // password.dispose();
//     super.dispose();
//   }

//   @override
//  static login(String email , String password) async {
//     statusRequest = StatusRequest.loading;
//     update();
//     var response = await loginData.postData(email, password);
//     statusRequest = handlingData(response);
//     print("response after handle= $response");
//     if (statusRequest == StatusRequest.success) {
//       if (response['status'] == true) {
//         if (response['role'] == '0') {
//           // if user is normal
//           Get.offNamed(RouteApp.home, arguments: {
//             'id': response['user']['_id'],
//             'email': response['user']['email'],
//             'role': response['user']['role'],
//           });
//         } else if (response['role'] == '1') {
//           // paramidic
//           Get.offNamed(RouteApp.home, arguments: {
//             'id': response['user']['_id'],
//             'email': response['user']['email'],
//             'role': response['user']['role'],
//           });
//         } else if (response['role'] == '2') {
//           // admin
//           Get.offNamed(RouteApp.home, arguments: {
//             'id': response['user']['_id'],
//             'email': response['user']['email'],
//             'role': response['user']['role'],
//           });
//         }
//       } else if (response['status'] == false) {
//         print("login");
//         // Get.defaultDialog(
//         //   title: 'ثثثثث',
//         //   middleText: response['msg'],
//         //   confirm: ElevatedButton(
//         //     style: ElevatedButton.styleFrom(
//         //       padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
//         //       backgroundColor: ColorApp.blue,
//         //       shape: RoundedRectangleBorder(
//         //         borderRadius: BorderRadius.circular(12.0),
//         //       ),
//         //     ),
//         //     onPressed: () {
//         //       Get.offNamed(RouteApp.verifypatient, arguments: {
//         //         'email': email.text,
//         //       });
//         //     },
//         //     child: const Text(
//         //       'تفعيل الحساب',
//         //       style: TextStyle(
//         //           fontSize: 18,
//         //           fontWeight: FontWeight.bold,
//         //           color: ColorApp.white),
//         //     ),
//         //   ),
//         // );
//         // statusRequest = StatusRequest.failure;
//         // password.clear();
//       } else {
//         print("login");
//         // Get.defaultDialog(
//         //   title: 'Warning',
//         //   middleText: response['msg'],
//         //   cancel: ElevatedButton(
//         //       style: ElevatedButton.styleFrom(
//         //         padding:
//         //             const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
//         //         backgroundColor: ColorApp.blue,
//         //         shape: RoundedRectangleBorder(
//         //           borderRadius: BorderRadius.circular(12.0),
//         //         ),
//         //       ),
//         //       onPressed: () {
//         //         Get.back();
//         //       },
//         //       child: const Text(
//         //         'رجوع',
//         //         style: TextStyle(
//         //             fontSize: 18,
//         //             fontWeight: FontWeight.bold,
//         //             color: ColorApp.white),
//         //       )),
//         // );
//         // statusRequest = StatusRequest.failure;
//         // password.clear();
//       }
//     } else {
//       print("else login");
//     }
//     update();
//   }

//   @override
//   goToSignUp() {
//     Get.offNamed(RouteApp.signup);
//   }

//   // @override
//   // goToForgetPassword() {
//   //   Get.toNamed(RouteApp.forgetpasswordemail);
//   // }
// }
