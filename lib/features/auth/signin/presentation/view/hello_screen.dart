import 'package:flutter/material.dart';

class HelloScreen extends StatelessWidget {
  const HelloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hello")),
      body: const Center(
        child: Text(
          "Hello, you are logged in!",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
