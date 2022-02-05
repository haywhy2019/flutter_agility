import 'package:agility_app/Bloc/electrical/electrical_bloc.dart';
import 'package:agility_app/Data/Repositiory/electrical_repo.dart';
import 'package:agility_app/Presentation/constants/const.dart';
import 'package:agility_app/Presentation/screen/services/add_electrical.dart';
import 'package:agility_app/Presentation/widget/error.dart';
import 'package:agility_app/Presentation/widget/loader.dart';
import 'package:agility_app/Presentation/widget/no_data_widget.dart';
import 'package:agility_app/Presentation/widget/users_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ElectricalScreen extends StatefulWidget {
  const ElectricalScreen({Key? key}) : super(key: key);
  static String routeName = "/electricals";

  @override
  _ElectricalScreenState createState() => _ElectricalScreenState();
}

class _ElectricalScreenState extends State<ElectricalScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocProvider(
      lazy: false,
      create: (context) =>
          ElectricalBloc(ElectricalRepository())..add(FetchElectrical()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "Electricians",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/electrical.jpeg',
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  color: Colors.black.withOpacity(0.5),
                  colorBlendMode: BlendMode.darken,
                ),
                Positioned(
                  top: height / 30,
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
                        "Book Electricians",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ],
                  ),
                )
              ],
            ),
            BlocBuilder<ElectricalBloc, ElectricalState>(
              builder: (context, state) {
                if (state is ElectricalLoading) {
                  return const Loader(
                    minusHeight: 300,
                  );
                }
                if (state is ElectricalLoaded) {
                  return UsersCard(state.data);
                } else if (state is ElectricalHttpError) {
                  return const ElectricalHttpErrors();
                } else if (state is ElectricalNoData) {
                  return const NoDataWidget(
                      mesg: "No Electricains Registered yet");
                } else {
                  return const CustomError();
                }
              },
            )
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: primaryCol,
        //   onPressed: () {
        //     Navigator.of(context).pushNamed(AddNewElectrical.routeName);
        //   },
        //   child: const Icon(
        //     Icons.add,
        //   ),
        // ),
      ),
    );
  }
}

class ElectricalHttpErrors extends StatelessWidget {
  const ElectricalHttpErrors({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 300,
      child: Center(
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
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                onPressed: () {
                  Navigator.popAndPushNamed(
                      context, ElectricalScreen.routeName);
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
      ),
    );
  }
}
