import 'package:flutter/material.dart';
import 'boarding.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BoardingScreen()),
            );
          },
          child: Text('Next'),
        ),
      ),
    );
  }
}