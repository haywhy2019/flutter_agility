import 'package:agility_app/Bloc/fashion/fashion_bloc.dart';
import 'package:agility_app/Data/Models/users.dart';
import 'package:agility_app/Data/Repositiory/fashion_repo.dart';
import 'package:agility_app/Presentation/constants/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddServiceForm extends StatelessWidget {
  const AddServiceForm({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.fullName,
    required this.phoneNumber,
    required this.title,
    required this.whatsApp,
    required this.description,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController fullName;
  final TextEditingController phoneNumber;
  final TextEditingController title;
  final TextEditingController whatsApp;
  final TextEditingController description;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FashionBloc(FashionRepository()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 25),
            child: Text(
              "Add a New Service",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
          BlocBuilder<FashionBloc, FashionState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: ElevatedButton(
                  style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(18)),
                      backgroundColor: MaterialStateProperty.all(primaryCol)),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final data = Users(
                        name: fullName.text,
                        title: title.text,
                        phoneNumber: int.parse(phoneNumber.text),
                        whatsApp: whatsApp.text,
                        description: description.text,
                      );
                      context.read<FashionBloc>().add(AddFashion(data));
                    }
                  },
                  child: const Text("SAVE", style: TextStyle(fontSize: 18)),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
