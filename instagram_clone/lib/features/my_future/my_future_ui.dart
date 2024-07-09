import 'dart:async';

class MyFutureLogic {
  Future<String> getData() async {
    return Future.delayed(Duration(seconds: 2), () {
      return "Muhammed";
      // throw Exception("Custom Error");
    });
  }
}
