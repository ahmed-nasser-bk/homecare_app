// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, required this.title});

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text(title, style: const TextStyle(fontSize: 18)),
        leading: IconButton(
          icon: const Icon(Icons.settings), 
          iconSize: 25, 
          onPressed: (){},
        ),
      ),
    );
  }
}