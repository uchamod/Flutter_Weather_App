import 'package:flutter/material.dart';
import 'package:whether_app/util/constant.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horPad, vertical: verPad),
        ),
      ),
    );
  }
}
