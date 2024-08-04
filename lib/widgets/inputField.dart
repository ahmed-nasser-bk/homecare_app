// ignore_for_file: file_names

import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.hint,
    required this.icon,
    required this.controller,
    required this.obs,
    required this.readOnly,
    this.hideIcon,
    this.type,
    this.onTap,
    this.validator
  }) : super(key: key);

  final String hint;
  final Widget icon;
  final Widget? hideIcon;
  final bool obs;
  final bool readOnly;
  final void Function()? onTap;
  final TextInputType? type;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.85,
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obs,
        keyboardType: type,
        readOnly: readOnly,
        onTap: onTap,
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: icon,
          suffixIcon: hideIcon,
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.cyan),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}