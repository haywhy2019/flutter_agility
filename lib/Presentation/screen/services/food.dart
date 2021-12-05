import 'package:flutter/material.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({Key? key}) : super(key: key);
  static String routeName = "/food";

  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("fashion screen"),
    );
  }
}
