import 'package:flutter/material.dart';
import 'package:instagram_clone/features/follow/follow.dart';
import 'package:instagram_clone/features/home/home.dart';
import 'package:instagram_clone/features/loading/loading.dart';
import 'package:instagram_clone/features/login/login.dart';
import 'package:instagram_clone/features/storage/sharedPreferences.dart';

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
      home: const LocalStorage(),
      // routes: <String, WidgetBuilder>{
      //   '/home': (BuildContext context) => const Home(title: 'Instagram'),
      //   '/follow': (BuildContext context) => const Follow(),
      // },
    );
  }
}
