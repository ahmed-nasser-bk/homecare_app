// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_care_app/models/getModel.dart';
import '/pages/services/physicTherapy.dart';
import '/pages/services/circum.dart';
import '/pages/services/minorSurgery.dart';
import '/pages/services/seeDoctor.dart';
import '/pages/services/nursing.dart';

class GridList extends StatelessWidget {
  GridList({super.key});

  final ItemsModel controller = Get.put(ItemsModel());

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 18,
        childAspectRatio: 1.1
      ),
      itemCount: controller.itemsList.length,
      itemBuilder:(context, index) {
        return ItemTile(
          text: controller.itemsList[index][0], 
          image: controller.itemsList[index][1],
          onTap: (){
            if(controller.itemsList[index] == controller.itemsList[0]){
              //to navigate to another page
              Get.to(() => NursingPage());
            }
            else if(controller.itemsList[index] == controller.itemsList[1]){
              Get.to(() => const SeeDoctorPage());
            }
            else if(controller.itemsList[index] == controller.itemsList[2]){
              Get.to(() => const MinorSurgeryPage());
            }
            else if(controller.itemsList[index] == controller.itemsList[3]){
              Get.to(() => const CircumPage());
            }
            else if(controller.itemsList[index] == controller.itemsList[4]){
              Get.to(() => const PhysicTherapyPage());
            }
          }
        );
      }
    );
  }
}

class ItemTile extends StatelessWidget {
  const ItemTile({super.key, required this.text, required this.image, this.onTap});
  
  final String text;
  final String image;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.cyan,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(1, 1),
            ),
            BoxShadow(
              blurRadius: 2.0,
              offset: Offset(0, 1),
            ),
          ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 60,
              width: 60,
            ),
            Text(
              text, 
              textAlign: TextAlign.center, 
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}