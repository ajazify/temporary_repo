import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyDateWidget extends StatelessWidget {
  MyDateWidget({super.key});

  final TextEditingController dateEC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextFormField(
              controller: dateEC,
              readOnly: true,
              onTap: () => mShowTimePicker(context),
            ),
          ],
        ),
      ),
    );
  }

  void mShowDialogue(BuildContext context) async {
    DateTime? dateTime = await showDatePicker(
        context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(3000));

    if (dateTime != null) {
      print(dateTime);
      String? formattedDate = DateFormat('EEE, dd-MM-yyy').format(dateTime);
      print(formattedDate);
      dateEC.text = formattedDate;
    }
  }

  void mShowTimePicker(BuildContext context) async {
    TimeOfDay? time = await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (time != null) {
      dateEC.text = '${time.hour}:${time.minute}';
    }
  }
}
