// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_care_app/models/getModel.dart';

class StepTwo extends StatelessWidget {
  const StepTwo({
    super.key, 
    required this.ageController,
    required this.price,
  });

  final TextEditingController? ageController;
  final double price;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: height * 0.7,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('تفاصيل المريض'),
              SizedBox(height: height * 0.01,),
              PatientContainer(ageController: ageController,),
              SizedBox(height: height * 0.02,),
              const Text('تفاصيل الوقت و التاريخ'),
              SizedBox(height: height * 0.01,),
              DateContainer(),
              SizedBox(height: height * 0.02,),
              const Text('تفاصيل التكلفة'),
              SizedBox(height: height * 0.01,),
              PriceContainer(price: price,),
            ],
          ),
        ),
      ),
    );
  }
}

class PatientContainer extends StatelessWidget {
  const PatientContainer({super.key, required this.ageController,});
  
  final TextEditingController? ageController;

  @override
  Widget build(BuildContext context) {
  BookingModel controller = Get.put(BookingModel());
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[100],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('العمر:', style: TextStyle(color: Colors.grey)),
                const SizedBox(width: 10,),
                Text(ageController!.text),
              ],
            ),
            Divider(thickness: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('الجنس:', style: TextStyle(color: Colors.grey)),
                const SizedBox(width: 10,),
                Text(controller.gender),
              ],
            ),
            Divider(thickness: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('المنطقة:', style: TextStyle(color: Colors.grey)),
                const SizedBox(width: 10,),
                Text(controller.selectedCity ?? 'المنطقة'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DateContainer extends StatelessWidget {
  DateContainer({super.key, });
  BookingModel controller = Get.find();
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[100],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('التاريخ:', style: TextStyle(color: Colors.grey)),
                const SizedBox(width: 10,),
                Text(controller.date.toString().split(' ')[0]),
              ],
            ),
            Divider(thickness: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('الوقت:', style: TextStyle(color: Colors.grey)),
                const SizedBox(width: 10,),
                Text((controller.time.format(context)).toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PriceContainer extends StatelessWidget {
  const PriceContainer({super.key, required this.price});
    final double price;

  @override
  Widget build(BuildContext context) {
    double discount = 0;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[100],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('التكلفة', style: TextStyle(color: Colors.grey)),
                Text(price.toString()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('الخصم', style: TextStyle(color: Colors.grey)),
                Text(discount.toString()),
              ],
            ),
            Divider(thickness: 1,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('الاجمالي', style: TextStyle(color: Colors.grey)),
                Text('${price - discount}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}