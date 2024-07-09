import 'package:flutter/material.dart';

class Futurewidget extends StatefulWidget {
  Futurewidget({super.key});

  @override
  State<Futurewidget> createState() => _FuturewidgetState();
}

class _FuturewidgetState extends State<Futurewidget> {
  Future<String>? caller;

  String name = '';

  Future<String> _startDelayedFunction() async {
    print('Started');
    Future.delayed(const Duration(seconds: 6), () { 
      print('This is a delayed Display');
      //jasdvajd

      name = 'Muhammed Ajas : Developer';
    });
    return name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextButton(
                onPressed: () {
                  setState(() {
                    caller = _startDelayedFunction();
                  });
                },
                child: const Text('Click to start')),
            FutureBuilder<String>(
                future: caller,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    print('here connection waiting');
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    print('here as error');
                    return const Text('Errro Occered');
                  } else if (snapshot.hasData) {
                    return Text('${snapshot.data}');
                  } else {
                    print('here no value');
                    return const Text('Try Clicking Button');
                  }
                }),
          ],
        ),
      ),
    );
  }
}
