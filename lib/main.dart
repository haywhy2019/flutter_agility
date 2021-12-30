// ignore_for_file: prefer_const_constructors
import 'package:agility_app/Presentation/screen/services/add_delivery.dart';
import 'package:agility_app/Presentation/screen/services/add_electrical.dart';
import 'package:agility_app/Presentation/screen/services/add_fashion.dart';
import 'package:agility_app/Presentation/screen/services/add_lundary.dart';
import 'package:agility_app/Presentation/screen/services/add_plumber.dart';
import 'package:agility_app/Presentation/screen/services/add_shop.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Presentation/constants/const.dart';
import 'Presentation/screen/add_images.dart';
import 'Presentation/screen/guide.dart';
import 'Presentation/screen/home.dart';
import 'Presentation/screen/services/add_food.dart';
import 'Presentation/screen/services/delivery.dart';
import 'Presentation/screen/services/eletricals.dart';
import 'Presentation/screen/services/fashion.dart';
import 'Presentation/screen/services/food.dart';
import 'Presentation/screen/services/lundary.dart';
import 'Presentation/screen/services/plumbling.dart';
import 'Presentation/screen/shop.dart';
import 'Presentation/screen/splash.dart';
import 'package:new_version/new_version.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Proxima",
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      home: AnimatedSplashScreen(
          duration: 3000,
          splash: SplashScreen(),
          nextScreen: MyStatefulWidget(),
          splashTransition: SplashTransition.slideTransition,
          // pageTransitionType: PageTransitionType.scale,
          backgroundColor: Colors.white),
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        AddImages.routeName: (ctx) => AddImages(),
        FashionScreen.routeName: (ctx) => FashionScreen(),
        DeliveryScreen.routeName: (ctx) => DeliveryScreen(),
        FoodScreen.routeName: (ctx) => FoodScreen(),
        LundaryScreen.routeName: (ctx) => LundaryScreen(),
        PlumbingScreen.routeName: (ctx) => PlumbingScreen(),
        ElectricalScreen.routeName: (ctx) => ElectricalScreen(),
        AddService.routeName: (ctx) => AddService(),
        AddNewDelivery.routeName: (ctx) => AddNewDelivery(),
        AddNewElectrical.routeName: (ctx) => AddNewElectrical(),
        AddNewPlumber.routeName: (ctx) => AddNewPlumber(),
        AddNewFood.routeName: (ctx) => AddNewFood(),
        AddNewShop.routeName: (ctx) => AddNewShop(),
        AddNewLundary.routeName: (ctx) => AddNewLundary(),
      },
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  bool showDialog = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkVersion();
  }

  void _checkVersion() async {
    print("working");
    final newVersion = NewVersion(
      androidId: 'com.example.agility_app',
      // androidId: 'com.snapchat.android',
    );
    // newVersion.showAlertIfNecessary(context: context);

    final status = await newVersion.getVersionStatus();

    if (status != null) {
      newVersion.showUpdateDialog(context: context, versionStatus: status);
    }
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (showDialog) {
      Future.delayed(Duration(seconds: 3), () {
        popUpNotice();
      });
    }
    showDialog = false;
  }

  popUpNotice() {
    showAlertDialog(context);
  }

  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ShopScreen(),
    // ServiceScreen(),
    CommunityScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
              color: bottomMenuIconCol,
            ),
            activeIcon: Icon(
              Icons.home_rounded,
              color: primaryCol,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: bottomMenuIconCol,
            ),
            activeIcon: Icon(
              Icons.shopping_bag_outlined,
              color: primaryCol,
            ),
            label: 'Shop',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.home_repair_service_outlined,
          //     color: bottomMenuIconCol,
          //   ),
          //   activeIcon: Icon(
          //     Icons.home_repair_service_outlined,
          //     color: primaryCol,
          //   ),
          //   label: 'Services',
          // ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.comment_bank_outlined,
              color: bottomMenuIconCol,
            ),
            activeIcon: Icon(
              Icons.comment_bank_outlined,
              color: primaryCol,
            ),
            label: 'Guide',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryCol,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),
    child: Text(
      "OK",
      style: TextStyle(color: primaryCol, fontWeight: FontWeight.bold),
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: primaryCol,
    title: Text(
      "Notice",
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    ),
    content: SizedBox(
      height: 100,
      child: Column(
        children: const [
          Text(
            "We do not have any partnership with the services listed here, We just make it easy to access this services.",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
