import 'package:flutter/material.dart';
import 'package:vega/Utils/AppColors/app_colors.dart';

class NewCollectionWidget extends StatelessWidget {
  final Map<String, dynamic> jsonData;

  const NewCollectionWidget({
    Key? key,
    required this.jsonData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: -20,
          left: -10,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: AppColors.redColor,
              borderRadius: BorderRadius.circular(100),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Image(
                    repeat: ImageRepeat.noRepeat,
                    colorBlendMode: BlendMode.clear,
                    fit: BoxFit.fill,
                    image: AssetImage(
                      'assets/image/girl.png',
                    ),
                  )),
            ),
          ),
        ),
        Positioned(
          top: 20,
          right: MediaQuery.of(context).size.width * 0.25,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                color: AppColors.yellowColor,
                borderRadius: BorderRadius.circular(50)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: const Image(
                  repeat: ImageRepeat.noRepeat,
                  colorBlendMode: BlendMode.clear,
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/image/man_phone.png',
                  ),
                )
                  ..alignment
                  ..image,
              ),
            ),
          ),
        ),
        Positioned(
          top: -10,
          right: -20,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                color: AppColors.redColor,
                borderRadius: BorderRadius.circular(50)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Image(
                    repeat: ImageRepeat.noRepeat,
                    colorBlendMode: BlendMode.clear,
                    fit: BoxFit.fill,
                    image: AssetImage(
                      'assets/image/dance.png',
                    ),
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
