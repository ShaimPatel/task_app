// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../Utils/AppTxetStyle/text_style.dart';

class FirstItemWidget extends StatefulWidget {
  String title;
  ImageProvider firstImage;
  ImageProvider secondImage;
  String description;
  Color bgColor;
  FirstItemWidget({
    Key? key,
    required this.title,
    required this.firstImage,
    required this.secondImage,
    required this.description,
    required this.bgColor,
  }) : super(key: key);

  @override
  State<FirstItemWidget> createState() => _FirstItemWidgetState();
}

class _FirstItemWidgetState extends State<FirstItemWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      width: double.infinity,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                color: widget.bgColor,
                borderRadius: BorderRadiusDirectional.circular(30)),
            child: Stack(
              children: [
                Positioned(
                  bottom:
                      -35 + MediaQuery.of(context).size.height * 0.46789 / 10,
                  top: 30,
                  left: 20,
                  child: Text(widget.title, style: AppTextStyle.headingBold),
                ),
                Positioned(
                  bottom: 35,
                  left: 20,
                  child: Text(widget.description,
                      style: AppTextStyle.headingDescription),
                ),
                Positioned(
                  right: 60,
                  bottom: 10,
                  child: SizedBox(
                    height: 70,
                    width: 70,
                    child: ClipRRect(
                      borderRadius: BorderRadiusDirectional.circular(50),
                      child: Image(
                        fit: BoxFit.cover,
                        image: widget.secondImage,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadiusDirectional.circular(50),
                      child: Image(
                        fit: BoxFit.cover,
                        image: widget.firstImage,
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
