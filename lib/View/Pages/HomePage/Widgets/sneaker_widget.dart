import 'package:flutter/material.dart';
import 'package:vega/Utils/AppColors/app_colors.dart';

class SneakerWidget extends StatelessWidget {
  const SneakerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.antiAlias,
      fit: StackFit.loose,
      children: [
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: Container(
            height: double.infinity,
            width: MediaQuery.of(context).size.width * 0.38,
            decoration: BoxDecoration(
                color: AppColors.tabBackgroundColor!.withOpacity(0.7),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )),
            child: const Padding(
              padding: EdgeInsets.only(left: 50, right: 0),
              child: Image(
                image: AssetImage(
                  'assets/image/sneaker_two.png',
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 100,
          top: 0,
          bottom: 0,
          child: Container(
            height: double.infinity,
            width: MediaQuery.of(context).size.width * 0.38,
            decoration: BoxDecoration(
                color: AppColors.tabBackgroundColor!,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                )),
            child: const Padding(
              padding: EdgeInsets.only(left: 40, right: 10),
              child: Image(
                image: AssetImage(
                  'assets/image/sneaker_one.png',
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          top: 0,
          child: Container(
            height: double.infinity,
            width: MediaQuery.of(context).size.width * 0.38,
            decoration: const BoxDecoration(
                color: AppColors.yellowColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  topRight: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                )),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Image(
                image: AssetImage(
                  'assets/image/sneaker_one.png',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
