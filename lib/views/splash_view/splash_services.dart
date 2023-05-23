// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';


// class SplashServices {
//   bool? isBioEnabled;

//   navigateToSreen(context) {
//     if (isBioEnabled == true) {
//       // Navigator.pushReplacement(
//       //   context,
//       //   MaterialPageRoute(
//       //     builder: ((context) => const LockPage()),
//       //   ),
//       // );
//     } else {
//       Navigator.of(context).pushNamedAndRemoveUntil(
//         RoutesName.bottomBarPage,
//         (Route<dynamic> route) => false,
//         arguments: 0,
//       );
//     }
//   }

//   void checkAuthentication(BuildContext context) async {
//     getUserLoginData()
//         .then(
//       (value) => {
//         if (value.isSuccess.toString() == '' ||
//             value.isSuccess.toString() == 'null' ||
//             value.isSuccess == false)
//           {
//             Future.delayed(const Duration(seconds: 3), () {
//               Navigator.of(context).pushNamedAndRemoveUntil(
//                 RoutesName.welcomePage,
//                 (Route<dynamic> route) => false,
//               );
//             })
//           }
//         else
//           {
//             Future.delayed(
//               const Duration(seconds: 3),
//               () async {
//                 // getSecurityShredPrefs() async {
//                 await getIsEnabledDataFromSharedPrefs(context);

//                 // }

//                 // Navigator.of(context).pushNamedAndRemoveUntil(
//                 //   RoutesName.bottomBarPage,
//                 //   (Route<dynamic> route) => false,
//                 //   arguments: 0,
//                 // );
//               },
//             ),
//           }
//       },
//     )
//         .onError(
//       (error, stackTrace) {
//         throw {
//           if (kDebugMode)
//             {
//               print(error.toString()),
//             }
//         };
//       },
//     );
//   }
// }
