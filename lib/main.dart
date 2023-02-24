import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/quiz.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Quiz(0, 0));
  }
}

class Quiz extends StatefulWidget {
  Quiz(this.index, this.Score);
  int index;
  int Score;

  @override
  State<Quiz> createState() => _QuizState(index, Score);
}

var QuestionS = [
  Quizs("Captial of india", "Delhi", "Mumbai", "Agra", "Bengluru", "Delhi",
      [4, 1, 3, 2]),
  Quizs("Captial of banagalore", "Delhi", "Mumbai", "Agra", "Bengluru", "Delhi",
      [2, 4, 1, 3]),
  Quizs("Captial of chennai", "Delhi", "Mumbai", "Agra", "Bengluru", "Delhi",
      [3, 1, 4, 2]),
  Quizs("Captial of ap", "Delhi", "Mumbai", "Agra", "Bengluru", "Delhi",
      [1, 4, 2, 3]),
];

class _QuizState extends State<Quiz> {
  _QuizState(this.index, this.Score);
  int index;
  int Score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Quiz app"),
          backgroundColor: Colors.blue,
        ),
        body:
            // SingleChildScrollView(
            //   scrollDirection: Axis.vertical,
            //   child: Center(
            //       child: Column(children: [
            //     ListView.builder(
            //         itemCount: QuestionS.length,
            //         scrollDirection: Axis.vertical,
            //         shrinkWrap: true,
            //         itemBuilder: (item, index) {
            //           return
            Container(
          child: index < QuestionS.length
              ? Column(children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .1,
                  ),
                  Text(
                    QuestionS[index].question,
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .1,
                  ),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    children: [
                      Card(
                          child: GFButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Quiz(
                                            index + 1,
                                            Score +
                                                QuestionS[index].Points[0])));
                              },
                              child: Text(QuestionS[index].option1))),
                      SizedBox(
                        height: 30,
                        width: MediaQuery.of(context).size.width * .4,
                        child: Card(
                            child: GFButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Quiz(
                                              index + 1,
                                              Score +
                                                  QuestionS[index].Points[1])));
                                },
                                child: Text(QuestionS[index].option2))),
                      ),
                      Card(
                          child: GFButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Quiz(
                                            index + 1,
                                            Score +
                                                QuestionS[index].Points[2])));
                              },
                              child: Text(QuestionS[index].option3))),
                      Card(
                          child: GFButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Quiz(
                                            index + 1,
                                            Score +
                                                QuestionS[index].Points[3])));
                              },
                              child: Text(QuestionS[index].option4))),
                    ],
                  )
                ])
              : Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .1,
                      ),
                      Container(
                          child: Text(
                        "The quiz is $Score",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      )),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (c) => MyApp()),
                                (route) => false);
                          },
                          child: Text("GO back"))
                    ],
                  ),
                ),
        ));
  }
  // SizedBox.expand(
  //   child: ListView.builder(
  //       itemCount: question.length,
  //       itemBuilder: (items, index) {
  //         return Card(
  //             child: Column(children: [
  //           Text(question[index]["question"] as String),
  //           ListView.builder(
  //               itemCount: 4,
  //               itemBuilder: (items, index) {
  //                 return Text("this is th e answere");
  //               })
  //         ]));
  //       }),
  // )
}

// class Calculator extends StatefulWidget {
//   @override
//   _CalculatorState createState() => _CalculatorState();
// }

// class _CalculatorState extends State<Calculator> {
//   TextEditingController num1 = TextEditingController();
//   TextEditingController num2 = TextEditingController();
//   int result = 0;

//   void add() {
//     setState(() {
//       result = int.parse(num1.text) + int.parse(num2.text);
//     });
//   }

//   void subtract() {
//     setState(() {
//       result = int.parse(num1.text) - int.parse(num2.text);
//     });
//   }

//   void multiply() {
//     setState(() {
//       result = int.parse(num1.text) * int.parse(num2.text);
//     });
//   }

//   void divide() {
//     setState(() {
//       result = int.parse(num1.text) ~/ int.parse(num2.text);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Calculator App'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: num1,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(hintText: 'Enter a number'),
//             ),
//             TextField(
//               controller: num2,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(hintText: 'Enter a number'),
//             ),
//             SizedBox(height: 16.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 GFButton(
//                   child: Text('+'),
//                   onPressed: add,
//                 ),
//                 GFButton(
//                   child: Text('-'),
//                   onPressed: subtract,
//                 ),
//                 GFButton(
//                   child: Text('*'),
//                   onPressed: multiply,
//                 ),
//                 GFButton(
//                   child: Text('/'),
//                   onPressed: divide,
//                 ),
//               ],
//             ),
//             SizedBox(height: 16.0),
//             Text(
//               'Result: $result',
//               style: TextStyle(fontSize: 24.0),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
