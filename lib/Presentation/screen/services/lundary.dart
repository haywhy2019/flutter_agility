import 'package:flutter/material.dart';

class LundaryScreen extends StatefulWidget {
  const LundaryScreen({Key? key}) : super(key: key);
  static String routeName = "/lundary";

  @override
  _LundaryScreenState createState() => _LundaryScreenState();
}

class _LundaryScreenState extends State<LundaryScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Lundary screen"),
    );
  }
}
