// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_care_app/models/getModel.dart';
import '../booking/bookService.dart';
import '/widgets/button.dart';
import '/widgets/serviceDetails.dart';

class PhysicTherapyPage extends StatelessWidget {
  const PhysicTherapyPage({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsModel controller = Get.find();
    String name = controller.itemsList[4][0];
    double price = controller.itemsList[4][2];
    double height = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(elevation: 0, title: const Text('علاج طبيعي')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.25,
              child: const Image(
                image: AssetImage('assets/images/physical-ill.png')
              ),
            ),
            SizedBox(
              height: height * 0.45,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
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
                        text: 'هذه الخدمة تشمل:\nمساج أسترخائي ، مساج علاجي ، علاج آلام الظهر والمفاصل ، حجامة',
                      ),
                      SizedBox(height: height * 0.02,),
                      ServiceDetails(
                        headText: 'التكلفة',
                        text: '$price ريال',
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