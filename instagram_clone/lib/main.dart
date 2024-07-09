import 'package:flutter/material.dart';

import 'features/todo/todo_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Clone',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Todo(),
      // routes: <String, WidgetBuilder>{
      //   '/home': (BuildContext context) => const Home(title: 'Instagram'),
      //   '/follow': (BuildContext context) => const Follow(),
      // },
    );
  }
}
