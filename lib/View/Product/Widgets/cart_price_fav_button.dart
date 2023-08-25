// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Utils/AppColors/app_colors.dart';
import '../../../Utils/AppTxetStyle/text_style.dart';

class CartPriceFavwidget extends StatefulWidget {
  String oldPrice;
  String price;
  Map<String, dynamic> jsonData;
  Function onPress;

  CartPriceFavwidget({
    Key? key,
    required this.oldPrice,
    required this.price,
    required this.jsonData,
    required this.onPress,
  }) : super(key: key);

  @override
  State<CartPriceFavwidget> createState() => _CartPriceFavwidgetState();
}

class _CartPriceFavwidgetState extends State<CartPriceFavwidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: '\$${widget.oldPrice}',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                TextSpan(
                    text: ' \$${widget.price}',
                    style: AppTextStyle.onExitText2),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {
                  widget.onPress();
                },
                child: Container(
                  height: 60,
                  width: 100,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        CupertinoIcons.bag,
                      ),
                      Text(
                        "Add to Cart",
                        style: AppTextStyle.offertitle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey.withOpacity(0.7),
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 3),
              child: Icon(
                Icons.favorite_border,
                size: 18,
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
