import 'package:flutter/material.dart';

class NoDataWidget extends StatelessWidget {
  final String mesg;
  const NoDataWidget({
    required this.mesg,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1.7,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            children: [
              Image.asset("assets/images/waiting.png"),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  mesg,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
