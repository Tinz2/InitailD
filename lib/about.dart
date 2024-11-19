import 'package:flutter/material.dart';
import 'package:projectanimate_tin/main.dart';
import 'menu.dart';

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
      home: about(),
    );
  }
}

//Class stateful เรียกใช้การท างานแบบโต้ตอบ (เรียกใช้ State)
class about extends StatefulWidget {
  @override
  State<about> createState() => _MyHomePageState();
}

//class state เขียน Code ภาษา dart เพอื่รับค่าจากหนา้จอมาคา นวณและส่งคา่่กลบัไปแสดงผล
class _MyHomePageState extends State<about> {
  void _intialstate() {
    setState(() {});
  }

  @override
//ส่วนออกแบบหนา้จอ
  // ส่วนออกแบบหน้าจอ
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 0, 0, 0), // สีพื้นหลังของ Scaffold

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // จัดให้อยู่ขอบบน
          crossAxisAlignment: CrossAxisAlignment.center, // จัดกึ่งกลางแนวนอน
          children: [
            SizedBox(height: 20), // เพิ่มระยะห่างจากขอบบน
            // เพิ่มรูปภาพใน body และตัดมุมขอบให้โค้งมน
            Center(
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(20.0), // ตั้งค่ารัศมีมุมโค้งมน
                child: Image.asset(
                  'assets/ab1.jpg', // ใช้ชื่อไฟล์และพาธรูปภาพของคุณ
                  height: 200, // ตั้งค่าความสูงของรูป
                  width: 350, // ตั้งค่าความกว้างของรูป
                  fit: BoxFit.fill, // กำหนดรูปแบบการแสดงผลรูป
                ),
              ),
            ),
            SizedBox(height: 20), // เพิ่มระยะห่างระหว่างรูปกับข้อความ
            Center(
              child: Text(
                'Welcome to INITIAL D',
                style: TextStyle(
                  color: Colors.white, // สีของข้อความ
                  fontSize: 24, // ขนาดของฟอนต์
                ),
              ),
            ),
            SizedBox(height: 20), // เพิ่มระยะห่างระหว่างรูปกับข้อความ
            Center(
              child: Text(
                'This wiki is about Shuichi Shigeno s Initial D serie. We aim to work together to be the largest and most reliable source of information about the series.',
                style: TextStyle(
                  color: Colors.white, // สีของข้อความ
                  fontSize: 15, // ขนาดของฟอนต์
                ),
                textAlign: TextAlign.center, // จัดข้อความให้อยู่กึ่งกลาง
              ),
            ),
            SizedBox(height: 20), // เพิ่มระยะห่างระหว่างรูปกับข้อความ
            Center(
              child: Text(
                'ตัวละคร',
                style: TextStyle(
                  color: Colors.white, // สีของข้อความ
                  fontSize: 24, // ขนาดของฟอนต์
                ),
                textAlign: TextAlign.center, // จัดข้อความให้อยู่กึ่งกลาง
              ),
            ),
            SizedBox(height: 20), // เพิ่มระยะห่างจากขอบบน
            // เพิ่มรูปภาพใน body และตัดมุมขอบให้โค้งมน
            Center(
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(20.0), // ตั้งค่ารัศมีมุมโค้งมน
                child: Image.asset(
                  'assets/ab2.jpg', // ใช้ชื่อไฟล์และพาธรูปภาพของคุณ
                  height: 350, // ตั้งค่าความสูงของรูป
                  width: 300, // ตั้งค่าความกว้างของรูป
                  fit: BoxFit.fill, // กำหนดรูปแบบการแสดงผลรูป
                ),
              ),
            ),
            SizedBox(height: 20), // เพิ่มระยะห่างระหว่างรูปกับข้อความ
            Center(
              child: Text(
                'Stage',
                style: TextStyle(
                  color: Colors.white, // สีของข้อความ
                  fontSize: 24, // ขนาดของฟอนต์
                ),
                textAlign: TextAlign.center, // จัดข้อความให้อยู่กึ่งกลาง
              ),
            ),
            SizedBox(height: 20), // เพิ่มระยะห่างจากขอบบน
            // เพิ่มรูปภาพใน body และตัดมุมขอบให้โค้งมน
            Center(
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(20.0), // ตั้งค่ารัศมีมุมโค้งมน
                child: Image.asset(
                  'assets/ab3.png', // ใช้ชื่อไฟล์และพาธรูปภาพของคุณ
                  height: 300, // ตั้งค่าความสูงของรูป
                  width: 350, // ตั้งค่าความกว้างของรูป
                  fit: BoxFit.fill, // กำหนดรูปแบบการแสดงผลรูป
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
