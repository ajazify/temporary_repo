import 'package:flutter/material.dart';

import 'my_future_ui.dart';

class MyFutureUI extends StatelessWidget {
  MyFutureUI({super.key});
  @override
  Widget build(BuildContext context) {
    MyFutureLogic myFutureLogic = MyFutureLogic();
    // String name =  myFutureLogic.getData();
    return Scaffold(
      // body: Center(
      //   child: FutureBuilder(
      //     future: ,builder: (BuildContext context,  ),
      //     child: Text(name)),
      // ),
    );
  }
}
