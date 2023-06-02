import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shalontime/view_models/auth_view_model.dart';
import 'package:shalontime/view_models/crm_view_models/crm_salon_view_model.dart';
import 'package:shalontime/view_models/map_view_model.dart';
import 'package:shalontime/view_models/seller_side_view_models/shop_register_view_model.dart';
import 'package:shalontime/view_models/user_side_view_models/home_screen_view_model.dart';
import 'package:shalontime/views/indroduction_views/indroduction_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  fcmToken = (await FirebaseMessaging.instance.getToken())!;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      key: key,
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => ShopRegisterVeiwModel()),
        ChangeNotifierProvider(create: (_) => MapViewModel()),
        ChangeNotifierProvider(create: (_) => CRMSalonViewModel()),
        ChangeNotifierProvider(create: (_) => HomeScreenViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
        ),
        title: 'Salon Time',
        home: const AuthStateCheckScreen(),
      ),
    );
  }
}
