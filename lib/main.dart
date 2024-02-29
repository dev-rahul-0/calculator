import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> buttons = [
    'c',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: [
          Expanded(child: Container()),
          Expanded(
              flex: 2,
              child: Container(
                  child: GridView.builder(
                      itemCount: buttons.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4),
                      itemBuilder: (BuildContext, int index) {
                        if(index == 0) {
                          return MyButtons(
                            buttonText: buttons[index],
                            color: Colors.green,
                            textColor: Colors.white
                          );
                        }else if(index == 1) {
                          return MyButtons(
                            buttonText: buttons[index],
                            color: Colors.red,
                            textColor: Colors.white
                          );
                        } else {
                          return MyButtons(
                            buttonText: buttons[index],
                            color: isOperator(buttons[index]) ? Colors.deepPurple : Colors.deepPurple[50],
                            textColor: isOperator(buttons[index]) ? Colors.white : Colors.deepPurple,
                          );
                        }
                      }))),
        ],
      ),
    );
  }

  bool isOperator(String x){
    if(x == '%' || x == '/' ||x == 'x' ||x == '-' ||x == '+' ||x == '='){
      return true;
    }
    return false;
    }
}
