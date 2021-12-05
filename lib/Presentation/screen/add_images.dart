// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:agility_app/Data/Models/home_slider.dart';
import 'package:agility_app/Data/Repositiory/firebase_api.dart';
import 'package:agility_app/Data/Repositiory/storage_service.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';


class AddImages extends StatefulWidget {
  const AddImages({Key? key}) : super(key: key);
  static String routeName = "/add_images";

  @override
  _AddImagesState createState() => _AddImagesState();
}

class _AddImagesState extends State<AddImages> {
  late Future<List<FirebaseFile>> futureFiles;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureFiles = FirebaseApi.listAll('home/');
  }

  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Image"),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton.icon(
              onPressed: () async {
                FilePickerResult? results = await FilePicker.platform.pickFiles(
                  allowMultiple: false,
                  type: FileType.custom,
                  allowedExtensions: ['png', 'jpg'],
                );
                if (results == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("No File has been picked"),
                    ),
                  );
                }
                final path = results!.files.single.path;
                final fileName = results.files.single.name;

                storage
                    .uploadFile(path!, fileName)
                    .then((value) => print('done'));
              },
              icon: Icon(Icons.add),
              label: Text("Upload File"),
            ),
          ),
          // FutureBuilder(
          //   future: storage.listFiles(),
          //   builder: (BuildContext context,
          //       AsyncSnapshot<firebase_storage.ListResult> snapshot) {
          //     if (snapshot.connectionState == ConnectionState.done &&
          //         snapshot.hasData) {
          //       return Container(
          //         padding: EdgeInsets.symmetric(horizontal: 20),
          //         height: 50,
          //         child: ListView.builder(
          //             itemCount: snapshot.data!.items.length,
          //             scrollDirection: Axis.horizontal,
          //             shrinkWrap: true,
          //             itemBuilder: (BuildContext context, int index) {
          //               return Padding(
          //                 padding: const EdgeInsets.all(8.0),
          //                 child: ElevatedButton(
          //                     onPressed: () {},
          //                     child: Text(snapshot.data!.items[index].name)),
          //               );
          //             }),
          //       );
          //     }
          //     if (snapshot.connectionState == ConnectionState.waiting ||
          //         !snapshot.hasData) {
          //       return CircularProgressIndicator();
          //     }
          //     return Container();
          //   },
          // ),
          // FutureBuilder(
          //     future: storage.downloadURL('dolli.png'),
          //     builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          //       if (snapshot.connectionState == ConnectionState.done &&
          //           snapshot.hasData) {
          //         return Container(
          //           width: 300,
          //           height: 250,
          //           child: Image.network(snapshot.data!, fit: BoxFit.cover),
          //         );
          //       }
          //       if (snapshot.connectionState == ConnectionState.waiting ||
          //           !snapshot.hasData) {
          //         return CircularProgressIndicator();
          //       }
          //       return Container();
          //     })
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
              })
        ],
      ),
    );
  }
}

Widget buildFile(BuildContext context, FirebaseFile file) => ListTile(
    leading: ClipOval(
      child: Image.network(
        file.url,
        width: 52,
        height: 52,
        fit: BoxFit.cover,
      ),
    ),
    title: Text(
      file.name,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline,
        color: Colors.blue,
      ),
    ),
    onTap: () {});
