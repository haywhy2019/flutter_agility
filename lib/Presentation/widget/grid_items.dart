// ignore_for_file: must_be_immutable

import 'package:agility_app/Presentation/constants/const.dart';
import 'package:agility_app/Presentation/constants/home_icons.dart';
import 'package:flutter/material.dart';

class GridContainer extends StatelessWidget {
  const GridContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: GridView.builder(
        itemCount: homeIcons.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 2.0,
            childAspectRatio: 2 / 1.5),
        itemBuilder: (BuildContext context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(homeIcons[index].screen);
            },
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    homeIcons[index].icon,
                    color: primaryCol,
                  ),
                  Text(
                    homeIcons[index].title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
