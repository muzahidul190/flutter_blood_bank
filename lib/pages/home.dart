import 'package:flutter/material.dart';
import 'package:flutter_blood_bank/utility/doubleTapDialogueBox.dart';

import '../jsonOperations/Services.dart';
import '../jsonOperations/jsonToDart.dart';
import '../utility/appDrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //My codes starts here

  static const List<String> _groups = [
    'All',
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-'
  ];
  String selectedGroup = _groups.first;
  int donorCounter = 0;

  List<Donor>? _donors;
  bool _loading = false;
  @override
  void initState() {
    super.initState();
    _loading = true;
    Services.getDonors().then((users) {
      setState(() {
        _donors = users;
        _loading = false;
        donorCounter = _donors!.length;
      });
    });
  }

  //My codes ends here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading
            ? (_donors == null ? 'No Donor found!' : 'Loading...')
            : 'Blood Bank App HomePage'),
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          if (_donors != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Select Blood Group'),
                DropdownButton(
                  value: selectedGroup,
                  icon: const Icon(Icons.arrow_drop_down),
                  elevation: 16,
                  underline: Container(height: 2),
                  onChanged: (String? value) {
                    setState(() {
                      selectedGroup = value!;
                      if (value == 'All') {
                        donorCounter = _donors!.length;
                      } else {
                        donorCounter =
                            _donors!.where((c) => c.bloodGroup == value).length;
                      }
                    });
                  },
                  items: _groups.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: null == _donors ? 0 : _donors!.length,
                itemBuilder: (context, index) {
                  Donor donor = _donors![index];
                  if (donor.bloodGroup == selectedGroup ||
                      selectedGroup == 'All') {
                    return singleBox(
                        id: donor.id,
                        name: donor.name,
                        address: donor.location,
                        group: donor.bloodGroup,
                        context: context);
                  } else {
                    return const SizedBox(
                      height: 0,
                    );
                  }
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Text('${donorCounter == 0 ? 'No' : '$donorCounter'} donor'
                  '${donorCounter == 1 ? '' : 's'}'
                  ' found.'),
            ),
          ),
        ],
      ),
    );
  }
}

Widget singleBox(
    {required int id,
    String? name,
    String? address,
    String? group,
    required BuildContext context}) {
  return GestureDetector(
    onDoubleTap: (() {
      showDialog(
          context: context,
          builder: (context) =>
              HomeDoubleTapDialogBox(id: id, context: context));
    }),
    child: Container(
      color: Colors.teal,
      margin: const EdgeInsets.only(bottom: 8.0),
      child: SizedBox(
        height: 110,
        child: Padding(
          padding: const EdgeInsets.only(left: 9, right: 9, top: 3, bottom: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$name',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 19),
                    ),
                    Text(
                      '$address',
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
              Center(
                child: CircleAvatar(
                  backgroundImage: const AssetImage('assets/images/icon.png'),
                  backgroundColor: Colors.transparent,
                  radius: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Text(
                      '$group',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                // child: Text(
                //   '$group',
                //   style: TextStyle(color: Colors.white),
                // ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

// AlertDialog homeDbleTapDialogBox(
//     {required int id, required BuildContext context}) {
//   return AlertDialog(
//     title: const Text('Summery'),
//     content: Text('The person\'s id is: $id'),
//     actions: [
//       TextButton(
//           onPressed: () {
//             Navigator.pop(context);
//             Navigator.push(context, MaterialPageRoute(builder: (context) {
//               return BloodDonor(id: id);
//             }));
//           },
//           child: const Text('Show Details')),
//       TextButton(
//         onPressed: (() {
//           Navigator.pop(context, const Text('Dismiss'));
//         }),
//         child: const Text('Dismiss'),
//       ),
//     ],
//   );
// }
