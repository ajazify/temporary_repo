import 'package:flutter/material.dart';

class MyRadioButton extends StatefulWidget {
  const MyRadioButton({super.key});

  @override
  State<MyRadioButton> createState() => _MyRadioButtonState();
}

class _MyRadioButtonState extends State<MyRadioButton> {
  Gender? gender = Gender.male;
  bool isCheckedDeveloper = false;
  bool isCheckedDesigner = false;

  // dropdown

  String dropdownvalue = 'Choose';
  List<String> items = ['Choose', 'Developer', 'Designer', 'Digital Marketer'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              ListTile(
                title: const Text('Male'),
                leading: Radio<Gender>(
                  value: Gender.male,
                  groupValue: gender,
                  onChanged: (Gender? value) {
                    setState(() {
                      gender = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Female'),
                leading: Radio<Gender>(
                  value: Gender.female,
                  groupValue: gender,
                  onChanged: (Gender? value) {
                    setState(() {
                      gender = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Other'),
                leading: Radio<Gender>(
                  value: Gender.other,
                  groupValue: gender,
                  onChanged: (Gender? value) {
                    setState(() {
                      gender = value;
                    });
                  },
                ),
              ),
              Column(
                children: [
                  ListTile(
                    title: const Text('Iam a developer!'),
                    leading: Checkbox(
                      checkColor: Colors.white,
                      value: isCheckedDeveloper,
                      onChanged: (bool? value) {
                        setState(() {
                          isCheckedDeveloper = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Iam a Designer!'),
                    leading: Checkbox(
                      checkColor: Colors.white,
                      value: isCheckedDesigner,
                      onChanged: (bool? value) {
                        setState(() {
                          isCheckedDesigner = value!;
                        });
                      },
                    ),
                  ),
                  const Divider(),
                  const Text('Choose Language'),
                  DropdownButton(
                      value: dropdownvalue,
                      icon: const Icon(Icons.arrow_drop_down),
                      items: items.map((String v) {
                        return DropdownMenuItem(
                            value: v,
                            child: Text(v));
                      }).toList(),
                      onChanged: (v) {
                        setState(() {
                          dropdownvalue = v ?? ' No Value';
                        });
                      })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

enum Gender { male, female, other }
