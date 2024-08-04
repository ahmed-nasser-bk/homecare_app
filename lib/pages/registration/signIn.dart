// ignore_for_file: file_names, use_build_context_synchronously

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'resetPass.dart';
import '/widgets/button.dart';
import '/widgets/inputField.dart';
import '/firebase/authenticaton.dart';

class SignIn extends StatefulWidget {
  final  VoidCallback showSignUp;
  const SignIn({super.key, required this.showSignUp});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _emailCont = TextEditingController();
  final _passwordCont = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isObscure = true;
  AuthService auth = AuthService();

  @override
  void dispose() {
    _emailCont.dispose();
    _passwordCont.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage('assets/images/firstPage.png'),
                    ),
                    SizedBox(height: height * 0.08,),
                    InputField(
                      hint: 'البريد الإلكتروني',
                      obs: false,
                      readOnly: false,
                      controller: _emailCont,
                      icon: const Icon(Icons.email),
                      type: TextInputType.emailAddress,
                      validator: ((email) => 
                        email == null || !EmailValidator.validate(email)
                        ? 'صياغة البريد غير صحيحة!' : null
                      )
                    ),
                    SizedBox(height: height * 0.02,),
                    InputField(
                      hint: 'كلمة المرور',
                      obs: isObscure,
                      readOnly: false,
                      controller: _passwordCont,
                      type: TextInputType.text,
                      icon: const Icon(Icons.lock),
                      hideIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        icon: Icon(
                          isObscure
                          ? Icons.visibility_off
                          : Icons.visibility_outlined,
                        ),
                      ),
                      validator: ((value) => 
                        value == null || value.length < 8
                        ? 'كلمة المرور يجب ألا تقل عن 8 أحرف!' : null
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: (){
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context) => const ResetPassword())
                            );
                          },
                          child: const Text('نسيت كلمة المرور؟', style: TextStyle(fontSize: 15),),
                        ),
                        SizedBox(width: width * 0.08,),
                      ],
                    ),
                    SizedBox(height: height * 0.01,),
                    Button(
                      text: 'تسجيل الدخول',
                      onPressed: () async {
                        final isValid = _formKey.currentState!.validate();
                        if(isValid) {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => const Center(child: CircularProgressIndicator()),
                          );
                          await auth.signIn(
                            _emailCont.text.trim(), 
                            _passwordCont.text.trim()
                          );
                          //to dismiss the dialog
                          Get.back();
                        }
                      }
                    ),
                    SizedBox(height: height * 0.01,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('ليس لديك حساب؟', style: TextStyle(fontSize: 15),),
                        TextButton(
                          onPressed: widget.showSignUp,
                          child: const Text('إنشاء حساب', style: TextStyle(fontSize: 15),),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}