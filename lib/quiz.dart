import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: quiz(),
    );
  }
}

class quiz extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<quiz> {
  List<Map<String, dynamic>> questions = [
    {
      'question': 'ทีม Blue Impact เป็นเจ้าถิ่นของภูเขาอะไร?',
      'options': ['ภูเขาอุซุย', 'ภูเขาเมียวงิ', 'ภูเขาอากาอิ', 'ภูเขาอากินะ'],
      'answer': 'ภูเขาอุซุย',
    },
    {
      'question': 'ทีม Speed Star เป็นเจ้าถิ่นของภูเขาอะไร?',
      'options': ['ภูเขาอุซุย', 'ภูเขาเมียวงิ', 'ภูเขาอากาอิ', 'ภูเขาอากินะ'],
      'answer': 'ภูเขาอากินะ',
    },
    {
      'question': 'ทีม Night Kids เป็นเจ้าถิ่นของภูเขาอะไร?',
      'options': ['ภูเขาอุซุย', 'ภูเขาเมียวงิ', 'ภูเขาอากาอิ', 'ภูเขาอากินะ'],
      'answer': 'ภูเขาเมียวงิ',
    },
    {
      'question': 'ทีม RedSuns เป็นเจ้าถิ่นของภูเขาอะไร?',
      'options': ['ภูเขาอุซุย', 'ภูเขาเมียวงิ', 'ภูเขาอากาอิ', 'ภูเขาอากินะ'],
      'answer': 'ภูเขาอากาอิ',
    },
    {
      'question': 'Mazda Rx-7 ใครเป็นคนขับ?',
      'options': ['ทาคุมิ', 'เรียวสุเกะ', 'อิเคทานิ', 'เคสุเกะ'],
      'answer': 'เคสุเกะ',
    },
  ];

  List<int> questionIndexes = [];
  int currentQuestionIndex = 0;
  int score = 0;
  bool quizCompleted = false;

  Timer? _timer;
  int _secondsRemaining = 60; // กำหนดการจับเวลา 60 วินาทีปรับแก้ได้

  @override
  void initState() {
    super.initState();
    _startQuiz();
  }

  void _startQuiz() {
    // Randomize the question order
    questionIndexes = List<int>.generate(questions.length, (index) => index);
    questionIndexes.shuffle();

    // Reset timer and score
    score = 0;
    _secondsRemaining = 60;
    quizCompleted = false;

    // Start the timer
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _completeQuiz();
        }
      });
    });

    // Reset current question index
    currentQuestionIndex = 0;
  }

  void _nextQuestion(String selectedOption) {
    if (selectedOption ==
        questions[questionIndexes[currentQuestionIndex]]['answer']) {
      score++; //เพิ่ม 1 คะแนน score = score +100;
    }

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      _completeQuiz();
    }
  }

  void _completeQuiz() {
    _timer?.cancel();
    setState(() {
      quizCompleted = true;
    });
  }

  @override
  void dispose() {
    // ยกเลิกการเริ่มจับเวลาหากแค่เปิดหน้านี้มาเฉย ๆ แล้วกดไปหน้าอื่น
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (quizCompleted) {
      return Scaffold(
         backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("ท่านทำแบบทดสอบเสร็จสิ้นแล้ว", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black,
        ),
         body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('คะแนนทั้งหมดที่ทำได้: $score/${questions.length}', style: TextStyle(color: Colors.white)),
              Text('เวลาที่ใช้ไป: $_secondsRemaining seconds remaining', style: TextStyle(color: Colors.white)),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _startQuiz();
                  });
                },
                style: ElevatedButton.styleFrom(
  backgroundColor: Colors.white, // พื้นหลังของปุ่ม
  foregroundColor: Colors.black, // สีของข้อความในปุ่ม
  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
),
                child: Text('เริ่มทำแบบทดสอบใหม่'),
              ),
            ],
          ),
        ),
      );
    }

    var currentQuestion = questions[questionIndexes[currentQuestionIndex]];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("แบบทดสอบ", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'จำนวนข้อคำถาม ${currentQuestionIndex + 1}/${questions.length}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(currentQuestion['question'], style: TextStyle(fontSize: 18, color: Colors.white)),
            SizedBox(height: 20),
            ...currentQuestion['options'].map<Widget>((option) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: ElevatedButton(
                  onPressed: () => _nextQuestion(option),
                  style: ElevatedButton.styleFrom(
  backgroundColor: Colors.white, // พื้นหลังของปุ่ม
  foregroundColor: Colors.black, // สีของข้อความในปุ่ม
  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
),
                  child: Text(option),
                ),
              );
            }).toList(),
            Spacer(),
            Text('เวลาคงเหลือ: $_secondsRemaining seconds', style: TextStyle(fontSize: 16, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
