// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:agility_app/Presentation/constants/const.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Agility Services',
            style: TextStyle(
                color: primaryCol, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.comment_bank_outlined,
            color: primaryCol,
          ),
        ],
      ),
    );
  }
}
