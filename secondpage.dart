import 'package:flutter/material.dart';

class SecondLayout extends StatelessWidget {
  final List<String> data;
  const SecondLayout({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("6701213018 - Emily Khadijah"),
      ),
    );
  }
}


