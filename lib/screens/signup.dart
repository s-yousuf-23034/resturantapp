import 'package:flutter/material.dart';

import 'widgets/my_text_field.dart';

class SignUp extends StatefulWidget {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  RegExp regExp = RegExp(SignUp.pattern as String);
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  String? validation() {
    if (firstName.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'First Name cannot be Empty',
        ),
      ));
    }
    if (lastName.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Last Name cannot be Empty',
        ),
      ));
    } else if (firstName.text.trim().length < 3 ||
        lastName.text.trim().length < 3) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Text must be at least 3 characters'),
        ),
      );
    }

    if (email.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Email cannot be Empty',
        ),
      ));
    } else if (!regExp.hasMatch(email.text)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Please enter the valid Email',
        ),
      ));
    }
    if (password.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Password cannot be Empty',
        ),
      ));
    } else if (password.text.trim().length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password length must be at least 8.'),
        ),
      );
    } else if (confirmPassword.text != password.text) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Confirm password do not match',
        ),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Registered Successfully',
        ),
      ));
    }
  }

  Widget button({
    required String buttonName,
    required Color color,
    required Color textcolor,
  }) {
    return ElevatedButton(
      child: Text(
        buttonName,
        style: TextStyle(fontWeight: FontWeight.bold, color: textcolor),
      ),
      style: TextButton.styleFrom(
        minimumSize: Size(150, 45),
        backgroundColor: color,
        side: BorderSide(color: Colors.green, width: 2),
        shape: StadiumBorder(),
      ),
      onPressed: () {
        validation();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      //backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Sign Up',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    MyTextField(
                      controller: firstName,
                      length: 20,
                      value: false,
                      hinttext: 'First Name',
                      labeltext: 'First Name',
                      color: Colors.green,
                      type: TextInputType.name,
                      action: TextInputAction.next,
                    ),
                    MyTextField(
                      controller: lastName,
                      length: 20,
                      value: false,
                      hinttext: 'Last Name',
                      labeltext: 'Last Name',
                      color: Colors.green,
                      type: TextInputType.name,
                      action: TextInputAction.next,
                    ),
                    MyTextField(
                      controller: email,
                      length: 30,
                      value: false,
                      hinttext: 'Your Email',
                      labeltext: 'Email',
                      color: Colors.green,
                      type: TextInputType.emailAddress,
                      action: TextInputAction.next,
                    ),
                    MyTextField(
                      controller: password,
                      length: 20,
                      value: true,
                      hinttext: 'Password',
                      labeltext: 'Password',
                      color: Colors.green,
                      type: TextInputType.text,
                      action: TextInputAction.next,
                    ),
                    MyTextField(
                      controller: confirmPassword,
                      length: 20,
                      value: true,
                      hinttext: 'Confirm Password',
                      labeltext: 'Confirm Password',
                      color: Colors.green,
                      type: TextInputType.text,
                      action: TextInputAction.done,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    button(
                        buttonName: 'Cancel',
                        color: Colors.grey,
                        textcolor: Colors.white),
                    button(
                        buttonName: 'Register',
                        color: Colors.green,
                        textcolor: Colors.white),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
