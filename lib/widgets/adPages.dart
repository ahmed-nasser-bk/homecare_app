import 'package:flutter/material.dart';

class AdPage2 extends StatelessWidget {
  const AdPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.cyan,
          image: DecorationImage(
            image: AssetImage('assets/images/ad2.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.transparent,
              offset: Offset(0, 1),
            ),
            BoxShadow(
              blurRadius: 2.0,
              offset: Offset(0, 1),
            ),
          ]
        )
      ),
    );
  }
}

class AdPage3 extends StatelessWidget {
  const AdPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Container(
        height: 170,
        decoration: BoxDecoration(
          color: Colors.cyan,
          image: DecorationImage(
            image: AssetImage('assets/images/ad3.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.transparent,
              offset: Offset(0, 1),
            ),
            BoxShadow(
              blurRadius: 2.0,
              offset: Offset(0, 1),
            ),
          ]
        )
      ),
    );
  }
}

class AdPage4 extends StatelessWidget {
  const AdPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Container(
        height: 170,
        decoration: BoxDecoration(
          color: Colors.cyan,
          image: DecorationImage(
            image: AssetImage('assets/images/ad4.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.transparent,
              offset: Offset(0, 1),
            ),
            BoxShadow(
              blurRadius: 2.0,
              offset: Offset(0, 1),
            ),
          ]
        )
      ),
    );
  }
}