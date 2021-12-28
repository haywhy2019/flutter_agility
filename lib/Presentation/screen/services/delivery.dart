import 'package:agility_app/Bloc/delivery/delivery_bloc.dart';
import 'package:agility_app/Data/Repositiory/delivery_repo.dart';
import 'package:agility_app/Presentation/constants/const.dart';
import 'package:agility_app/Presentation/screen/services/add_delivery.dart';
import 'package:agility_app/Presentation/widget/error.dart';
import 'package:agility_app/Presentation/widget/loader.dart';
import 'package:agility_app/Presentation/widget/no_data_widget.dart';
import 'package:agility_app/Presentation/widget/users_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({Key? key}) : super(key: key);
  static String routeName = "/delivery";

  @override
  _DeliveryScreenState createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocProvider(
      lazy: false,
      create: (context) =>
          DeliveryBloc(DeliveryRepository())..add(FetchDelivery()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "Delivery Agent",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/delivery.jpeg',
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
                        "Book Delivery Agent",
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
            BlocBuilder<DeliveryBloc, DeliveryState>(
              builder: (context, state) {
                print(state);
                if (state is DeliveryLoading) {
                  return const Loader(
                    minusHeight: 300,
                  );
                }
                if (state is DeliveryLoaded) {
                  return UsersCard(state.data);
                } else if (state is DeliveryHttpError) {
                  return const DeliveryHttpErrors();
                } else if (state is DeliveryNoData) {
                  return const NoDataWidget(
                      mesg: "No Delivery Agent Registered yet");
                } else {
                  return const CustomError();
                }
              },
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: primaryCol,
          onPressed: () {
            Navigator.of(context).pushNamed(AddNewDelivery.routeName);
          },
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}

class DeliveryHttpErrors extends StatelessWidget {
  const DeliveryHttpErrors({
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
                  Navigator.popAndPushNamed(context, DeliveryScreen.routeName);
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
