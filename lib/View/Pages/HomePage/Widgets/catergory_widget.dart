import 'package:flutter/material.dart';
import 'package:vega/Utils/AppColors/app_colors.dart';

import '../../../../Utils/AppTxetStyle/text_style.dart';

class CategoryWidget extends StatefulWidget {
  final String title;
  final String bgColor;
  final ImageProvider imageUrl;
  const CategoryWidget({
    Key? key,
    required this.title,
    required this.bgColor,
    required this.imageUrl,
  }) : super(key: key);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: widget.bgColor == "true"
                    ? AppColors.whiteColor
                    : AppColors.categorySideColor,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60.0),
                child: Image(
                  fit: BoxFit.cover,
                  image: widget.imageUrl,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(widget.title, style: AppTextStyle.categorytitle),
      ],
    );
  }
}
