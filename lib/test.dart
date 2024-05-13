// // ignore_for_file: unnecessary_new

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class Test extends StatefulWidget {
//   @override
//   _TestState createState() => _TestState();
// }

// class _TestState extends State<Test> with TickerProviderStateMixin {
//   late AnimationController _resizableController;

//   AnimatedBuilder getContainer() {
//     return new AnimatedBuilder(
//         animation: _resizableController,
//         builder: (context, child) {
//           return Container(
//             // padding: EdgeInsets.fromLTRB(left, top, right, bottom),
//             child: Text("SAMPLE"),
//             decoration: BoxDecoration(
//               shape: BoxShape.rectangle,
//               borderRadius: BorderRadius.all(Radius.circular(20)),
//               border: Border.all(
//                   color: Color(0xFFff9c0d),
//                   width: _resizableController.value * 4),
//             ),
//           );
//         });
//   }

//   // @override
//   // void initState() {
//   //   _resizableController = new AnimationController(
//   //     vsync: this,
//   //     duration: new Duration(
//   //       milliseconds: 1000,
//   //     ),
//   //   );
//   //   _resizableController.addStatusListener((animationStatus) {
//   //     switch (animationStatus) {
//   //       case AnimationStatus.completed:
//   //         _resizableController.reverse();
//   //         break;
//   //       case AnimationStatus.dismissed:
//   //         _resizableController.forward();
//   //         break;
//   //       case AnimationStatus.forward:
//   //         break;
//   //       case AnimationStatus.reverse:
//   //         break;
//   //     }
//   //   });
//   //   _resizableController.forward();
//   //   super.initState();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           title: Text("Test"),
//           centerTitle: true,
//         ),
//         body: Center(child: getContainer()));
//   }
// }
