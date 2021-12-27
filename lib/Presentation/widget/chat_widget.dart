import 'package:agility_app/Presentation/constants/const.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChatBubble extends StatelessWidget {
  String res;
  // String step;
  ChatBubble({
    Key? key,
    required this.res,
    // required this.step,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Container(
        width: 200,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                  blurRadius: 20.0,
                  offset: Offset(10, 10),
                  color: Colors.black54)
            ],
            gradient: LinearGradient(
                colors: [primaryCol, Colors.purple],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        // constraints: const BoxConstraints(maxWidth: 250),
        padding: const EdgeInsets.all(15),
        child: Text(
          res,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
