import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

//Guestor Detector
class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 350,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Column(
                children: [
                  const Gap(20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'English (India)',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Gap(10),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                  const Gap(150),
                  SizedBox(
                    width: 150,
                    child: Image.network('assets/images/Instagram_logo.png'),
                  ),
                  const Gap(40),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Phone Number, email or username',
                      hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const Gap(10),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
                      suffixIcon: Icon(Icons.visibility),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const Gap(15),
                  SizedBox(
                    width: 400,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        foregroundColor: WidgetStateProperty.all(Colors.white),
                        backgroundColor: WidgetStateProperty.all(Colors.blue),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      child: const Text(
                        'Log in',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const Gap(15),
                  GestureDetector(
                    onTap: () {
                      print('Logging in..');
                    },
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Colors.grey),
                        text: 'Forgot your login details?',
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Get help logging in.',
                              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                  const Gap(5),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(
                          indent: 20.0,
                          endIndent: 10.0,
                          thickness: 1,
                        ),
                      ),
                      Text(
                        "OR",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Expanded(
                        child: Divider(
                          indent: 10.0,
                          endIndent: 20.0,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  TextButton(
                    onPressed: () {
                      _showMyDialog(context: context);
                    },
                    child: const Text(
                      'Log in with Facebook',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const Spacer(),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(color: Colors.grey),
                      text: 'Dont have an account?',
                      children: [
                        TextSpan(text: 'Sign up', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey)),
                      ],
                    ),
                  ),
                  const Gap(20)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void tappedSend() {
  print('Called an another fuction and print performed');
}

dynamic _showMyDialog({required BuildContext context}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirm Facebook Login!'),
        content: const Text('Would you like to login with your facebook account'),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              // go back to login
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Login'),
            onPressed: () {
              //go to home
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/home');
            },
          ),
        ],
      );
    },
  );
}
