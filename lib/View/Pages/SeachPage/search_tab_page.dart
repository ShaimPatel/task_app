import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vega/View/Pages/SeachPage/TabBar/kids_tabbar.dart';
import 'package:vega/View/Pages/SeachPage/TabBar/men_tabbar.dart';
import 'package:vega/View/Pages/SeachPage/TabBar/teen_tabbar.dart';

import '../../../Utils/AppColors/app_colors.dart';
import '../../../Utils/AppTxetStyle/text_style.dart';

class SearchTabPage extends StatefulWidget {
  const SearchTabPage({super.key});

  @override
  State<SearchTabPage> createState() => _SearchTabPageState();
}

class _SearchTabPageState extends State<SearchTabPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            backgroundColor: AppColors.primaryColor,
            elevation: 0,
            flexibleSpace: SizedBox(
              height: 110,
              width: double.infinity,
              // color: Colors.red,
              child: Stack(
                children: [
                  Positioned(
                    left: 25,
                    bottom: 20,
                    child: Text(
                      "Search",
                      style: AppTextStyle.headingTitle,
                    ),
                  ),
                  const Positioned(
                      right: 65,
                      bottom: 20,
                      child: Icon(
                        CupertinoIcons.search,
                      )),
                  Positioned(
                    right: 25,
                    bottom: 20,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        height: 30,
                        width: 30,
                        color: Colors.grey.withOpacity(0.4),
                        child: const Icon(
                          Icons.qr_code,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 5,
                      left: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Container(
                          height: 2,
                          width: MediaQuery.of(context).size.width * 0.75,
                          color: AppColors.blackColor,
                        ),
                      )),
                ],
              ),
            ),
          ),
          body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                    width: double.infinity,
                    child: TabBar(
                      indicatorColor: AppColors.blackColor,
                      indicatorWeight: 5.0,
                      automaticIndicatorColorAdjustment: true,
                      labelPadding: const EdgeInsets.symmetric(
                        horizontal: 22,
                      ),
                      indicator: BoxDecoration(
                        color: AppColors.tabBackgroundColor!.withOpacity(0.2),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadiusDirectional.circular(50),
                      ),
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.tab,
                      unselectedLabelColor:
                          AppColors.blackColor.withOpacity(0.7),
                      labelColor: AppColors.blackColor,
                      tabs: [
                        Text('Women', style: AppTextStyle.tabtitle),
                        Text('Men', style: AppTextStyle.tabtitle),
                        Text('Teen', style: AppTextStyle.tabtitle),
                        Text('Kid\'s', style: AppTextStyle.tabtitle),
                      ],
                    ),
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: TabBarView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      MenTabBar(),
                      MenTabBar(),
                      TeenTabBar(),
                      KidsTabBar(),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
