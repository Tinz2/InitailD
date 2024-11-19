import 'package:flutter/material.dart';
import 'home.dart';
import 'search.dart';
import 'menu.dart';
import 'dart:async';
import 'showmusic.dart';
import 'webviewscreen.dart';
import 'package:webview_flutter/webview_flutter.dart';

// Main method to run the app
void main() {
  runApp(MyApp());
}

// Stateless widget for the main app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '...',

      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(238, 0, 0, 0)),
        useMaterial3: true,
      ),
      home: profile(), // เปลี่ยนชื่อคลาสให้ถูกต้อง
    );
  }
}

// Stateful widget for profile
class profile extends StatefulWidget {
  @override
  State<profile> createState() => _ProfileState();
}

// State class for Profile
class _ProfileState extends State<profile> {
  final List<Map<String, String>> items = [
    {
      'text': 'Takumi Fujiwara',
      'image': 'assets/takumi.png',
      'url': 'https://initiald.fandom.com/wiki/Takumi_Fujiwara',
    },
    {
      'text': 'Bunta Fujiwara',
      'image': 'assets/ftakumi.png',
      'url': 'https://initiald.fandom.com/wiki/Bunta_Fujiwara',
    },
    {
      'text': 'Keisuke Takahashi',
      'image': 'assets/ksuke.png',
      'url': 'https://initiald.fandom.com/wiki/Keisuke_Takahashi?so=search',
    },
    {
      'text': 'Ryousuke Takahashi',
      'image': 'assets/rsuke.png',
      'url': 'https://initiald.fandom.com/wiki/Ryosuke_Takahashi?so=search',
    },
    {
      'text': 'Kouichirou Iketani',
      'image': 'assets/iketani.png',
      'url': 'https://initiald.fandom.com/wiki/Koichiro_Iketani',
    },
    {
      'text': 'Itsuki Takeuchi',
      'image': 'assets/isuki.png',
      'url': 'https://initiald.fandom.com/wiki/Itsuki_Takeuchi?so=search',
    },
  ];

  final List<Map<String, String>> items2 = [
    {
      'text': 'Toyota corolla sprinter trueno AE86',
      'image': 'assets/86.png',
      'urlvdo': 'assets/video/86.mp4',
    },
    {
      'text': 'Mazda RX-7 TYPE R (FD3S)',
      'image': 'assets/rx7.png',
      'urlvdo': 'assets/video/rx7.mp4',
    },
    {
      'text': 'Nissan GT-R R32',
      'image': 'assets/r32.png',
      'urlvdo': 'assets/video/r32.mp4',
    },
    {
      'text': 'Mitsubishi Lancer Evolution Ⅲ',
      'image': 'assets/evo.png',
      'urlvdo': 'assets/video/evo.mp4',
    },
  ];

  final ScrollController _scrollController = ScrollController();
  Timer? _autoScrollTimer;

  void _startAutoScroll() {
    const duration = Duration(seconds: 2);
    _autoScrollTimer = Timer.periodic(duration, (timer) {
      if (_scrollController.hasClients) {
        double maxScroll = _scrollController.position.maxScrollExtent;
        double currentScroll = _scrollController.offset;
        double scrollIncrement = 100.0;

        if (currentScroll + scrollIncrement >= maxScroll) {
          _scrollController.animateTo(0,
              duration: Duration(seconds: 1), curve: Curves.easeInOut);
        } else {
          _scrollController.animateTo(currentScroll + scrollIncrement,
              duration: Duration(seconds: 1), curve: Curves.easeInOut);
        }
      }
    });
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'ตัวละคร INITIAL D',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 150,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                controller: _scrollController,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 2 / 3,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return GestureDetector(
                    onTap: () {
// รอใส่code Navigator.push() เพื่อไปยังหน้า webviewscreen
// ใช้ Navigator.push() เพื่อไปยัง WebViewScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              webviewscreen(url: item['url']!),
                        ),
                      );
                    },
                    child: SizedBox(
                      width: 50,
                      child: Card(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        elevation: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              item['image']!,
                              height: 100,
                              width: 100,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(height: 20),
                            Text(
                              item['text']!,
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'รถในเรื่อง INITIAL D',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 400, // ความสูงทั้งหมดของ GridView
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 1.1, // ปรับอัตราส่วนของ Card
                ),
                itemCount: items2.length,
                itemBuilder: (context, index) {
                  final item = items2[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              showmusic(urlvdo: item['urlvdo']!),
                        ),
                      );
                    },
                    child: Card(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      elevation: 10,
                      child: SizedBox(
                        height: 20, // เพิ่ม SizedBox เพื่อควบคุมความสูงของ Card
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              item['image']!,
                              height:
                                  120, // ปรับขนาดภาพให้ใหญ่ขึ้นตามความสูงของ card
                              width: 120,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(height: 1),
                            Text(
                              item['text']!,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
