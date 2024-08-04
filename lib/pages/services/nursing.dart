// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_care_app/models/getModel.dart';
import '../booking/bookService.dart';
import '/widgets/serviceDetails.dart';
import '/widgets/button.dart';

class NursingPage extends StatelessWidget {
  NursingPage({super.key});

  final ItemsModel controller = Get.find();

  @override
  Widget build(BuildContext context) {
    ItemsModel controller = Get.find();
    String name = controller.itemsList[0][0];
    double price = controller.itemsList[0][2];
    double height = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(elevation: 0, title: const Text('تـمـريـض')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.25,
              child: const Image(
                fit: BoxFit.contain,
                image: AssetImage('assets/images/nursing-ill.png')
              ),
            ),
            SizedBox(
              height: height * 0.45,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ServiceDetails(
                        headText: 'أسم الخدمة',
                        text: name,
                      ),
                      SizedBox(height: height * 0.02,),
                      ServiceDetails(
                        headText: 'الوصف',
                        text: 'هذه الخدمة تشمل:\nتركيب مثبت ، تركيب المحاليل (المغذيات) ، إجراء فحوصات ، حقن الإبر',
                      ),
                      SizedBox(height: height * 0.02,),
                      ServiceDetails(
                        headText: 'التكلفة',
                        text: '$price',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Button(
              text: 'طلب الخدمة', 
              onPressed: () => Get.to(() => BookService(
                serviceName: name,
                servicePrice: price,
              ))
            ),
          ],
        ),
      ),
    );
  }
}
