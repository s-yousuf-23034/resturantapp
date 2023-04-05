import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Widget button(
    @required String name,
    Color color,
    Color textcolor,
  ) {
    return ElevatedButton(
      child: Text(
        name,
        style: TextStyle(fontWeight: FontWeight.bold, color: textcolor),
      ),
      style: TextButton.styleFrom(
        minimumSize: Size(300, 45),
        backgroundColor: color,
        side: BorderSide(color: Colors.green, width: 2),
        shape: StadiumBorder(),
      ),
      onPressed: () {},
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      Padding(
        padding: const EdgeInsets.all(90.0),
        child: Image.asset(
          "assets/images/logo.png",
          fit: BoxFit.cover,
        ),
      ),
      Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          "Welcome to Yumz Foodz",
          style: TextStyle(
              fontSize: 22,
              color: Colors.lightGreen,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 30,
        ),
        Column(
          children: [
            Text(
              "Order the delicious foods and enjoy your day",
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
            SizedBox(
              height: 30,
            ),
            button("Login", Colors.green, Colors.white),
            SizedBox(
              height: 30,
            ),
            button("Sign Up", Colors.white, Colors.green),
          ],
        )
      ])
    ])));
  }
}
