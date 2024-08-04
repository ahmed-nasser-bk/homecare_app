// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';
import 'package:home_care_app/models/getModel.dart';
import '/firebase/authenticaton.dart';
import '/widgets/dropdownForm.dart';
import '/widgets/inputField.dart';
import '/widgets/button.dart';

class SignUp extends StatefulWidget {
  final  VoidCallback showSignIn;
  const SignUp({super.key, required this.showSignIn});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _nameCont = TextEditingController();
  final _emailCont = TextEditingController();
  final _passwordCont = TextEditingController();
  final _conPasswordCont = TextEditingController();
  final _numberCont = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AuthService auth = AuthService();
  BookingModel controller = Get.put(BookingModel());

  @override
  void dispose() {
    _nameCont.dispose();
    _emailCont.dispose();
    _passwordCont.dispose();
    _conPasswordCont.dispose();
    _numberCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
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
                    SizedBox(height: height * 0.02,),
                    InputField(
                      hint: 'الأسم كامل',
                      controller: _nameCont,
                      obs: false,
                      readOnly: false,
                      icon: const Icon(Icons.person),
                      type: TextInputType.text,
                      validator: ((value) => 
                        value == null || value.isEmpty
                        ? 'لا يمكن ترك الحقل فارغ!'
                        : null
                      ),
                    ),
                    SizedBox(height: height * 0.02,),
                    InputField(
                      hint: 'البريد الإلكتروني',
                      controller: _emailCont,
                      obs: false,
                      readOnly: false,
                      icon: const Icon(Icons.email),
                      type: TextInputType.emailAddress,
                      validator: (email) => 
                        email == null || !EmailValidator.validate(email)
                        ? 'صياغة البريد غير صحيحة!'
                        : null,
                    ),
                    SizedBox(height: height * 0.02,),
                    InputField(
                      hint: 'كلمة المرور',
                      controller: _passwordCont,
                      obs: true,
                      readOnly: false,
                      icon: const Icon(Icons.lock),
                      type: TextInputType.text,
                      validator: ((value) => 
                        value == null || value.length < 8
                        ? 'كلمة المرور يجب ألا تقل عن 8 أحرف!'
                        : null
                      ),
                    ),
                    SizedBox(height: height * 0.02,),
                    InputField(
                      hint: 'تأكيد كلمة المرور',
                      controller: _conPasswordCont,
                      type: TextInputType.text,
                      obs: true,
                      readOnly: false,
                      icon: const Icon(Icons.lock),
                      validator: ((value) => 
                        value != _passwordCont.text
                        ? 'كلمة المرور لا تتطابق!'
                        : null
                      ),
                    ),
                    SizedBox(height: height * 0.02,),
                    InputField(
                      hint: 'رقم الجوال',
                      controller: _numberCont,
                      obs: false,
                      readOnly: false,
                      type: TextInputType.number,
                      icon: const Icon(Icons.phone),
                      validator: ((value) => 
                        value == null || value.length != 9
                        ? 'رقم الجوال غير صحيح!'
                        : null
                      ),
                    ),
                    SizedBox(height: height * 0.02,),
                    const DropdownFrom(),
                    SizedBox(height: height * 0.02,),
                    Button(
                      text: 'تسجيل',
                      onPressed: () async {
                        final isValid = _formKey.currentState!.validate();
                        if(isValid){
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => const Center(child: CircularProgressIndicator()),
                          );
                          await auth.signUp(
                            _nameCont.text.trim(),
                            _emailCont.text.trim(), 
                            _passwordCont.text.trim(),
                            int.parse(_numberCont.text.trim()),
                            controller.selectedCity.toString(),
                          );
                          //to dismiss the dialog
                          Get.back();
                        }
                      }
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('لديك حساب بالفعل؟', style: TextStyle(fontSize: 15),),
                        TextButton(
                          onPressed: widget.showSignIn,
                          child: const Text('تسجيل الدخول', style: TextStyle(fontSize: 15),),
                        ),
                      ],
                    ),
                  ]
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}