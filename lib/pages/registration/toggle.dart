import 'package:flutter/material.dart';
import 'package:home_care_app/pages/registration/signIn.dart';
import 'package:home_care_app/pages/registration/signUp.dart';

class TogglePages extends StatefulWidget {
  const TogglePages({super.key});

  @override
  State<TogglePages> createState() => _TogglePagesState();
}

class _TogglePagesState extends State<TogglePages> {
  bool isLogin = true;
  void toggle(){
    setState(() {
      isLogin = !isLogin;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(isLogin){
      return SignIn(showSignUp: toggle);
    }
    else{
      return SignUp(showSignIn: toggle);
    }
  }
}