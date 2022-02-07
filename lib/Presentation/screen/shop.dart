import 'package:agility_app/Bloc/shop/shop_bloc.dart';
import 'package:agility_app/Data/Repositiory/shop_repo.dart';
import 'package:agility_app/Presentation/constants/const.dart';
import 'package:agility_app/Presentation/screen/services/add_shop.dart';
import 'package:agility_app/Presentation/widget/error.dart';
import 'package:agility_app/Presentation/widget/http_error.dart';
import 'package:agility_app/Presentation/widget/loader.dart';
import 'package:agility_app/Presentation/widget/no_data_widget.dart';
import 'package:agility_app/Presentation/widget/users_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopScreen extends StatefulWidget {
  static String routeName = '/shop';
  const ShopScreen({Key? key}) : super(key: key);

  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocProvider(
      lazy: false,
      create: (context) => ShopBloc(ShopRepository())..add(const FetchShop()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "Shops in Agility",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/shop.jpeg',
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
                        "Shops in Agility Estate",
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
            BlocBuilder<ShopBloc, ShopState>(
              builder: (context, state) {
                if (state is ShopInitial) {
                  return const Loader(
                    minusHeight: 300,
                  );
                }
                if (state is ShopLoading) {
                  return const Loader(
                    minusHeight: 300,
                  );
                }
                if (state is ShopLoaded) {
                  return UsersCard(state.data);
                } else if (state is ShopHttpError) {
                  return const HttpErrorWidget();
                } else if (state is ShopNoData) {
                  return const NoDataWidget(mesg: "No Shop Registered yet");
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
        //     Navigator.of(context).pushNamed(AddNewShop.routeName);
        //   },
        //   child: const Icon(
        //     Icons.add,
        //   ),
        // ),
      ),
    );
  }
}
