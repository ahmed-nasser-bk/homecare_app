// ignore_for_file: file_names, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ItemsModel extends GetxController {

  List itemsList = [
    ['تمريض', 'assets/images/nursing.png', 2000.0],
    ['كشف طبيب', 'assets/images/doctor.png', 4000.0],
    ['جراحة صغرى', 'assets/images/surgery.png', 3000.0],
    ['ختان', 'assets/images/circum.png', 10000.0],
    ['علاج طبيعي', 'assets/images/physical.png', 5000.0],
    ['طلب أدوية', 'assets/images/medicine.png', 3000.0],
  ];

}


class BookingModel extends GetxController {

  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  String _gender = 'ذكر';
  String? selectedCity;

  String get gender => _gender;

  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(value: 'المكلا', child: Text('المكلا', style: TextStyle(fontFamily: 'Cairo'))),
      DropdownMenuItem(value: 'الشرج', child: Text('الشرج', style: TextStyle(fontFamily: 'Cairo'))),
      DropdownMenuItem(value: 'أربعين شقة', child: Text('أربعين شقة', style: TextStyle(fontFamily: 'Cairo'))),
      DropdownMenuItem(value: 'فوه', child: Text('فوه', style: TextStyle(fontFamily: 'Cairo'))),
      DropdownMenuItem(value: 'الديس', child: Text('الديس', style: TextStyle(fontFamily: 'Cairo'))),
      DropdownMenuItem(value: 'جول مسحة', child: Text('جول مسحة', style: TextStyle(fontFamily: 'Cairo'))),
      DropdownMenuItem(value: 'بويش', child: Text('بويش', style: TextStyle(fontFamily: 'Cairo'))),
      DropdownMenuItem(value: 'خلف', child: Text('خلف', style: TextStyle(fontFamily: 'Cairo'))),
    ];
    return menuItems;
  }

  void setSelectedCity(String name) {
    selectedCity = name;
    update();
  }

  void setGenderType(String type){
    _gender = type;
    update();
  }

  void setDate(DateTime newDate){
    date = newDate;
    update();
  }

  void setTime(TimeOfDay newTime){
    time = newTime;
    update();
  }

}
