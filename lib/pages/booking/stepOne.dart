// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:home_care_app/models/getModel.dart';
import '/widgets/genderSelector.dart';
import '/widgets/dropdownForm.dart';
import '/widgets/inputField.dart';

class StepOne extends StatelessWidget {
  StepOne({
    super.key,
    required this.formKey,
    required this.ageController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController? ageController;
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  BookingModel bookingController = Get.find();

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    void chooseData() async {
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: bookingController.date, //get today's date
        firstDate: bookingController.date,
        lastDate: DateTime(2030),
      );
      if (pickedDate != null) {
        bookingController.setDate(pickedDate);
      }
    }

    void chooseTime() async {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: bookingController.time,
      );
      if (pickedTime != null) {
        bookingController.setTime(pickedTime);
      }
    }
  
    return Container(
      height: height * 0.75,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: GetBuilder<BookingModel>(
            init: bookingController,
            builder: (controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(' عمر المريض:'),
                      const SizedBox(width: 10,),
                      SizedBox(
                        width: 80,
                        child: TextFormField(
                          controller: ageController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly], //only numbers
                          textAlign: TextAlign.center,
                          validator: ((value) =>
                            value == null || value.isEmpty
                            ? ' الحقل فارغ!'
                            : null
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02,),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('جنس المريض:'),
                      GenderSelector(),
                    ],
                  ),
                  SizedBox(height: height * 0.02,),
                  const Text('التاريخ:'),
                  InputField(
                    hint: controller.date.toString().split(' ')[0],
                    obs: false,
                    readOnly: true,
                    icon: const Icon(Icons.date_range),
                    controller: dateController,
                    onTap: chooseData,
                  ),
                  SizedBox(height: height * 0.02,),
                  const Text(' الوقت:'),
                  InputField(
                    hint: (controller.time.format(context)).toString(), 
                    obs: false,
                    readOnly: true,
                    icon: const Icon(Icons.timer),
                    controller: timeController,
                    onTap: chooseTime,
                  ),
                  SizedBox(height: height * 0.02,),
                  const Text(' المنطقة:'),
                  const DropdownFrom(),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}

