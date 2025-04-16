import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gas2go_app/views/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'controllers/address-controller.dart';
import 'controllers/home_controller.dart';
import 'package:gas2go_app/services/notifiction_service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'AIzaSyB5WroJjEZRDqoFI-NSHRvcnzL4J5e1r68',
        appId: '1:945898335090:android:b7865e6be20f8726ac4beb',
        messagingSenderId: 'sendid',
        projectId: 'gas2go-c4bee',
        storageBucket: 'gas2go-c4bee.firebasestorage.app',
      )
  );
  final notificationService = NotificationService();
  await notificationService.initNotification();
  Get.put(AddressController());

  // Register HomeController globally
  Get.put(HomeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gas2go',
        theme: _buildTheme(Brightness.light),
      home: SplashView()
    );
  }


  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(brightness: brightness);

    return baseTheme.copyWith(
      textTheme: GoogleFonts.afacadTextTheme(baseTheme.textTheme),
    );
  }

}

