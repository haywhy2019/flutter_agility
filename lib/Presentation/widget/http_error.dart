import 'package:agility_app/Bloc/fashion/fashion_bloc.dart';
import 'package:agility_app/Presentation/constants/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class HttpErrorWidget extends StatelessWidget {
  // final context;
  const HttpErrorWidget({
    // this.context,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 3.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.wifi_off,
            size: 40,
            color: Colors.black54,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "No Internet Connection",
            style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size.fromWidth(200),
                primary: primaryCol,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              onPressed: () {
                context.read<FashionBloc>().add(ResetAddFashion());
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
    );
  }
}
