import 'package:agility_app/Presentation/constants/const.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final int minusHeight;
  const Loader({
    this.minusHeight = 0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - minusHeight,
      child: const Center(child: CircularProgressIndicator(color: primaryCol)),
    );
  }
}
