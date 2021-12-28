// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:agility_app/Presentation/constants/my_flutter_app_icons.dart';
import 'package:agility_app/Presentation/widget/chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class CommunityScreen extends StatefulWidget {
  CommunityScreen({Key? key}) : super(key: key);

  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    String businessText =
        "Good%20Day%2C%20i%20%20am%20chatting%20from%20agility%20App%2C%20I%20want%20to%20register%20as%20a%20business.";
    String userText =
        'Good%20Day%2C%20i%20%20am%20chatting%20from%20agility%20App%2C%20i%20want%20to%20report%20a%20scam%20by%20a%20vendor%20or%20suggest%a%feature.';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "App Guide",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 150,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: const Text(
                    "For Business - step 1",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                ChatBubble(
                    res:
                        "It's best to register with a whatsapp business Account where your product catalogue can be viewed easily but it's not a must."),
                ChatBubble(
                    res:
                        "Answer simple questions about your business and get started within 2 to 3 days."),
                ChatBubble(
                    res: "Receive chats and call directly from your phone"),
                ChatBubble(res: "It's comes at ZERO cost to you"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10)),
                          onPressed: () {
                            url_launcher.launch(
                              "https://wa.me/23407085939928/?text=$businessText",
                              forceSafariVC: false,
                              forceWebView: false,
                            );
                          },
                          icon: const Icon(
                            MyFlutterApp.whatsapp,
                            color: Colors.white,
                          ),
                          label: const Text(
                            "Get Started",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 150,
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: const Text(
                    "For Users - step 2",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ChatBubble(
                    res:
                        "We are not directly affilaited with any of the vendors"),
                ChatBubble(
                    res:
                        "This is a free service, Do your due deligence before making payment"),
                ChatBubble(
                    res:
                        "Please report any issues if scammed by any vendor, so we can take them off the platform and reduce the chances of them scamming other users. Thank you"),
                ChatBubble(
                    res:
                        "Do you have suggestion about features you would like to see on the app ?"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10)),
                          onPressed: () {
                            url_launcher.launch(
                              "https://wa.me/23407085939928/?text=$userText",
                              forceSafariVC: false,
                              forceWebView: false,
                            );
                          },
                          icon: const Icon(
                            MyFlutterApp.whatsapp,
                            color: Colors.white,
                          ),
                          label: const Text(
                            "Send Message",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
