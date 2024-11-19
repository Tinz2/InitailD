import 'package:flutter/material.dart';
import 'home.dart';
import 'package:lottie/lottie.dart';
import 'menu.dart';
//Method หลักทีRun

void main() {
  runApp(const MyApp());
}

//Class state less สั่งแสดงผลหน้าจอ
class MyApp extends StatelessWidget {
  const MyApp({super.key});
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '....',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(239, 245, 188, 2)),
        useMaterial3: true,
      ),
      home: wait(),
    );
  }
}

//Class stateful เรียกใช้การท างานแบบโต้ตอบ (เรียกใช้ State)
class wait extends StatefulWidget {
  @override
  State<wait> createState() => _MyHomePageState();
}

//class state เขียน Code ภาษา dart เพอื่ รับค่าจากหน้าจอมาคา นวณและส่งคา่ กลับไปแสดงผล
class _MyHomePageState extends State<wait> {
  void _startAnimation() async {
// ทําการหน่วงเวลาเป็นระยะเวลา 7 วินาที
    await Future.delayed(Duration(seconds: 4));
// หลังจากการหน่วงเวลาเสร็จแล้วจะทําการเปลี่ยนไปยังหน้าหลัก
    Navigator.pushReplacement(
      context,
//home หมายถึงหน้าจอ ที่จะให้ไปแสดงผลหลังจากแสดง animate เสร็จ
      MaterialPageRoute(builder: (context) => menu()),
    );
  }

  void initState() {
    super.initState();
    _startAnimation();
  }

  void _intialstate() {
    setState(() {});
  }

  @override
//ส่วนออกแบบหน้าจอ
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lottie.asset(
              'assets/lottie/title.json', // เปลี่ยนชื่อไฟล์ตามที่ดาวน์โหลดมา
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            Text(
              'INITIAL D',
              style: TextStyle(
                fontSize: 24,
                color: const Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
