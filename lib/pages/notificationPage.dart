// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../widgets/appBar.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: MyAppBar(title: 'الإشعارات',),
        body: const Center(child: Text('لا توجد إشعارات!')),
      ),
    );
  }
}