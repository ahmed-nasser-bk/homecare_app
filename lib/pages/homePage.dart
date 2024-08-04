// ignore_for_file: file_names
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../widgets/adPages.dart';
import '/widgets/appBar.dart';
import '/widgets/gridList.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final controller = PageController();
  int currentPage = 0;

  // we use this function to autoScroll PageView every 3 seconds
  // using Timer.periodic
  void autoScroll() {
    Timer.periodic(
      Duration(seconds: 3), (timer) {
        if(currentPage < 2){
          currentPage++;
        } else {
          currentPage = 0;
        }
        if(controller.hasClients){
          controller.animateToPage(
            currentPage, 
            duration: Duration(milliseconds: 400), 
            curve: Curves.easeIn,
          );
        }
    });
  }

  @override
  void initState() {
    autoScroll();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: const MyAppBar(title: 'الـرئـيسـية',),
          body: Column(
            children: [
              SizedBox(
                height: 160,
                child: PageView(
                  controller: controller,
                  children: const [
                    AdPage2(),
                    AdPage3(),
                    AdPage4(),
                  ],
                ),
              ),
              SmoothPageIndicator(
                controller: controller, 
                count: 3,
                effect: ExpandingDotsEffect(
                  dotColor: Colors.grey.shade400,
                  activeDotColor: Colors.cyan,
                  dotWidth: 14,
                  dotHeight: 14,
                ),
              ),
              const Text('الـخدمـات', style: TextStyle(fontSize: 18,),),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GridList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}