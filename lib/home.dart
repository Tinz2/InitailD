import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'showmusic.dart';
import 'menu.dart';

// Method หลักทีRun
void main() {
  runApp(MyApp());
}

// Class state less สั่งแสดงผลหน้าจอ
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '...',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromRGBO(0, 0, 0, 1)),
        useMaterial3: true,
      ),
      home: home(),
    );
  }
}

// Class stateful เรียกใช้การท างานแบบโต้ตอบ (เรียกใช้ State)
class home extends StatefulWidget {
  @override
  State<home> createState() => _MyHomePageState();
}

// class state เขียน Code ภาษา dart เพอื่ รับค่าจากหน้าจอมาคา นวณและส่งคา◌่ กลับไปแสดงผล
class _MyHomePageState extends State<home> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  String imagePath = ''; // เก็บเส้นทางของภาพปัจจุบัน

  final List<Map<String, String>> mediaList = [
    {
      'song': 'sound/86.mp3',
      'image': 'assets/86.png',
      'title': 'Toyota corolla sprinter trueno AE86'
    },
    {
      'song': 'sound/rx7.mp3',
      'image': 'assets/rx7.png',
      'title': 'Mazda RX-7 TYPE R (FD3S)'
    },
    {
      'song': 'sound/r32.mp3',
      'image': 'assets/r32.png',
      'title': 'Nissan GT-R R32'
    },
    {
      'song': 'sound/evo.mp3',
      'image': 'assets/evo.png',
      'title': 'MITSUBISHI LANCER 2.0 EVOLUTION III'
    },
    {
      'song': 'sound/subaru.mp3',
      'image': 'assets/subaru.png',
      'title': 'Subaru Impreza'
    },
    {
      'song': 'sound/s2000.mp3',
      'image': 'assets/s2000.png',
      'title': 'Honda S2000'
    },
    {'song': 'sound/nsx.mp3', 'image': 'assets/nsx.png', 'title': 'Honda NSX'},
    {
      'song': 'sound/eg6.mp3',
      'image': 'assets/eg6.png',
      'title': 'Honda Civic EG6'
    },
    {
      'song': 'sound/mr2.mp3',
      'image': 'assets/mr2.png',
      'title': 'Toyota MR-2 SW20'
    },
    {
      'song': 'sound/silvia.mp3',
      'image': 'assets/silvia.png',
      'title': 'Nissan Silvia S13'
    },
  ];

  _playSound(String song, String image) async {
    setState(() {
      imagePath = image; // เปลี่ยนภาพเมื่อกดปุ่ม
    });
    _audioPlayer.play(AssetSource(song));
  }

  void _pauseSound() async {
    await _audioPlayer.pause();
  }

  void _stopSound() async {
    await _audioPlayer.stop();
  }

  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  final AudioPlayer _audioeffect = AudioPlayer();
  void _playeffect() async {
    await _audioeffect.play(AssetSource('sound/effect.wav'));
  }

  void _pauseeffect() async {
    await _audioeffect.pause();
  }

  void _stopeffect() async {
    await _audioeffect.stop();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double buttonWidth = screenWidth * 0.25;

    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 0, 0, 0), // สีพื้นหลังของ Scaffold

      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ...mediaList.map((media) {
                return Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // จัดให้ title อยู่กลาง
                  children: [
                    // แสดง title พร้อมเปลี่ยนสีและอยู่กลาง
                    Text(
                      media['title'] ?? '',
                      textAlign: TextAlign.center, // ให้ข้อความอยู่กลาง
                      style: TextStyle(
                        fontSize: 20, // ขนาดตัวอักษร
                        fontWeight: FontWeight.bold, // หนา
                        color: const Color.fromARGB(
                            255, 255, 255, 255), // เปลี่ยนสีข้อความ
                      ),
                    ),
                    const SizedBox(
                        height: 10), // เพิ่มช่องว่างระหว่าง title และปุ่ม

                    // จัดปุ่มใน Row เดียวกัน
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // จัดให้ปุ่มอยู่กลาง
                      children: [
                        SizedBox(
                          width: buttonWidth,
                          child: ElevatedButton(
                            onPressed: () =>
                                _playSound(media['song']!, media['image']!),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green, // สีพื้นหลังปุ่ม
                              padding: EdgeInsets.symmetric(
                                  vertical: 10), // ขนาด padding
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10), // มุมโค้งมน
                              ),
                            ),
                            child: const Text(
                              'Play Sound',
                              style: TextStyle(
                                  color: Colors.white), // สีข้อความปุ่ม
                            ),
                          ),
                        ),
                        const SizedBox(width: 5), // ช่องว่างระหว่างปุ่ม

                        SizedBox(
                          width: buttonWidth,
                          child: ElevatedButton(
                            onPressed: _pauseSound,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              padding: EdgeInsets.symmetric(vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Pause Sound',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),

                        SizedBox(
                          width: buttonWidth,
                          child: ElevatedButton(
                            onPressed: _stopSound,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              padding: EdgeInsets.symmetric(vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Stop Sound',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20), // เพิ่มช่องว่างระหว่างรายการ
                  ],
                );
              }).toList(),
              if (imagePath.isNotEmpty)
                Image.asset(imagePath, width: 300, height: 200),
            ]),
      ),
    );
  }
}
