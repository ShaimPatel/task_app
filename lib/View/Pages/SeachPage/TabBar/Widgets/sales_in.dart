// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../Utils/AppColors/app_colors.dart';
import '../../../../../Utils/AppTxetStyle/text_style.dart';

class SalesInWidget extends StatelessWidget {
  final String discountTitle;
  final ImageProvider firstImage;
  final ImageProvider secondImage;
  final String timer;
  const SalesInWidget({
    Key? key,
    required this.discountTitle,
    required this.firstImage,
    required this.secondImage,
    required this.timer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.20,
      width: double.infinity,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.slaesInColor,
                borderRadius: BorderRadiusDirectional.circular(30)),
            child: Stack(
              children: [
                Positioned(
                  bottom:
                      -35 + MediaQuery.of(context).size.height * 0.46789 / 10,
                  top: 40,
                  left: 20,
                  child: Text(discountTitle, style: AppTextStyle.headingBold),
                ),
                Positioned(
                  bottom: 40,
                  left: 20,
                  child: Text(timer, style: AppTextStyle.appTitleName),
                ),
                Positioned(
                  bottom: 35,
                  left: 100,
                  child: Text("45", style: AppTextStyle.appTitleName),
                ),
                Positioned(
                  right: 70,
                  bottom: 20,
                  child: SizedBox(
                    height: 70,
                    width: 70,
                    child: ClipRRect(
                      borderRadius: BorderRadiusDirectional.circular(50),
                      child: Image(
                        fit: BoxFit.cover,
                        image: secondImage,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 30,
                  top: 20,
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadiusDirectional.circular(50),
                      child: Image(
                        fit: BoxFit.cover,
                        image: firstImage,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
