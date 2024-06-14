import 'package:facebook_ui/demo.dart';
import 'package:flutter/material.dart';

class FacebookLogin extends StatelessWidget {
  const FacebookLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.grey[200],
          width: 500,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //1st
              Text(
                'facebook',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.blue[600]),
              ),
              //2nd
              SizedBox(
                width: 460,
                child: Card(
                  color: Colors.white,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        //1
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'Log in to facebook',
                            style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                        ),
                        //2
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Invalid username';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Email Address of Phone Number',
                                  labelText: 'Enter here',
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              gap(hval: 10),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'invalid password';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  labelText: 'Enter here',
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              gap(hval: 10),
                              SizedBox(
                                height: 45.0,
                                width: double.infinity,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
                                        foregroundColor: WidgetStateProperty.all(Colors.white),
                                        backgroundColor: WidgetStateProperty.all(Colors.blue[600])),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(content: Text('Processing Data')),
                                        );
                                      }
                                    },
                                    child: Text('Log in')),
                              ),
                              gap(hval: 10),
                              TextButton(onPressed: () {}, child: Text('Forgotten account?')),
                              Row(
                                children: [
                                  Expanded(flex: 4, child: Divider()),
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        'or',
                                        textAlign: TextAlign.center,
                                      )),
                                  Expanded(flex: 4, child: Divider()),
                                ],
                              ),
                              gap(hval: 10.0),
                              SizedBox(
                                height: 45.0,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
                                        foregroundColor: WidgetStateProperty.all(Colors.white),
                                        backgroundColor: WidgetStateProperty.all(Colors.green[500])),
                                    onPressed: () {},
                                    child: Text('Create new account')),
                              ),
                              gap(hval: 40)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              gap(hval: 20),
            ],
          ),
        ),
      ),
    );
  }
}
