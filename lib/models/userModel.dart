// ignore_for_file: file_names

class UserModel {

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.city,
  });

  String name, email, city;
  int phone;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'phone': phone,
      'city': city,
    };
  }

  //to fetch data from cloud firestore
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      city: map['city'],
    );
  }

}