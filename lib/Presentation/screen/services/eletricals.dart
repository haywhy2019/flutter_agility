import 'package:flutter/material.dart';

class ElectricalScreen extends StatefulWidget {
  const ElectricalScreen({Key? key}) : super(key: key);
  static String routeName = "/electricals";

  @override
  _ElectricalScreenState createState() => _ElectricalScreenState();
}

class _ElectricalScreenState extends State<ElectricalScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Electrical screen"),
    );
  }
}
