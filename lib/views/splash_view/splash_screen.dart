// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:transnational_app/resources/constants/colors.dart';
// import 'package:transnational_app/view_models/get_screen_image_view_model.dart';

// import '../view_models/splash_services.dart';

// String? anotherCD;
// int? anotherContactID;

// class SplashPage extends StatefulWidget {
//   const SplashPage({super.key});

//   @override
//   State<SplashPage> createState() => _SplashPageState();
// }

// class _SplashPageState extends State<SplashPage> {
//   SplashServices splashServices = SplashServices();
//   bool isEnabled = false;

//   @override
//   void initState() {
//     splashServices.checkAuthentication(context);
//     getCDandContactID(context);

//     super.initState();
//   }

//   Future<void> getCDandContactID(context) async {

//   @override
//   Widget build(BuildContext context) {
//     context.read<GetScreenImageViewModel>().getSplashScreenImage(context);
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Consumer<GetScreenImageViewModel>(
//             builder: (context, value, child) {
//               return value.splashImage.isNotEmpty
//                   ? Image.network(value.splashImage)
//                   : const Center(
//                       child: CircularProgressIndicator(
//                         color: lightBrown,
//                       ),
//                     );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
