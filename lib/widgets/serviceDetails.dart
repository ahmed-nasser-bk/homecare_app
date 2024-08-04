// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';

class ServiceDetails extends StatelessWidget {
  ServiceDetails({
    Key? key,
    required this.headText,
    required this.text,
    this.hasMultiChoice = false,
  }) : super(key: key);

  final String headText;
  final String text;
  bool hasMultiChoice;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            headText, 
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.cyan[600]
            ),
          ),
          hasMultiChoice
          ? const CustomeCheckBox()
          : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              text,
              style: TextStyle(
                wordSpacing: 1.5,
                fontSize: 16,
                color: Colors.grey[800],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomeCheckBox extends StatefulWidget {
  const CustomeCheckBox({super.key});

  @override
  State<CustomeCheckBox> createState() => _CustomeCheckBoxState();
}

class _CustomeCheckBoxState extends State<CustomeCheckBox> {
  List item = [
    ['تركيب مثبت', '2000', false],
    ['حقن إبرة', '1000', false]
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          title: Text(item[0][0]),
          subtitle: Text('${item[0][1]} ريال'),
          value: item[0][2],
          onChanged: (value) {
            setState(() {
              item[0][2] = value!;
            });
          },
        ),
        CheckboxListTile(
          title: Text(item[1][0]),
          subtitle: Text('${item[1][1]} ريال'),
          value: item[1][2],
          onChanged: (value) {
            setState(() {
              item[1][2] = value!;
            });
          },
        ),
      ],
    );
  }
}