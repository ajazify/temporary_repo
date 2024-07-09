import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyDateManager extends StatelessWidget {
  MyDateManager({super.key});

  TextEditingController dateInput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: TextFormField(
            controller: dateInput,
            readOnly: true,
            onTap: () {
              _showMyTime(context: context);
            },
          ),
        ),
      ),
    );
  }

  void _showMyDate({required BuildContext context}) async {
    DateTime? rawDate = await showDatePicker(context: context, firstDate: DateTime(2000), lastDate: DateTime(2500));
    print(rawDate);

    var formattedDate = DateFormat('EEE, yyyy/MM/dd').format(rawDate ?? DateTime.now());
    dateInput.text = formattedDate;
    print(formattedDate);
  }

  Future _showMyTime({required BuildContext context}) async {
    try {
      TimeOfDay? rawTime = await showTimePicker(context: context, initialTime: TimeOfDay.now());
      print('rawTime######################################################### $rawTime');
    } catch (e) {
      print(e);
    }
  }   
}
