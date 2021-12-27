import 'package:flutter/material.dart';

class CustomError extends StatelessWidget {
  // final context;
  const CustomError({
    // this.context,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 300,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 40,
              color: Colors.red,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "An Error Occured",
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromWidth(200),
                  primary: Colors.red,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const SizedBox(
                  width: 50,
                  child: Text(
                    "Retry",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
