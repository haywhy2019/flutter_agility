import 'package:agility_app/Bloc/food/food_bloc.dart';
import 'package:agility_app/Data/Models/users.dart';
import 'package:agility_app/Data/Repositiory/food_repo.dart';
import 'package:agility_app/Presentation/constants/const.dart';
import 'package:agility_app/Presentation/screen/services/food.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewFood extends StatefulWidget {
  const AddNewFood({Key? key}) : super(key: key);
  static String routeName = "/addNewFood";

  @override
  _AddNewFoodState createState() => _AddNewFoodState();
}

class _AddNewFoodState extends State<AddNewFood> {
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
      lazy: false,
      create: (context) => FoodBloc(FoodRepository()),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text(
              "Add Food or Snacks Vendor",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: BlocConsumer<FoodBloc, FoodState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is FoodInitial) {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 25),
                            child: Text(
                              "Add new Food or Snack Vendor",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
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
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.all(18)),
                                  backgroundColor:
                                      MaterialStateProperty.all(primaryCol)),
                              onPressed: () {
                                print("${description.text}, description");
                                if (_formKey.currentState!.validate()) {
                                  final data = Users(
                                    name: fullName.text,
                                    title: title.text,
                                    phoneNumber: phoneNumber.text,
                                    whatsApp: whatsApp.text,
                                    description: description.text,
                                  );

                                  context.read<FoodBloc>().add(AddFood(data));
                                }
                              },
                              child: const Text("SAVE",
                                  style: TextStyle(fontSize: 18)),
                            ),
                          )
                        ],
                      ),
                    );
                  }

                  if (state is FoodLoading) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: const Center(
                          child: CircularProgressIndicator(color: primaryCol)),
                    );
                  }
                  if (state is FoodAdded) {
                    return AlertDialog(
                      backgroundColor: Colors.green,
                      title: const Text(
                        "Success",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 40),
                      ),
                      content: SizedBox(
                        height: 100,
                        child: Column(
                          children: const [
                            Icon(
                              Icons.check_circle,
                              color: Colors.white,
                              size: 60,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "New Food Vendor Added",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white)),
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, FoodScreen.routeName);
                              // Navigator.pushNamedAndRemoveUntil(
                              //     context,
                              //     FoodScreen.routeName,
                              //     ModalRoute.withName(FoodScreen.routeName));
                            },
                            child: const Text(
                              "Okay",
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ],
                    );
                  } else if (state is FoodHttpError) {
                    return Center(
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              onPressed: () {
                                context
                                    .read<FoodBloc>()
                                    .add(const ResetAddFood());
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
                    );
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.error_outline,
                            size: 40,
                            color: Colors.red,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "An Error Occured",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size.fromWidth(200),
                                primary: Colors.red,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
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
                    );
                  }
                },
              ))
          // This trailing comma makes auto-formatting nicer for build methods.
          ),
    );
  }
}
