import 'package:agility_app/Presentation/constants/const.dart';
import 'package:agility_app/Presentation/constants/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:basic_utils/basic_utils.dart';

// ignore: unnecessary_this

class UsersCard extends StatelessWidget {
  final data;
  const UsersCard(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String whatsappText =
        "hello%2C%20i%20saw%20your%20number%20on%20the%20agility%20app%20that%20you%20offer%20a%20service.%20i%20am%20chating%20to%20make%20enquires%20about%20it.";
    return Expanded(
        child: ListView.builder(
            // physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Card(
                  child: SizedBox(
                    height: 120,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                child: Image.asset(
                                  "assets/images/man.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                StringUtils.truncate(
                                    StringUtils.capitalize(data[index].name),
                                    15),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                  StringUtils.truncate(
                                      StringUtils.capitalize(data[index].title),
                                      20),
                                  style: detailTitle),
                              Text(data[index].phoneNumber.toString(),
                                  style: detailTitle),
                              // Text(data[index].whatsApp, style: detailTitle),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      final Uri launchUri = Uri(
                                        scheme: 'tel',
                                        path: '${data[index].phoneNumber}',
                                      );

                                      url_launcher.launch(launchUri.toString());
                                      // url_launcher.launch(
                                      //     "tel://0+${data[index].phoneNumber}");
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Icon(
                                        Icons.phone,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      url_launcher.launch(
                                        "https://wa.me/${data[index].phoneNumber}/?text=$whatsappText",
                                        forceSafariVC: false,
                                        forceWebView: false,
                                      );
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.only(right: 12),
                                      child: Icon(
                                        MyFlutterApp.whatsapp,
                                        color: Colors.green,
                                      ),
                                    ),
                                  )
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
            }));
  }
}
