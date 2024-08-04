// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_care_app/firebase/database.dart';
import 'package:home_care_app/models/userModel.dart';
import '../widgets/snackBar.dart';


class AuthService {
  
  FirebaseAuth auth = FirebaseAuth.instance;

  //create account with email & password
  Future signUp(String name, String email, String password, int phone, String city) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user!;
      UserModel userModel = UserModel(
        name: name, 
        email: user.email!, 
        phone: phone, 
        city: city,
      );
      await DataService().setUserData(userModel);
      
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return Utils.showSnackBar('البريد الإلكتروني موجود مسبقاً!', Colors.red);
      }
      else{
        Utils.showSnackBar('حدث خطأ ما، تأكد من إتصالك بالأنترنت!', Colors.red);
      }
    }
  }

  //sign in with email & password
  Future signIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        print('خطأ');
        return Utils.showSnackBar('البريد الإلكتروني أو كلمة المرور غير صحيح!', Colors.red);
      }
      else{
        return Utils.showSnackBar('حدث خطأ ما، تأكد من إتصالك بالأنترنت!', Colors.red);
      }
    }
  }

  //reset password
  Future resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      Utils.showSnackBar('تم إرسال رابط إعادة تعيين كلمة المرور بنجاح', Colors.green);
    } on FirebaseAuthException catch (e) {
      print(e.code);
      Utils.showSnackBar(e.code, Colors.red);
    }
  }

}