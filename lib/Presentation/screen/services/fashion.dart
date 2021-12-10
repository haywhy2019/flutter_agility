import 'package:agility_app/Bloc/fashion/fashion_bloc.dart';
import 'package:agility_app/Data/Repositiory/fashion_repo.dart';
import 'package:agility_app/Presentation/constants/const.dart';
import 'package:agility_app/Presentation/screen/services/add_fashion.dart';
import 'package:agility_app/Presentation/widget/error.dart';
import 'package:agility_app/Presentation/widget/http_error.dart';
import 'package:agility_app/Presentation/widget/loader.dart';
import 'package:agility_app/Presentation/widget/users_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocProvider(
      create: (context) =>
          FashionBloc(FashionRepository())..add(FetchFashion()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "Fashion Designers",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: 1500,
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                  child: Stack(
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
                ),
                BlocBuilder<FashionBloc, FashionState>(
                  builder: (context, state) {
                    print(state);
                    if (state is FashionLoading) {
                      return const Loader();
                    }
                    if (state is FashionLoaded) {
                      return UsersCard(state.data);
                    } else if (state is FashionHttpError) {
                      return const HttpErrorWidget();
                    } else {
                      return const CustomError();
                    }
                  },
                )
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
      ),
    );
  }
}
