import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_care_app/models/getModel.dart';


class GenderSelector extends StatelessWidget {
  const GenderSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingModel>(
      init: BookingModel(),
      builder: (controller) {
        return Row(
          children: [
            Radio(
              value: 'ذكر', 
              groupValue: controller.gender, 
              onChanged: ((val) => controller.setGenderType(val!)),
            ),
            const Text('ذكر'),
            const SizedBox(width: 10,),
            Radio(
              value: 'أنثى', 
              groupValue: controller.gender, 
              onChanged: ((val) => controller.setGenderType(val!)),
            ),
            const Text('أنثى'),
          ],
        );
      }
    );
  }
}
