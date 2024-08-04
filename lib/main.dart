import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/widgets/snackBar.dart';
import 'package:firebase_core/firebase_core.dart';
import '/pages/registration/checkRegister.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //using GetMaterial instead of Material to use Get.to(page)
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: Utils.messengerKey,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        scaffoldBackgroundColor: Colors.cyan[50],
        fontFamily: 'Cairo',
      ),
      home: const CheckRegister(),
    );
  }
}
