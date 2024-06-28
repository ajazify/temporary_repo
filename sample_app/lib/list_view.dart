import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:gap/gap.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    List listOfMap = [
      {'name': 'Elwin', 'mail': '@gmail.com'},
      {'name': 'Sivadev', 'mail': '@gmail.com'},
      {'name': 'Saidhaly', 'mail': '@gmail.com'},
      {'name': 'Ajas', 'mail': '@gmail.com'},
      {'name': 'Elwin', 'mail': '@gmail.com'},
      {'name': 'Abdulla', 'mail': '@gmail.com'},
      {'name': 'Jothi', 'mail': '@gmail.com'},
      {'name': 'Elwin', 'mail': '@gmail.com'},
      {'name': 'Sivadev', 'mail': '@gmail.com'},
      {'name': 'Saidhaly', 'mail': '@gmail.com'},
      {'name': 'Ajas', 'mail': '@gmail.com'},
      {'name': 'Elwin', 'mail': '@gmail.com'},
      {'name': 'Abdulla', 'mail': '@gmail.com'},
      {'name': 'Jothi', 'mail': '@gmail.com'},
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: Text(
          'Contacts',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.separated(
          
          itemCount: listOfMap.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () { 
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Row(
                    children: [
                      Icon(
                        Icons.call,
                        color: Colors.white,
                      ),
                      Gap(10),
                      Text('Calling ${listOfMap[index]['name']}...')
                    ],
                  )),
                );
              },
              leading: CircleAvatar(
                backgroundColor: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
                child: Text(listOfMap[index]['name'][0]),
              ),
              title: Text(listOfMap[index]['name']),
              subtitle: Text(listOfMap[index]['mail']),
              trailing: Icon(Icons.navigate_next_rounded),
            );
          },
          separatorBuilder: (BuildContext context, int index) => Divider()),
    );
  }
}
