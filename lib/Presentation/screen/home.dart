// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:agility_app/Data/Models/home_slider.dart';
import 'package:agility_app/Data/Repositiory/home_slider_repository.dart';
import 'package:agility_app/Presentation/constants/const.dart';
import 'package:agility_app/Presentation/widget/grid_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "../../Bloc/home/home_slider_bloc.dart";
import 'add_images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = "/home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<FirebaseFile>> futureFiles;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeSliderBloc(HomeSliderRepository())..add(GetSlider("home/")),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Info's & annocements",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<HomeSliderBloc, HomeSliderState>(
                  builder: (context, state) {
                if (state is HomeSliderInitial) {
                  return Image.asset(
                    "assets/images/image_error.png",
                    height: 400,
                    width: 400,
                    fit: BoxFit.cover,
                    color: Colors.black26,
                    colorBlendMode: BlendMode.darken,
                  );
                } else if (state is HomeSliderLoaded) {
                  return SizedBox(
                    height: 400,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 1,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.slider.length,
                                itemBuilder: (context, index) {
                                  final file = state.slider[index];
                                  return buildFile(context, file);
                                })),
                      ],
                    ),
                  );
                } else if (state is HomeSliderHttpError) {
                  return Image.asset(
                    "assets/images/image_error.png",
                    height: 400,
                    width: 400,
                    fit: BoxFit.cover,
                    color: Colors.black26,
                    colorBlendMode: BlendMode.darken,
                  );
                } else {
                  return Image.asset(
                    "assets/images/image_error.png",
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    color: Colors.black26,
                    colorBlendMode: BlendMode.darken,
                  );
                }
              }),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Explore Essentials",
                        style: mainHeading,
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "Services",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: primaryCol,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      // TextButton(
                      //     onPressed: () {
                      //       showAlertDialog(context);
                      //     },
                      //     child: Text("press"))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: GridContainer(),
              ),
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: primaryCol,
        //   onPressed: () {
        //     Navigator.of(context).pushNamed(AddImages.routeName);
        //   },
        //   child: Icon(Icons.add),
        // ),
      ),
    );
  }
}

Widget buildFile(BuildContext context, FirebaseFile file) {
  double mobileWidth = MediaQuery.of(context).size.width;
  return Stack(
    children: [
      Image.network(
        file.url,
        width: 400,
        height: 400,
        fit: BoxFit.fill,
        color: Colors.black26,
        colorBlendMode: BlendMode.darken,
      ),
      Positioned(
        top: 20,
        right: 20,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(15),
              right: Radius.circular(15),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            children: [
              Text(
                (file.index + 1).toString(),
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
              Text("/", style: TextStyle(color: Colors.white, fontSize: 10)),
              Text(
                (file.length).toString(),
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ],
          ),
        ),
      ),
      // Positioned(
      //   bottom: 20,
      //   width: mobileWidth,
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 15),
      //     child: Row(
      //       crossAxisAlignment: CrossAxisAlignment.end,
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Text(
      //               file.name,
      //               style: TextStyle(
      //                   fontSize: 15,
      //                   color: Colors.white,
      //                   fontWeight: FontWeight.bold),
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // )
    ],
  );
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),
    child: Text(
      "OK",
      style: TextStyle(color: primaryCol, fontWeight: FontWeight.bold),
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: primaryCol,
    title: Text(
      "Notice",
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    ),
    content: SizedBox(
      height: 100,
      child: Column(
        children: [
          Text(
            "We do not have any partnership with the services listed here, We just make it easy for you to access this services.",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
