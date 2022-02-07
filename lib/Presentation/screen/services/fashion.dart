import 'package:agility_app/Bloc/fashion/fashion_bloc.dart';
import 'package:agility_app/Data/Repositiory/fashion_repo.dart';
import 'package:agility_app/Presentation/constants/const.dart';
import 'package:agility_app/Presentation/screen/services/add_fashion.dart';
import 'package:agility_app/Presentation/widget/error.dart';
import 'package:agility_app/Presentation/widget/http_error.dart';
import 'package:agility_app/Presentation/widget/loader.dart';
import 'package:agility_app/Presentation/widget/no_data_widget.dart';
import 'package:agility_app/Presentation/widget/users_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FashionScreen extends StatefulWidget {
  const FashionScreen({Key? key}) : super(key: key);
  static String routeName = "/fashion";

  @override
  _FashionScreenState createState() => _FashionScreenState();
}

class _FashionScreenState extends State<FashionScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocProvider(
      lazy: false,
      create: (context) =>
          FashionBloc(FashionRepository())..add(FetchFashion()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "Fashion Designers",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/fashion.jpeg',
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  color: Colors.black.withOpacity(0.5),
                  colorBlendMode: BlendMode.darken,
                ),
                Positioned(
                  top: height / 30,
                  left: width / 4,
                  child: Column(
                    children: const [
                      Text(
                        "Call or Chat",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35),
                      ),
                      Text(
                        "Fashion Designers in Agility",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ],
                  ),
                )
              ],
            ),
            BlocBuilder<FashionBloc, FashionState>(
              builder: (context, state) {
                if (state is FashionLoading) {
                  return const Loader(
                    minusHeight: 300,
                  );
                }
                if (state is FashionLoaded) {
                  return UsersCard(state.data);
                } else if (state is FashionHttpError) {
                  return const FashionHttpErrorWidget();
                } else if (state is FashionNoData) {
                  return const NoDataWidget(
                      mesg: "No Fashion Designer Registered yet");
                } else {
                  return const CustomError();
                }
              },
            )
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: primaryCol,
        //   onPressed: () {
        //     Navigator.of(context).pushNamed(AddService.routeName);
        //   },
        //   child: const Icon(
        //     Icons.add,
        //   ),
        // ),
      ),
    );
  }
}

class FashionHttpErrorWidget extends StatelessWidget {
  const FashionHttpErrorWidget({
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
                Navigator.popAndPushNamed(context, FashionScreen.routeName);
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
