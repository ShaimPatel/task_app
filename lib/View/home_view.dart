import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:vega/View/Pages/CartPage/cart_tab_page.dart';
import 'package:vega/View/Pages/ProfilePage/profile_tab_page.dart';
import 'package:vega/View/Pages/SeachPage/search_tab_page.dart';

import '../CommonWidget/progess_dialog.dart';
import '../Utils/AppColors/app_colors.dart';
import '../Utils/AppTxetStyle/text_style.dart';
import 'Pages/HomePage/home_tab_page.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
//! Initlazation Section -- :: --
  TabController? tabController;
  int selectedIndex = 0;

//! Funcation/Method Section  -- :: --

  onItemClicked(int index) {
    setState(() {
      selectedIndex = index;
      tabController!.index = selectedIndex;
    });
  }

  late Map<String, dynamic> jsonData = {};

//! InitState  -- :: --
  @override
  void initState() {
    loadJsonData();
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  Future<void> loadJsonData() async {
    try {
      final jsonString = await rootBundle.loadString('assets/json/data.json');
      setState(() {
        jsonData = json.decode(jsonString) as Map<String, dynamic>;
      });
    } catch (error) {
      const CircularProgressIndicator();
      // print('Error loading JSON data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    //!
    //! On Exit ..
    Future<bool> showExitPopup() async {
      return await showDialog(
            barrierDismissible: false,
            context: context,
            useSafeArea: true,
            barrierColor: Colors.black.withOpacity(0.5),
            builder: (context) => AlertDialog(
              elevation: 0,
              title: Text('Close App', style: AppTextStyle.onExitText1),
              content: Text('Do you want to exit an App ?',
                  style: AppTextStyle.onExitText2),
              actions: [
                Column(
                  children: [
                    const Divider(
                      height: 2,
                      thickness: 2,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.white,
                            textStyle: const TextStyle(fontSize: 16),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                side: BorderSide(color: Colors.redAccent)),
                          ),
                          onPressed: () => Navigator.of(context).pop(false),
                          icon: const Icon(
                            Icons.close,
                            size: 22,
                            color: Colors.redAccent,
                          ),
                          label: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "No".toUpperCase(),
                              style: const TextStyle(
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.white,
                            textStyle: const TextStyle(fontSize: 16),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                side: BorderSide(color: Colors.greenAccent)),
                          ),
                          onPressed: () => Navigator.of(context).pop(true),
                          icon: const Icon(
                            Icons.done,
                            size: 22,
                            color: Colors.greenAccent,
                          ),
                          label: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Yes".toUpperCase(),
                              style: const TextStyle(
                                color: Colors.greenAccent,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ) ??
          false;
    }

    //!
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        body: OfflineBuilder(
          debounceDuration: Duration.zero,
          connectivityBuilder: (
            BuildContext ctx,
            ConnectivityResult connectivity,
            Widget child,
          ) {
            if (connectivity == ConnectivityResult.none) {
              return Scaffold(
                backgroundColor: Colors.red[100],
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const ProgressDialogWidget(),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 45,
                      ),
                      child: Center(
                        child: Text(
                          'Please check your internet connection .!',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return child;
          },
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: tabController,
            children: [
              HomeTabPage(
                jsonData: jsonData,
              ),
              const SearchTabPage(),
              const CartTabPage(),
              const ProfileTabPage()
            ],
          ),
        ),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: selectedIndex,
          onTap: onItemClicked,
          curve: Curves.decelerate,
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.home_filled,
                color: AppColors.blackColor,
              ),
              title: Text("Home", style: AppTextStyle.bottombarText),
              selectedColor: AppColors.tabBackgroundColor,
            ),

            /// Likes
            SalomonBottomBarItem(
                icon: const Icon(
                  CupertinoIcons.search,
                  color: AppColors.blackColor,
                ),
                title: Text("Search", style: AppTextStyle.bottombarText),
                selectedColor: AppColors.tabBackgroundColor),

            /// Search
            SalomonBottomBarItem(
              icon: const Icon(
                CupertinoIcons.bag,
                color: AppColors.blackColor,
              ),
              title: Text("Cart", style: AppTextStyle.bottombarText),
              selectedColor: AppColors.tabBackgroundColor,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: const Icon(
                CupertinoIcons.person,
                color: AppColors.blackColor,
              ),
              title: Text("Profile", style: AppTextStyle.bottombarText),
              selectedColor: AppColors.tabBackgroundColor,
            ),
          ],
        ),
      ),
    );
  }
}
