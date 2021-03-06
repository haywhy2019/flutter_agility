import 'package:agility_app/Bloc/fashion/fashion_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:agility_app/Data/Models/users.dart';
import 'package:agility_app/Data/Repositiory/fashion_repo.dart';
import 'package:agility_app/Presentation/constants/const.dart';

class AddService extends StatefulWidget {
  const AddService({Key? key}) : super(key: key);
  static String routeName = "/addService";

  @override
  _AddServiceState createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {
  final _formKey = GlobalKey<FormState>();
  final fullName = TextEditingController();
  final phoneNumber = TextEditingController();
  final title = TextEditingController();
  final whatsApp = TextEditingController();
  final description = TextEditingController();

  @override
  void dispose() {
    fullName.dispose();
    phoneNumber.dispose();
    title.dispose();
    whatsApp.dispose();
    description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FashionBloc(FashionRepository()),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text(
              "Add Service",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 25),
                    child: Text(
                      "Add a New Service",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Full Name *",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            TextFormField(
                              controller: fullName,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Phone Number *",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            TextFormField(
                              controller: phoneNumber,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Service*",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            TextFormField(
                              controller: title,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Whatsapp Number",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            TextFormField(
                              controller: whatsApp,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Description *",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            TextFormField(
                              controller: description,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  BlocConsumer<FashionBloc, FashionState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is FashionInitial) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(18)),
                                backgroundColor:
                                    MaterialStateProperty.all(primaryCol)),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                final data = Users(
                                  name: fullName.text,
                                  title: title.text,
                                  phoneNumber: phoneNumber.text,
                                  whatsApp: whatsApp.text,
                                  description: description.text,
                                );
                                context
                                    .read<FashionBloc>()
                                    .add(AddFashion(data));
                              }
                            },
                            child: const Text("SAVE",
                                style: TextStyle(fontSize: 18)),
                          ),
                        );
                      }
                      if (state is FashionLoading) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: const Center(
                              child:
                                  CircularProgressIndicator(color: primaryCol)),
                        );
                      } else if (state is FashionAdded) {
                        return AlertDialog(
                          backgroundColor: primaryCol,
                          title: const Text(
                            "Notice",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          content: SizedBox(
                            height: 100,
                            child: Column(
                              children: const [
                                Text(
                                  "We do not have any partnership with the services listed here, We just make it easy for you to access this services.",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                                onPressed: () {}, child: Text("Okay")),
                          ],
                        );
                      } else {
                        return const Text("an Error occured");
                      }
                    },
                  )
                ],
              ),
            ),
          )
          // This trailing comma makes auto-formatting nicer for build methods.
          ),
    );
  }
}
