import 'package:flutter/material.dart';
import 'package:projectanimate_tin/quiz.dart';
import 'home.dart';
import 'search.dart';
import 'profile.dart';
import 'about.dart';
import 'package:flutter/services.dart';
import 'quiz.dart';

//Method หลักที่ Run
void main() {
  runApp(MyApp());
}

//Class state less สั่งแสดงผลหน้าจอ
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Initial D',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(238, 255, 0, 0)),
        useMaterial3: true,
      ),
      home: menu(),
    );
  }
}

//Class stateful เรียกใช้การทำงานแบบโต้ตอบ (เรียกใช้ State)
class menu extends StatefulWidget {
  @override
  State<menu> createState() => _MyHomePageState();
}

//class state เขียน Code ภาษา dart เพอื่รับค่าจากหน้าจอมาคำนวณและส่งค่า่กลับไปแสดงผล
class _MyHomePageState extends State<menu> {
  void _intialstate() {
    setState(() {});
  }

  //ประกาศตัวแปรเก็บลำดับของหน้าจอ
  int _currentIndex = 0;

  // สร้างตัวแปรอาร์เรย์เพื่อเก็บรายการของหน้าจอที่ต้องการสลับไปเมื่อเลือกแต่ละแท็บ
  final List<Widget> _screens = [
    about(),
    home(),
    search(),
    profile(),
    quiz(),
  ];

  // สร้างฟังก์ชันที่ใช้สลับหน้าจอเมื่อผู้ใช้เลือกแท็บ
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
// ส่วนออกแบบหน้าจอ
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 139, 0, 0),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('จบการทํางาน'),
                    content: Text('ทานต้องการจบการทํางานใชหรือไม่'),
                    actions: [
                      TextButton(
                        child: Text('ใช่'),
                        onPressed: () {
                          //จบการทํางาน
                          SystemNavigator.pop();
                        },
                      ),
                      TextButton(
                        child: Text('ไม่'),
                        onPressed: () {
                          // ปิด Alert
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/logo.png'), // เพิ่มโลโก้ใน AppBar
        ),
      ),
      body: _screens[_currentIndex], // แสดงหน้าจอที่ถูกเลือกตามค่าในอาร์เรย์
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, //ลำดับของแท็บที่ถูกเลือก

        onTap: _onTabTapped, // ฟังก์ชันที่เรียกเมื่อกดแต่ละแท็บ
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.info), // ไม่ต้องระบุสีที่นี่
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Quiz',
          ),
        ],
        type:
            BottomNavigationBarType.fixed, // คงที่เพื่อให้ทุกแท็บมีขนาดเท่ากัน

        // ตั้งค่าพื้นหลังเป็นสีดำ
        backgroundColor: Colors.black,

        // กำหนดสีของไอคอนและ label เมื่อเลือก
        selectedItemColor: Colors.white,

        // กำหนดสีของไอคอนและ label เมื่อยังไม่ได้เลือก
        unselectedItemColor: Colors.grey,

        // ปรับขนาดของไอคอน
        selectedIconTheme: IconThemeData(size: 30),
        unselectedIconTheme: IconThemeData(size: 24),
      ),
    );
  }
}
