import 'package:flutter/material.dart';
import 'menu.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//Method หลักทีRun
void main() {
  runApp(MyApp());
}

//Class state less สั่งแสดงผลหนา้จอ
class MyApp extends StatelessWidget {
  const MyApp({super.key});
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '...',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(239, 245, 188, 2)),
        useMaterial3: true,
      ),
      home: search(),
    );
  }
}

//Class stateful เรียกใช้การท างานแบบโต้ตอบ (เรียกใช้ State)
class search extends StatefulWidget {
  @override
  State<search> createState() => _MyHomePageState();
}

//class state เขียน Code ภาษา dart เพอื่รับค่าจากหนา้จอมาคา นวณและส่งคา่่กลบัไปแสดงผล
class _MyHomePageState extends State<search> {
  void _intialstate() {
    setState(() {});
  }

  List<Map<String, dynamic>> places = [
    {
      'name': 'Impact Blue',
      'description': 'จังหวัดกุนมะ ภูเขาอุซุย ทีมเจ้าถิ่นคือ Impact Blue',
      'imagelist': 'assets/blue.png',
      'lat': 36.500391935122124,
      'lng': 138.90003688361975,
      'phone': '0812797223'
    },
    {
      'name': 'Night Kids',
      'description': 'จังหวัดกุนมะ ภูเขาเมียวงิ ทีมเจ้าถิ่นคือ Night Kids',
      'imagelist': 'assets/nightkids.png',
      'lat': 36.40027323056272,
      'lng': 138.6737144997572,
      'phone': '0812797223'
    },
    {
      'name': 'RedSuns',
      'description': 'จังหวัดกุนมะ ภูเขาอากากิ ทีมเจ้าถิ่นคือ RedSuns',
      'imagelist': 'assets/redsun.png',
      'lat': 36.30102518246034,
      'lng': 138.79992445059744,
      'phone': '0812797223'
    },
    {
      'name': 'Speed Star',
      'description':
          'จังหวัดกุนมะ ภูเขาอากินะ(ฮารุนะ) ทีมเจ้าถิ่นคือ Speed Star',
      'imagelist': 'assets/akina.png',
      'lat': 36.500870575326566,
      'lng': 138.90013749633104,
      'phone': '0812797223'
    },
    // เพิ ่มสถานที่อื่นๆ  ในแต่ละสถานที ่เพิ ่มรายละเอียดเพิ ่มเติมได้ เนื ่องจากกําหนดค่าไว้เป็น dynamic
/* เช่น 
 {'name': 'สถานที ่ ', 'description': 'รายละเอียดสถานที ่ ', 'lat': 13.7563, 
'lng': 100.5018, 'phone': '0987654321'}, 
  */
  ];
  // ฟังกชันเปิ ด ์ Google Maps
  void _launchMap(double lat, double lng) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _makePhoneCall(String phoneNumber) async {
    final telUrl = 'tel:$phoneNumber';
    if (await canLaunch(telUrl)) {
      await launch(telUrl);
    } else {
      throw 'Could not launch $telUrl';
    }
  }

  TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _filteredPlaces = [];
  void filterPlaces() {
    setState(() {
      _filteredPlaces = places
          .where((place) => place['name']
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  void initState() {
    super.initState();
    _filteredPlaces = places;
    _searchController.addListener(() {
      filterPlaces();
    });
  }

  @override
//ส่วนออกแบบหนา้จอ
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 139, 0, 0),
        title: Text(
          'ค้นหาสถานที่',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              style:
                  TextStyle(color: Colors.white), // เปลี่ยนสีตัวหนังสือที่พิมพ์
              decoration: InputDecoration(
                hintText: 'พิมพ์เพื่อค้นหา...',
                hintStyle: TextStyle(color: Colors.white), // เปลี่ยนสี hintText
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor:
          const Color.fromARGB(255, 0, 0, 0), // สีพื้นหลังของ Scaffold
      body: ListView.builder(
        itemCount: _filteredPlaces.length,
        itemBuilder: (context, index) {
          final place = _filteredPlaces[index];
          return Card(
            color: Colors.white, // สีพื ้นหลังของ Card
            elevation: 2.0, // ความนูน
            shape: RoundedRectangleBorder(
              // ความโค้งของมุม
              borderRadius: BorderRadius.circular(5),
            ),
            child: ListTile(
              title: Row(
                children: [
                  SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.asset(place['imagelist'])),
                  SizedBox(width: 8), // เพิ ่มระยะห่างระหว่างรูปภาพและข้อความ
                  Text(
                    place['name'],
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ],
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('รายละเอียดเพิมเติม'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(
                              width: 100,
                              height: 100,
                              child: Image.asset(place['imagelist'])),
                          SizedBox(
                            height: 10,
                          ),
                          Text('สถานที่ : ' + place['name']),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'รายละเอียด : ' + place['description'],
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('เบอร์โทร : ' + place['phone']),
                        ],
                      ),
                      actions: [
                        TextButton(
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: Image.asset('assets/gps.png'),
                          ),
                          onPressed: () {
                            _launchMap(place['lat'], place['lng']);
                          },
                        ),
                        TextButton(
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: Image.asset('assets/tel.png'),
                          ),
                          onPressed: () {
                            _makePhoneCall(place['phone']);
                          },
                        ),
                        TextButton(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Icon(Icons.exit_to_app),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                ); //เมื่อกดที่ listview แล้วให้ขึนรายละเอียดตางหรือไปหน้าอื่น ๆ เขียน code ที่สวนนี
              },
            ),
          );
        },
      ),
    );
  }
}
