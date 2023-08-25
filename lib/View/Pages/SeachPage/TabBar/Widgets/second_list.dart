// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../Utils/AppTxetStyle/text_style.dart';

class SecondListWidget extends StatefulWidget {
  final String title;
  final ImageProvider firstImage;
  final String? description;
  final Color bgColor;

  const SecondListWidget(
      {Key? key,
      required this.bgColor,
      required this.title,
      required this.firstImage,
      this.description})
      : super(key: key);

  @override
  State<SecondListWidget> createState() => _SecondListWidgetState();
}

class _SecondListWidgetState extends State<SecondListWidget> {
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
                  top: 35,
                  left: 20,
                  child: Text(widget.title, style: AppTextStyle.headingBold),
                ),
                Positioned(
                  bottom: 35,
                  left: 20,
                  child: Text(widget.description!,
                      style: AppTextStyle.headingDescription),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: SizedBox(
                    height: 80,
                    width: 80,
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
