import 'package:agility_app/Bloc/plumbing/plumbing_bloc.dart';
import 'package:agility_app/Data/Repositiory/plumbing_repo.dart';
import 'package:agility_app/Presentation/constants/const.dart';
import 'package:agility_app/Presentation/screen/services/add_plumber.dart';
import 'package:agility_app/Presentation/widget/error.dart';
import 'package:agility_app/Presentation/widget/loader.dart';
import 'package:agility_app/Presentation/widget/no_data_widget.dart';
import 'package:agility_app/Presentation/widget/users_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlumbingScreen extends StatefulWidget {
  const PlumbingScreen({Key? key}) : super(key: key);
  static String routeName = "/plumbing";

  @override
  _PlumbingScreenState createState() => _PlumbingScreenState();
}

class _PlumbingScreenState extends State<PlumbingScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocProvider(
      lazy: false,
      create: (context) =>
          PlumbingBloc(PlumbingRepository())..add(const FetchPlumbing()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "Plumbers",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/plumbing.jpeg',
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
                        "Book Plumbers",
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
            BlocBuilder<PlumbingBloc, PlumbingState>(
              builder: (context, state) {
                if (state is PlumbingLoading) {
                  return const Loader(
                    minusHeight: 300,
                  );
                }
                if (state is PlumbingLoaded) {
                  return UsersCard(state.data);
                } else if (state is PlumbingHttpError) {
                  return const PlumbingHttpErrors();
                } else if (state is PlumbingNoData) {
                  return const NoDataWidget(mesg: "No Plumbers Registered yet");
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
        //     Navigator.of(context).pushNamed(AddNewPlumber.routeName);
        //   },
        //   child: const Icon(
        //     Icons.add,
        //   ),
        // ),
      ),
    );
  }
}

class PlumbingHttpErrors extends StatelessWidget {
  const PlumbingHttpErrors({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 300,
      child: Center(
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
                  Navigator.popAndPushNamed(context, PlumbingScreen.routeName);
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
