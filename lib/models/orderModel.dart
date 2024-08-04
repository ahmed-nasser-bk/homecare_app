// ignore_for_file: file_names

class OrderModel {

  OrderModel({
    required this.userID,
    required this.serviceName,
    required this.servicePrice,
    required this.patientAge,
    required this.patientGender,
    required this.city,
    required this.date,
    required this.time,
    required this.status,
  });

  String userID, serviceName, patientGender, city, date, time;
  int patientAge, status;
  double servicePrice;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userID': userID,
      'serviceName': serviceName,
      'servicePrice': servicePrice,
      'patientGender': patientGender,
      'patientAge': patientAge,
      'city': city,
      'date': date,
      'time': time,
      'status': status,
    };
  }

  //to fetch data from cloud firestore
  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      userID: map['userID'],
      serviceName: map['serviceName'],
      servicePrice: map['servicePrice'],
      patientGender: map['patientGender'],
      patientAge: map['patientAge'],
      city: map['city'],
      date: map['date'],
      time: map['time'],
      status: map['status'],
    );
  }
  
}