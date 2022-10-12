import 'package:flutter_blood_bank/jsonOperations/donationRecords.dart';
import 'package:http/http.dart' as http;

import 'jsonToDart.dart';

class Services {
  static Future<List<Donor>> getDonors() async {
    // var url = Uri.parse('https://127.0.0.1:5000/donors');
    // final jsonData;
    try {
      var url = Uri.parse('http://10.0.2.2:5000/donors');
      http.Response response = await http.get(url);
      final jsonData = response.body;
      final List<Donor> donors = donorFromJson(jsonData);
      return donors;
    } catch (e) {
      final List<Donor> donors = [];
      return donors;
    }
    // var jsonData =
    //     '[{"id": 1, "name": "Rahul Mondal", "email": "rahul@kglfk.com", "phone": null, "location": "Khulna", "blood_group": "O+"}, {"id": 2, "name": "Masudur Rahman", "email": "masudur@mail.com", "phone": "96455742", "location": "Satkhira", "blood_group": "A+"}, {"id": 3, "name": "Nishad Khan", "email": "nishad@hotmail.com", "phone": "49356032948", "location": "Dhaka", "blood_group": "O-"}, {"id": 4, "name": "Md Hasib Molla", "email": "mdhasibm700@gmail.com", "phone": " 01778541558", "location": "Khulna", "blood_group": "AB+"}, {"id": 5, "name": "MD.Sabbir hossain", "email": "sabbirkhan8578577@gmail.com", "phone": "01927283288", "location": "Shibbari, Khulna", "blood_group": "B+"}, {"id": 6, "name": "MD.Hasan ", "email": "mdhasanshrif152@gmail.com", "phone": "01889334280", "location": "Shibbari, Khulna", "blood_group": "B+"}, {"id": 7, "name": "Ashique-Ur-Rahman", "email": "ashik.rahman713@gmail.com", "phone": "01751958392", "location": "Sonadanga, Khulna", "blood_group": "B+"}, {"id": 8, "name": "Saiful Islam", "email": "saifulislamsaikat700@gmail.com", "phone": "01701048872", "location": "Khulna", "blood_group": "AB+"}, {"id": 9, "name": "Umaiya Hossan Jenia", "email": "umaiya.jenia@gmail.com", "phone": "01304544793", "location": "Bagerhat", "blood_group": "AB+"}, {"id": 10, "name": "MD Abdullah", "email": "abda37166@gmail.com", "phone": "01868466674", "location": "Khulna", "blood_group": "AB+"}, {"id": 11, "name": "Fairuz Adiba ", "email": "intu.mahin11@gmail.com", "phone": "01982677729", "location": "Khulna", "blood_group": "AB+"}, {"id": 12, "name": "Nafisa Anjum", "email": "nafisaa024@gmail.com", "phone": "01893680829", "location": "Khulna", "blood_group": "B+"}, {"id": 13, "name": "Promita Biswas", "email": "promitabiswas5@gmail.com", "phone": "01706578441", "location": "Gollamari, Khulna", "blood_group": "B+"}]';
  }

  static Future<List<Donor>> getDonor(int id) async {
    var uri = 'http://10.0.2.2:5000/donors/$id';

    var url = Uri.parse(uri);
    http.Response response = await http.get(url);
    final jsonData = response.body;
    // var jsonData =
    //     '[{"id": 1, "name": "Rahul Mondal", "email": "rahul@kglfk.com", "phone": null, "location": "Khulna", "blood_group": "O+"}, {"id": 2, "name": "Masudur Rahman", "email": "masudur@mail.com", "phone": "96455742", "location": "Satkhira", "blood_group": "A+"}, {"id": 3, "name": "Nishad Khan", "email": "nishad@hotmail.com", "phone": "49356032948", "location": "Dhaka", "blood_group": "O-"}, {"id": 4, "name": "Md Hasib Molla", "email": "mdhasibm700@gmail.com", "phone": " 01778541558", "location": "Khulna", "blood_group": "AB+"}, {"id": 5, "name": "MD.Sabbir hossain", "email": "sabbirkhan8578577@gmail.com", "phone": "01927283288", "location": "Shibbari, Khulna", "blood_group": "B+"}, {"id": 6, "name": "MD.Hasan ", "email": "mdhasanshrif152@gmail.com", "phone": "01889334280", "location": "Shibbari, Khulna", "blood_group": "B+"}, {"id": 7, "name": "Ashique-Ur-Rahman", "email": "ashik.rahman713@gmail.com", "phone": "01751958392", "location": "Sonadanga, Khulna", "blood_group": "B+"}, {"id": 8, "name": "Saiful Islam", "email": "saifulislamsaikat700@gmail.com", "phone": "01701048872", "location": "Khulna", "blood_group": "AB+"}, {"id": 9, "name": "Umaiya Hossan Jenia", "email": "umaiya.jenia@gmail.com", "phone": "01304544793", "location": "Bagerhat", "blood_group": "AB+"}, {"id": 10, "name": "MD Abdullah", "email": "abda37166@gmail.com", "phone": "01868466674", "location": "Khulna", "blood_group": "AB+"}, {"id": 11, "name": "Fairuz Adiba ", "email": "intu.mahin11@gmail.com", "phone": "01982677729", "location": "Khulna", "blood_group": "AB+"}, {"id": 12, "name": "Nafisa Anjum", "email": "nafisaa024@gmail.com", "phone": "01893680829", "location": "Khulna", "blood_group": "B+"}, {"id": 13, "name": "Promita Biswas", "email": "promitabiswas5@gmail.com", "phone": "01706578441", "location": "Gollamari, Khulna", "blood_group": "B+"}]';

    final List<Donor> donor = donorFromJson(jsonData);
    return donor;
  }

  static Future<List<Record>> getRecords() async {
    var url = Uri.parse('http://10.0.2.2:5000/records');
    http.Response response = await http.get(url);
    final jsonData = response.body;

    final List<Record> records = recordsFromJson(jsonData);
    return records;
  }

  static Future<List<Record>> getRecord(int donorId) async {
    var uri = 'http://10.0.2.2:5000/record/$donorId';
    var url = Uri.parse(uri);
    http.Response response = await http.get(url);
    final jsonData = response.body;

    final List<Record> record = recordsFromJson(jsonData);
    return record;
  }
}

// void main() {
//   Services.getDonors();
// }

// import 'jsonToDart.dart';
// import 'package:http/http.dart' as http;

// class Services {
//   static Future<List<Donor>> getDonors() async {
//     var url = Uri.parse('http://127.0.0.1:5000/donors');
//     http.Response response = await http.get(url);
//     final jsonData = response.body;
//   }
// }

// void main() {
//   Services.getDonors();
// }
