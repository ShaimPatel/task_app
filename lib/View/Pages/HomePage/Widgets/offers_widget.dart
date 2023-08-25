import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:vega/Global/global.dart';
import 'package:vega/Utils/AppColors/app_colors.dart';

import '../../../../Utils/AppTxetStyle/text_style.dart';

class OfferWidget extends StatefulWidget {
  final String discountTitle;
  final ImageProvider firstImage;
  final ImageProvider secondImage;
  final String timer;
  const OfferWidget({
    Key? key,
    required this.discountTitle,
    required this.firstImage,
    required this.secondImage,
    required this.timer,
  }) : super(key: key);

  @override
  State<OfferWidget> createState() => _OfferWidgetState();
}

class _OfferWidgetState extends State<OfferWidget> {
//!

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            InkWell(
              onTap: () {},
              child: CarouselSlider(
                items: GlobalVar.listColor
                    .map(
                      (e) => ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            color:
                                AppColors.tabBackgroundColor!.withOpacity(0.2),
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: -35 +
                                      MediaQuery.of(context).size.height *
                                          0.46789 /
                                          10,
                                  top: 20,
                                  left: 20,
                                  child: Text(widget.discountTitle,
                                      style: AppTextStyle.offertitle),
                                ),
                                Positioned(
                                  bottom: 20,
                                  left: 20,
                                  child: Text(
                                    widget.timer,
                                    style: AppTextStyle.offerDescription,
                                  ),
                                ),
                                Positioned(
                                  right:
                                      MediaQuery.of(context).size.width * 0.07,
                                  bottom: 10,
                                  child: SizedBox(
                                    height: 70,
                                    width: 70,
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(50),
                                      child: Image(
                                        fit: BoxFit.cover,
                                        image: widget.secondImage,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right:
                                      MediaQuery.of(context).size.width * 0.01,
                                  top: 10,
                                  child: SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(50),
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
                    )
                    .toList(),
                carouselController: carouselController,
                options: CarouselOptions(
                  scrollPhysics: const BouncingScrollPhysics(),
                  autoPlay: true,
                  aspectRatio: 2,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: GlobalVar.imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => carouselController.animateToPage(entry.key),
              child: Container(
                width: currentIndex == entry.key ? 8 : 7,
                height: 7,
                margin: const EdgeInsets.symmetric(horizontal: 3.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: currentIndex == entry.key
                      ? AppColors.redColor
                      : Colors.grey,
                ),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
