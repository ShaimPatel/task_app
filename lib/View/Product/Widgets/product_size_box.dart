// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vega/Provider/cart_provider.dart';

import 'package:vega/Utils/AppColors/app_colors.dart';

import '../../../Global/global.dart';
import '../../../Utils/AppTxetStyle/text_style.dart';

class ProductSizeBoxWidget extends StatefulWidget {
  String bannerTitle;
  List<ImageProvider> images;
  List<String> prices;
  List<String> sizes;
  Map<String, dynamic> jsonData;
  String id;

  ProductSizeBoxWidget({
    Key? key,
    required this.bannerTitle,
    required this.images,
    required this.prices,
    required this.sizes,
    required this.jsonData,
    required this.id,
  }) : super(key: key);

  @override
  State<ProductSizeBoxWidget> createState() => _ProductSizeBoxWidgetState();
}

class _ProductSizeBoxWidgetState extends State<ProductSizeBoxWidget> {
  @override
  Widget build(BuildContext context) {
    final List imgetOfProductDetails = widget.jsonData['newCollection']['items']
        [int.parse(widget.id) - 1]['images'];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.bannerTitle, style: AppTextStyle.offertitle),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Color", style: AppTextStyle.offerDescription),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(imgetOfProductDetails.length,
                              (index) {
                            return GestureDetector(
                              onTap: () => GlobalVar.carouselController
                                  .animateToPage(index),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image(
                                    fit: BoxFit.fill,
                                    height: 40,
                                    width: 40,
                                    repeat: ImageRepeat.noRepeat,
                                    image: widget.images[index],
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "Size guide",
                    style: AppTextStyle.offerDescription,
                  )),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: Row(
                  children: [
                    Text("Size", style: AppTextStyle.offerDescription),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: Consumer<CartProvider>(
                            builder: (context, cartProvider, _) {
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.sizes.length,
                              itemBuilder: (context, i) {
                                return InkWell(
                                  onTap: () {
                                    GlobalVar.isClick = !GlobalVar.isClick;
                                    cartProvider.selectedSizeIndex = i;
                                    GlobalVar.clickedId = widget.sizes[i];
                                  },
                                  child: Container(
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color:
                                          widget.sizes[i] == GlobalVar.clickedId
                                              ? AppColors.slaesInColor
                                              : Colors.white,
                                      borderRadius: BorderRadius.circular(
                                        30,
                                      ),
                                    ),
                                    child: Center(
                                      child: ListTile(
                                        selected:
                                            cartProvider.selectedSizeIndex == i,
                                        title: Center(
                                          child: Text(
                                            widget.sizes[i],
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              });
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.fire_truck_outlined,
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Text(
                          'Fast Delivery  \n Deliver frm 28 Aug',
                          style: AppTextStyle.categorytitle,
                        ),
                      ),
                      Text(
                        "Learn more",
                        style: AppTextStyle.offerDescription,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
