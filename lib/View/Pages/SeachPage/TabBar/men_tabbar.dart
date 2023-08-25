import 'package:flutter/material.dart';
import 'package:vega/Global/global.dart';
import 'package:vega/Utils/AppColors/app_colors.dart';
import 'package:vega/View/Pages/SeachPage/TabBar/Widgets/first_list.dart';
import 'package:vega/View/Pages/SeachPage/TabBar/Widgets/sales_in.dart';
import 'package:vega/View/Pages/SeachPage/TabBar/Widgets/second_list.dart';

class MenTabBar extends StatefulWidget {
  const MenTabBar({super.key});

  @override
  State<MenTabBar> createState() => _MenTabBarState();
}

class _MenTabBarState extends State<MenTabBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(children: [
                  SalesInWidget(
                    discountTitle: 'Sale in',
                    secondImage:
                        Image(image: NetworkImage(GlobalVar.productImage[2]))
                            .image,
                    firstImage:
                        Image(image: NetworkImage(GlobalVar.productImage[3]))
                            .image,
                    timer: 'Up To ',
                  ),
                  //!
                  const SizedBox(height: 10),
                  FirstItemWidget(
                    bgColor: AppColors.firstListColor,
                    title: 'New Collection',
                    secondImage:
                        Image(image: NetworkImage(GlobalVar.productImage[4]))
                            .image,
                    firstImage: Image(
                            fit: BoxFit.cover,
                            image: NetworkImage(GlobalVar.productImage[5]))
                        .image,
                    description: '20% ongoing discount 12:23:17',
                  ),

                  const SizedBox(height: 10),

                  //!
                  SecondListWidget(
                    bgColor: AppColors.primaryColor,
                    description: '20% ongoing discount 12:23:17',
                    firstImage:
                        Image(image: NetworkImage(GlobalVar.productImage[6]))
                            .image,
                    title: "New new",
                  ),

                  const SizedBox(height: 10),

                  //!
                  SecondListWidget(
                    bgColor: AppColors.thirdListColor,
                    description: '',
                    firstImage:
                        Image(image: NetworkImage(GlobalVar.productImage[7]))
                            .image,
                    title: "Clothing",
                  ),
                  const SizedBox(height: 10),
                  FirstItemWidget(
                    bgColor: AppColors.fourListColor,
                    title: 'New Collection',
                    secondImage:
                        Image(image: NetworkImage(GlobalVar.productImage[1]))
                            .image,
                    firstImage:
                        Image(image: NetworkImage(GlobalVar.productImage[8]))
                            .image,
                    description: '20% ongoing discount 12:23:17',
                  ),
                ]))));
  }
}
