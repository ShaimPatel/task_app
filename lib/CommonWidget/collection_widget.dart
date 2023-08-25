// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../Utils/AppColors/app_colors.dart';
import '../Utils/AppTxetStyle/text_style.dart';

// ignore: must_be_immutable
class CollectionWidget extends StatefulWidget {
  String name;
  String id;
  String discount;
  ImageProvider image;
  String price;
  String description;
  CollectionWidget({
    Key? key,
    required this.name,
    required this.id,
    required this.discount,
    required this.image,
    required this.price,
    required this.description,
  }) : super(key: key);

  @override
  State<CollectionWidget> createState() => _CollectionWidgetState();
}

class _CollectionWidgetState extends State<CollectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: AppColors.firstListColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.name.toString(), style: AppTextStyle.offertitle),
                  const SizedBox(height: 5),
                  Text(widget.description.toString(),
                      style: AppTextStyle.offerDescription),
                  const SizedBox(height: 5),
                  Text('₹ ${widget.price}', style: AppTextStyle.onExitText2),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image(fit: BoxFit.cover, image: widget.image),
                    ),
                  ),
                ),
                Text(
                  "${widget.discount} off",
                  style: AppTextStyle.onExitText2,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
