import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/my_text_field.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final GlobalKey<ScaffoldState> formKey = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    return Scaffold(
      key: formKey,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Login',
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
                        action: TextInputAction.done,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      InkWell(
                        onTap: () {
                          print("Forgot Password?");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 15.5,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                ElevatedButton(
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  style: TextButton.styleFrom(
                    minimumSize: Size(300, 45),
                    backgroundColor: Colors.green,
                    shape: StadiumBorder(),
                  ),
                  onPressed: () {
                    print("Login Button");
                  },
                ),
                Row(children: <Widget>[
                  Expanded(
                      child: Divider(
                    indent: 5.0,
                    endIndent: 5.0,
                    thickness: 3.5,
                  )),
                  SizedBox(
                    height: 60.0,
                  ),
                  Text(
                    "OR CONTINUE WITH",
                    style:
                        TextStyle(color: Colors.blueGrey, fontFamily: 'Hind'),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  Expanded(
                      child: Divider(
                    indent: 5.0,
                    endIndent: 5.0,
                    thickness: 3.5,
                  )),
                ]),
                SizedBox(
                  height: 8,
                ),
                const SocialSignUp(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SocialSignUp extends StatelessWidget {
  const SocialSignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            print('Facebook');
          },
          child: Container(
              width: 140,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.blue[900],
                border: Border.all(
                  width: 2,
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(50.0),
              ),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SvgPicture.asset(
                  'assets/images/facebook.svg',
                  height: 20,
                  width: 20,
                  color: Colors.white,
                ),
                Text(
                  " Facebook",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ])),
        ),
        GestureDetector(
          onTap: () {
            print('Google');
          },
          child: Container(
              width: 140,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(
                  width: 2,
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(50.0),
              ),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SvgPicture.asset(
                  'assets/images/google.svg',
                  height: 20,
                  width: 20,
                  color: Colors.white,
                ),
                Text(
                  " Google",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ])),
        ),
      ],
    );
  }
}
