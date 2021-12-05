// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:agility_app/Data/Models/home_slider.dart';
import 'package:agility_app/Data/Repositiory/firebase_api.dart';
import 'package:agility_app/Data/Repositiory/home_slider_repository.dart';
import 'package:agility_app/Presentation/constants/const.dart';
import 'package:agility_app/Presentation/widget/grid_items.dart';
import 'package:flutter/material.dart';
import 'add_images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<FirebaseFile>> futureFiles;
  late bool showDIalog;
  late bool _isInit;
  @override
  void initState() {
    // TODO: implement initState
    futureFiles = FirebaseApi.listAll('home/');
    showDIalog = true;
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Future.delayed(Duration(seconds: 3), () {
      popUpNotice();
    });
 
  }

  popUpNotice() {
    showAlertDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            FutureBuilder<List<FirebaseFile>>(
                future: futureFiles,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    default:
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Some error occured'),
                        );
                      } else {
                        final files = snapshot.data!;

                        return SizedBox(
                          height: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: files.length,
                                      itemBuilder: (context, index) {
                                        final file = files[index];
                                        return buildFile(context, file);
                                      })),
                            ],
                          ),
                        );
                      }
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
                    TextButton(
                        onPressed: () {
                          showAlertDialog(context);
                        },
                        child: Text("press"))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridContainer(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddImages.routeName);
        },
        child: Icon(Icons.add),
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
        width: mobileWidth,
        height: 400,
        fit: BoxFit.cover,
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
      Positioned(
        bottom: 20,
        width: mobileWidth,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    file.name,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    ],
  );
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      "Notice",
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    content: SizedBox(
      height: 200,
      child: Column(
        children: [Text("helooo")],
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
