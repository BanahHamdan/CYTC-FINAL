import 'dart:convert';

import 'package:cytc/linkapi.dart';
import 'package:get/get.dart';

import '../../core/constants/routes.dart';
import 'package:http/http.dart' as http;

class LoginController {
  static login(String email, String password) async {
    // String apiUrl = 'http://10.0.2.2:9999/user/signin';

    try {
      // Create a map containing the email and password
      Map<String, String> body = {
        'email': email,
        'password': password,
      };
      print(" 1 ");

      // Convert the body to JSON
      String jsonBody = json.encode(body);
      print(" 2 ");
      // Make a POST request to the API endpoint
      http.Response response = await http.post(
        Uri.parse(LinkApp.login),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonBody,
      );
      print(" 3 ");

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Parse the response JSON
        Map<String, dynamic> responseData = json.decode(response.body);

        print('Login successful:');
        print(responseData); // responseData
        // Get.offNamed(RouteApp.signup,arguments: []);
        Get.toNamed("/home");
        // Get.offNamed(RouteApp.home, arguments: {
        //   'email': email,
        //   'id': responseData["id"],
        //   'name': responseData["name"],
        //   'role': responseData["role"],
        // });
      } else {
        print('Login failed. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (error) {
      // Handle any errors that occurred during the request
      print('Error during login request: $error');
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
