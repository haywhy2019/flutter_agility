import 'package:flutter/material.dart';

class PlumbingScreen extends StatefulWidget {
  const PlumbingScreen({Key? key}) : super(key: key);
  static String routeName = "/plumbing";

  @override
  _PlumbingScreenState createState() => _PlumbingScreenState();
}

class _PlumbingScreenState extends State<PlumbingScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("fashion screen"),
    );
  }
}
