import 'package:agility_app/Presentation/constants/const.dart';
import 'package:agility_app/presentation/constants/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import "../../../Data/Models/users.dart";
import 'package:url_launcher/url_launcher.dart' as url_launcher;

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
              Expanded(
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Card(
                            child: SizedBox(
                              height: 120,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: CircleAvatar(
                                      radius: 45,
                                      child: Image.asset(
                                        data[index].image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          data[index].name,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25),
                                        ),
                                        Text(data[index].title,
                                            style: detailTitle),
                                        Text(data[index].phoneNumber.toString(),
                                            style: detailTitle),
                                        Text(data[index].whatsapp,
                                            style: detailTitle),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                url_launcher.launch(
                                                    "tel://0+${data[index].phoneNumber}");
                                              },
                                              child: const Icon(
                                                Icons.phone,
                                              ),
                                            ),
                                            const Icon(MyFlutterApp.whatsapp)
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
