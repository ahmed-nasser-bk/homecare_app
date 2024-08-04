// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_care_app/firebase/database.dart';
import 'package:home_care_app/models/userModel.dart';
import '../widgets/appBar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const MyAppBar(title: 'الملف الـشخـصـي',),
        body: StreamBuilder<UserModel>(
          stream: DataService().currentUserData,
          builder: (context, snapshot) {
            UserModel? user = snapshot.data;
            return Center(
              child: Column(
                children: [
                  const SizedBox(height: 30,),
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        child: Icon(Icons.person, size: 50,),
                      ),
                      Positioned(
                        top: 66,
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(50)
                          ),
                          child: const Icon(Icons.edit, size: 20,)
                        )
                      ),
                    ],
                  ),
                  const SizedBox(height: 24,),
                  Text(
                    snapshot.hasData ? user!.name : 'غير معرف',
                    style: const TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 8,),
                  Text(
                    snapshot.hasData ? user!.email : 'غير معرف',
                    style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: OutlinedButton.icon(
                      onPressed: ()=> FirebaseAuth.instance.signOut(),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: const BorderSide(color: Colors.red),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        fixedSize: Size.fromWidth(width * 0.85)
                      ), 
                      icon: const Icon(Icons.logout), 
                      label: const Text('تسجيل الخروج',)
                    ),
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}