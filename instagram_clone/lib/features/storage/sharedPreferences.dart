import 'package:flutter/material.dart';
import 'package:instagram_clone/features/storage/sharedPref.dart';

class LocalStorage extends StatelessWidget {
  const LocalStorage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 40,
            right: 40,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: controller,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        SharedPref sharedPref = SharedPref();
                        sharedPref.store(key: KeyConst.NAMEKEY, v: controller.text);
                      },
                      child: const Text('Set Notes')),
                  ElevatedButton(
                      onPressed: () {
                        SharedPref sharedPref = SharedPref();
                        sharedPref.getValue(key: KeyConst.NAMEKEY,);
                      },
                      child: const Text('Get Notes')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
