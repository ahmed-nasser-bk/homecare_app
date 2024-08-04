// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_care_app/firebase/database.dart';
import 'package:home_care_app/models/getModel.dart';
import 'package:home_care_app/models/orderModel.dart';
import '/widgets/snackBar.dart';
import 'stepOne.dart';
import 'stepTwo.dart';

class BookService extends StatefulWidget {
  const BookService({super.key, required this.serviceName, required this.servicePrice});

  final String serviceName;
  final double servicePrice;

  @override
  State<BookService> createState() => _BookServiceState();
}


class _BookServiceState extends State<BookService> {

  int currentStep = 0;
  final _formKey = GlobalKey<FormState>();
  final _ageController = TextEditingController();
  final userID = FirebaseAuth.instance.currentUser!.uid;
  ItemsModel itemController = Get.put(ItemsModel());
  BookingModel bookingController = Get.put(BookingModel());

  @override
  void dispose() {
    _ageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    bool isLastStep = (currentStep == getSteps().length - 1);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(elevation: 0, title: const Text('طلب الخدمة')),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Stepper(
              type: StepperType.vertical,
              steps: getSteps(),
              currentStep: currentStep,
              controlsBuilder: (context, details) {
                return StepsButtons(
                  stepContinue: details.onStepContinue, 
                  stepCancel: details.onStepCancel, 
                  isLastStep: isLastStep
                );
              },
              onStepContinue: () {
                final isValid = _formKey.currentState!.validate();
                if (isLastStep) {
                  setState(() {
                    currentStep = 0;
                  });
                  OrderModel orderModel = OrderModel(
                    userID: userID, 
                    serviceName: widget.serviceName, 
                    servicePrice: widget.servicePrice, 
                    patientAge: int.parse(_ageController.text,),
                    patientGender: bookingController.gender,
                    city: bookingController.selectedCity.toString(),
                    date: bookingController.date.toString().split(' ')[0],
                    time: (bookingController.time.format(context)).toString(),
                    status: 0,
                  );
                  DataService().setOrder(orderModel);
                  //to navigate back to previous page
                  Get.back();
                  Utils.showSnackBar('تم طلب الخدمة بنجاح\nالرجاء إنتظار التأكيد!', Colors.green);
                } 
                else if(isValid)
                {
                  setState(() => currentStep += 1,);
                }
              },
              onStepCancel: (){
                if(currentStep == 0){
                  Get.back();
                }
                else {
                  setState(() => currentStep -= 1);
                } 
              },
            )
          ),
        ),
    );
  }

  List<Step> getSteps() {
    return <Step>[
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: const Text("الخطوة 1"),
        content: StepOne(
          formKey: _formKey, 
          ageController: _ageController,
        ),
      ),
      Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: const Text("الخطوة 2"),
        content: StepTwo(
          ageController: _ageController,
          price: widget.servicePrice,
        ),
      ),
    ];
  }
}

class StepsButtons extends StatelessWidget {
  const StepsButtons({
    super.key, 
    required this.stepContinue, 
    required this.stepCancel, 
    required this.isLastStep,
  });

  final void Function()? stepContinue;
  final void Function()? stepCancel;
  final bool isLastStep;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(height: 70,),
        ElevatedButton(
          onPressed: stepContinue, 
          child: isLastStep
            ? const Text('تـأكيـد الـطلب', style: TextStyle(letterSpacing: 1),)
            : const Text('التـالـي', style: TextStyle(letterSpacing: 1),)
        ),
        const SizedBox(width: 10,),
        TextButton(
          onPressed: stepCancel,
          child: const Text('الـسابـق', style: TextStyle(letterSpacing: 1),),
        ),
      ],
    );
  }
}