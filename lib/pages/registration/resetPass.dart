// ignore_for_file: file_names

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_care_app/firebase/authenticaton.dart';
import 'package:home_care_app/widgets/button.dart';
import 'package:home_care_app/widgets/inputField.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  final controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AuthService auth = AuthService();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text('تغيير كلمة المرور'), elevation: 0,),
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'الرجاء إدخال البريد الإلكتروني لإرسال رابط \nتعيين كلمة المرور',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20,),
                InputField(
                  hint: 'البريد الإلكتروني', 
                  obs: false,
                  readOnly: false,
                  icon: const Icon(Icons.email), 
                  controller: controller,
                  validator: (email) {
                    if (email == null || !EmailValidator.validate(email)) {
                      return 'صياغة البريد غير صحيحة!';
                    } else{
                      return null;
                    }
                  }
                ),
                const SizedBox(height: 20,),
                Button(
                  text: 'إرسال إيميل', 
                  onPressed: () async {
                    final isValid = _formKey.currentState!.validate();
                    if(isValid){
                      showDialog(
                        context: context,
                        builder: (context) => const Center(child: CircularProgressIndicator()),
                      );
                      await auth.resetPassword(controller.text.trim());
                      Get.back();
                    }
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}