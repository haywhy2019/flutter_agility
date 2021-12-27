import 'package:flutter/material.dart';

class ImageNetworkError extends StatelessWidget {
  // outPop;
  const ImageNetworkError({
    // this.context,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.broken_image_rounded,
            size: 40,
            color: Colors.red,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "An Error Occured",
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
