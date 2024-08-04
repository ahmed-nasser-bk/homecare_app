// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_care_app/models/getModel.dart';


class DropdownFrom extends StatelessWidget {
  const DropdownFrom({super.key,});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.85,
      child: GetBuilder<BookingModel>(
        init: BookingModel(),
        builder: (controller) {
          return DropdownButtonFormField(
            value: controller.selectedCity,
            items: controller.dropdownItems,
            hint: const Text('المنطقة', style: TextStyle(fontFamily: 'Cairo'),),
            style: const TextStyle(fontSize: 14, color: Colors.black),
            dropdownColor: Colors.cyan[50],
            onChanged: ((value) => controller.setSelectedCity(value!)),
            validator: ((city) =>
              city == null || city.isEmpty
              ? 'لا يمكن ترك الحقل فارغ!'
              : null
            ),
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.location_on),
              border: OutlineInputBorder(
                borderSide: const BorderSide(width: 1.0, color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1.0, color: Colors.cyan),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        }
      ),
    );
  }
}