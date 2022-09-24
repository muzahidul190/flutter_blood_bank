import 'package:http/http.dart' as http;

import 'jsonToDart.dart';

class Services {
  static Future<List<Donor>> getDonors() async {
    // var url = Uri.parse('https://127.0.0.1:5000/donors');
    var url = Uri.parse('http://10.0.2.2:5000/donors');
    http.Response response = await http.get(url);
    final jsonData = response.body;
    // var jsonData =
    //     '[{"id": 1, "name": "Rahul Mondal", "email": "rahul@kglfk.com", "phone": "6746", "location": "Khulna", "blood_group": "O+"}, {"id": 2, "name": "Masudur Rahman", "email": "masudur@mail.com", "phone": "96455742", "location": "Satkhira", "blood_group": "A+"}, {"id": 3, "name": "Nishad Khan", "email": "nishad@hotmail.com", "phone": "49356032948", "location": "Dhaka", "blood_group": "B+"}]';

    final List<Donor> donors = donorFromJson(jsonData);
    print(donors[2].bloodGroup);
    return donors;
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
