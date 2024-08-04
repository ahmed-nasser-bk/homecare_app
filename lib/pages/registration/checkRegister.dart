// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_care_app/pages/menu.dart';
import 'package:home_care_app/pages/registration/toggle.dart';

class CheckRegister extends StatelessWidget {
  const CheckRegister({super.key});

  @override
  Widget build(BuildContext context) {
    //stream builder will listen to userStateChange
    //if user has data, will keep signed in
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.hasError){
          return const Center(child: Text('البريد الإلكتروني او كلمة المرور غير صحيح'),);
        }
        else if (snapshot.hasData) {
          return const MenuPage();
        } else {
          return const TogglePages();
        }
      },
    );
  }
}