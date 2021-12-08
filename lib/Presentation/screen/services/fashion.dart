import 'package:agility_app/Presentation/constants/const.dart';
import 'package:agility_app/Presentation/screen/services/add_fashion.dart';
import 'package:agility_app/Presentation/widget/users_card.dart';
import 'package:flutter/material.dart';
import "../../../Data/Models/users.dart";

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Fashion Designers",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/images/fashion.jpeg',
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    color: Colors.black.withOpacity(0.5),
                    colorBlendMode: BlendMode.darken,
                  ),
                  Positioned(
                    top: height / 12,
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
                        )
                      ],
                    ),
                  )
                ],
              ),
              UsersCard(data)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryCol,
        onPressed: () {
          Navigator.of(context).pushNamed(AddService.routeName);
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
