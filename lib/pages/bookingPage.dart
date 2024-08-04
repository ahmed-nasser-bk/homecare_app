// ignore_for_file: file_names, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_care_app/firebase/database.dart';
import '/widgets/appBar.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const MyAppBar(title: 'الـحـجـوزات',),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('orders').where('userID', isEqualTo: uid).orderBy('status').get().asStream(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done){
              if (snapshot.hasData) {
                var documents = snapshot.data!.docs;
                if(documents.isEmpty){
                  return const Center(child: Text('لا توجد حجوزات!'));
                } 
                else {
                  return ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (context, index) {
                      return BookingDetails(
                        serviceName: documents[index]['serviceName'], 
                        servicePrice: documents[index]['servicePrice'], 
                        city: documents[index]['city'],
                        date: documents[index]['date'],
                        time: documents[index]['time'],
                        status: documents[index]['status'],
                        docID: documents[index].id,
                      );
                    },
                  );
                }
              }
              else if (snapshot.hasError) {
                return const Center(
                  child: AlertDialog(
                    icon: Icon(Icons.warning, color: Colors.amber, size: 30,),
                    title: Text('تأكد من إتصالك بالأنترنت!'),
                  ),
                );
              } 
            }
            return const Center(child: CircularProgressIndicator(),);
          }
        ),
      ),
    );
  }
}

class BookingDetails extends StatefulWidget {
  BookingDetails({
    Key? key,
    required this.serviceName,
    required this.servicePrice,
    required this.city,
    required this.date,
    required this.time,
    required this.status,
    required this.docID,
  }) : super(key: key);

  String serviceName, city, date, time, docID;
  double servicePrice;
  int status;

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  DataService dataService = DataService();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical:10, horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical:10, horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.serviceName),
                    Row(
                      children: [
                        StatusContainer(status: widget.status),
                        const SizedBox(width: 7,),
                        widget.status > 1 
                        ? IconButton(
                          icon: const Icon(Icons.delete), 
                          color: Colors.red,
                          onPressed: () {
                            setState(() {
                              dataService.deleteDocument(widget.docID);
                            });
                          }
                        ) 
                        : Container(),
                      ],
                    ),
                  ],
                ),
                Text('${widget.servicePrice} ريال', style: const TextStyle(color: Colors.cyan),),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children:  [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('التاريخ:', style: TextStyle(color: Colors.grey)),
                      Text(widget.date),
                    ],
                  ),
                  Divider(thickness: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('الوقت:', style: TextStyle(color: Colors.grey)),
                      Text(widget.time),
                    ],
                  ),
                  Divider(thickness: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('المنطقة:', style: TextStyle(color: Colors.grey)),
                      Text(widget.city),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StatusContainer extends StatelessWidget {
  StatusContainer({
    required this.status,
    Key? key,
  }) : super(key: key);
  int status;

  @override
  Widget build(BuildContext context) {
    if (status == 0){
      return Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.yellow[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          'قيد الإنتظار',
          style: TextStyle(
            color: Colors.black
          )
        ),
      );
    } else if (status == 1) {
      return Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.green[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          'تم التأكيد',
          style: TextStyle(
            color: Colors.black,
          )
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          'مكتمل',
          style: TextStyle(
            color: Colors.black,
          )
        ),
      );
    }
  }
}