// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:vega/CommonWidget/new_collection.dart';
import 'package:vega/Global/global.dart';
import 'package:vega/Utils/AppColors/app_colors.dart';
import 'package:vega/View/Pages/HomePage/Widgets/catergory_widget.dart';
import 'package:vega/View/Pages/HomePage/Widgets/offers_widget.dart';
import 'package:vega/View/Pages/HomePage/Widgets/sneaker_widget.dart';

import '../../../Utils/AppTxetStyle/text_style.dart';
import 'Widgets/new_collection_widget.dart';

class HomeTabPage extends StatefulWidget {
  final Map<String, dynamic> jsonData;
  const HomeTabPage({
    Key? key,
    required this.jsonData,
  }) : super(key: key);

  @override
  State<HomeTabPage> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
//! Initial Selected Value
  String dropdownvalue = 'Man';

  //! List of items in our dropdown menu
  final items = ['Man', 'Female', 'Teen', 'Kids'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWidget(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            //? Divide Section..

            Divider(
              height: 2,
              color: AppColors.blackColor,
              thickness: 2,
              indent: MediaQuery.of(context).size.width * 0.1,
              endIndent: MediaQuery.of(context).size.width * 0.1,
            ),

            //? Category Section ..

            SizedBox(
                height: MediaQuery.of(context).size.height * 0.16,
                width: MediaQuery.of(context).size.width,
                // color: Colors.red,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.jsonData['Categories'].length,
                    itemBuilder: (ctx, index) {
                      final categoriesData =
                          widget.jsonData['Categories'][index];
                      return CategoryWidget(
                        bgColor: categoriesData['bgColor'].toString(),
                        imageUrl: Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            categoriesData['image'],
                          ),
                        ).image,
                        title: categoriesData['title'],
                      );
                    })),

            //? Offer Section ..
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.28,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.16,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      // color: Colors.red,
                    ),
                    child: OfferWidget(
                      discountTitle: widget.jsonData['discount']['title'],
                      secondImage:
                          Image(image: NetworkImage(GlobalVar.productImage[0]))
                              .image,
                      firstImage:
                          Image(image: NetworkImage(GlobalVar.productImage[1]))
                              .image,
                      timer: widget.jsonData['discount']['timer'],
                    ),
                  ),
                ),
              ),
            ),
            //! New Collection
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NewCollectionPage(
                      jsonData: widget.jsonData,
                    ),
                  ));
                },
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.24,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.jsonData['newCollection']['BannerTitle'],
                          style: AppTextStyle.headingTitle),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.18,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: AppColors.tabBackgroundColor!
                                  .withOpacity(0.2),
                            ),
                            child: NewCollectionWidget(
                              jsonData: widget.jsonData,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            //!Sneakers ..
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.24,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sneakers', style: AppTextStyle.headingTitle),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          // color: Colors.red,
                        ),
                        child: const SneakerWidget(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//! AppBar Widget in here ...
  AppBar appbarWidget() {
    return AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        toolbarHeight: 100,
        flexibleSpace: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 2, child: Container()),
              Expanded(
                  flex: 2,
                  child: Text('Vega', style: AppTextStyle.appTitleName)),
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: DropdownButton(
                  focusColor: AppColors.primaryColor,
                  isDense: false,
                  elevation: 0,
                  value: dropdownvalue,
                  underline: const SizedBox(),
                  icon: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                          height: 25,
                          width: 25,
                          color: AppColors.greyColor,
                          child: const Center(
                              child: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: AppColors.whiteColor,
                          )))),

                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(
                        items,
                        style: AppTextStyle.offerDescription,
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
              ),
            ]));
  }
}
