import 'package:agility_app/Presentation/constants/const.dart';
import 'package:agility_app/Presentation/constants/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class UsersCard extends StatelessWidget {
  final data;
  const UsersCard(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Card(
                  child: SizedBox(
                    height: 100,
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      final Uri launchUri = Uri(
                                        scheme: 'tel',
                                        path: '0+${data[index].phoneNumber}',
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
                                        "https://wa.me/0${data[index].phoneNumber}",
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
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                data[index].name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(data[index].title, style: detailTitle),
                              Text(data[index].phoneNumber.toString(),
                                  style: detailTitle),
                              Text(data[index].whatsApp, style: detailTitle),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.end,
                              //   children: [
                              //     GestureDetector(
                              //       onTap: () {
                              //         final Uri launchUri = Uri(
                              //           scheme: 'tel',
                              //           path: '0+${data[index].phoneNumber}',
                              //         );

                              //         url_launcher.launch(launchUri.toString());
                              //         // url_launcher.launch(
                              //         //     "tel://0+${data[index].phoneNumber}");
                              //       },
                              //       child: const Padding(
                              //         padding: EdgeInsets.only(right: 10),
                              //         child: Icon(
                              //           Icons.phone,
                              //           color: Colors.green,
                              //         ),
                              //       ),
                              //     ),
                              //     GestureDetector(
                              //       onTap: () {
                              //         url_launcher.launch(
                              //           "https://wa.me/0${data[index].phoneNumber}",
                              //           forceSafariVC: false,
                              //           forceWebView: false,
                              //         );
                              //       },
                              //       child: const Padding(
                              //         padding: EdgeInsets.only(right: 12),
                              //         child: Icon(
                              //           MyFlutterApp.whatsapp,
                              //           color: Colors.green,
                              //         ),
                              //       ),
                              //     )
                              //   ],
                              // )
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
