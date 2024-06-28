import 'package:flutter/material.dart';

class StateHomeClass extends StatefulWidget {
  const StateHomeClass({super.key});

  @override
  State<StateHomeClass> createState() => _StateHomeClassState();
}

class _StateHomeClassState extends State<StateHomeClass> {
  // state
  int count = 0;

  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    if (count >= 1) {
      setState(() {
        count--;
      });
    } else {
      print('Atleast one count needed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                decrement();
              },
              child: Text('-')),
          Text(count.toString()),
          TextButton(
              onPressed: () {
                increment();
              },
              child: Text('+')),
        ],
      )),
    );
  }
}
