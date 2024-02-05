// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import 'package:vega/Utils/AppColors/app_colors.dart';
import 'package:vega/View/Product/Widgets/cart_price_fav_button.dart';

import '../../Global/global.dart';
import '../../Model/cart_item_model.dart';
import '../../Provider/cart_provider.dart';
import '../../Utils/AppTxetStyle/text_style.dart';
import 'Widgets/product_size_box.dart';

class ProductDetailsPage extends StatefulWidget {
  Map<String, dynamic> jsonData;
  String id;

  ProductDetailsPage({
    Key? key,
    required this.jsonData,
    required this.id,
  }) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  TabController? tabController;

  List<CartItem> cartItems = [];
  void addToCart() {
    CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);
    String itemId = widget.id;
    String itemName = widget.jsonData['newCollection']['items']
        [int.parse(itemId) - 1]['name'];
    String image = widget.jsonData['newCollection']['items']
        [int.parse(itemId) - 1]['images'][GlobalVar.currentIndex];
    double price = double.parse(widget.jsonData['newCollection']['items']
        [int.parse(itemId) - 1]['prices'][cartProvider.selectedSizeIndex]);

    String size = widget.jsonData['newCollection']['items']
        [int.parse(itemId) - 1]['sizes'][cartProvider.selectedSizeIndex];

    CartItem cartItem = CartItem(
      itemId: itemId,
      itemName: itemName,
      image: image,
      price: price,
      size: size, // Add this line
      quantity: 1,
    );

    cartProvider.addToCart(cartItem);
  }

//! If you are apply the offer ..

  void applyOffer() {
    int selectedSizeIndex = GlobalVar.selectedSizeIndex;
    double originalPrice = double.parse(widget.jsonData['newCollection']
        ['items'][int.parse(widget.id) - 1]['prices'][selectedSizeIndex]);

    double discountPrice = originalPrice * (10 / 100);
    double finalPrice = originalPrice - discountPrice;
    double savings = originalPrice - finalPrice;

    Future.delayed(Duration.zero, () {
      CartProvider cartProvider =
          Provider.of<CartProvider>(context, listen: false);
      cartProvider.totalSavings = cartProvider.totalSavings + savings;
      cartProvider.selectedSizeIndex = selectedSizeIndex;
      cartProvider.currentPrice = finalPrice;
    });
  }
//!

  @override
  Widget build(BuildContext context) {
    final List imgetOfProductDetails = widget.jsonData['newCollection']['items']
        [int.parse(widget.id) - 1]['images'];
    return Scaffold(
      backgroundColor: Colors.orange[100],
      body: Stack(
        clipBehavior: Clip.hardEdge,
        alignment: AlignmentDirectional.topStart,
        fit: StackFit.passthrough,
        children: [
          //! Product Image
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.65,
              width: MediaQuery.of(context).size.width * 1,
              color: Colors.red.withOpacity(0.5),
              child: InkWell(
                onTap: () {},
                child: CarouselSlider(
                  items: imgetOfProductDetails
                      .map(
                        (item) => Image(
                          image: NetworkImage(item),
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      )
                      .toList(),
                  carouselController: GlobalVar.carouselController,
                  options: CarouselOptions(
                    scrollPhysics: const BouncingScrollPhysics(),
                    autoPlay: false,
                    aspectRatio: 1,
                    viewportFraction: 1,
                    scrollDirection: Axis.vertical,
                    onPageChanged: (index, reason) {
                      setState(() {
                        GlobalVar.currentIndex = index;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3,
            right: 20,
            child: Column(
              children: imgetOfProductDetails.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () =>
                      GlobalVar.carouselController.animateToPage(entry.key),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Container(
                      width: GlobalVar.currentIndex == entry.key ? 8 : 7,
                      height: 7,
                      margin: const EdgeInsets.symmetric(horizontal: 3.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: GlobalVar.currentIndex == entry.key
                            ? Colors.red
                            : Colors.grey,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          //! Button ....!

          Positioned(
            top: 40,
            left: 20,
            child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
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
                    Icons.arrow_back_ios,
                    size: 18,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 70,
            child: InkWell(
              onTap: () async {
                CartProvider cartProvider =
                    Provider.of<CartProvider>(context, listen: false);
                String itemId = widget.id;
                String itemName = widget.jsonData['newCollection']['items']
                    [int.parse(itemId) - 1]['name'];
                String image = widget.jsonData['newCollection']['items']
                    [int.parse(itemId) - 1]['images'][GlobalVar.currentIndex];
                double price = double.parse(widget.jsonData['newCollection']
                        ['items'][int.parse(itemId) - 1]['prices']
                    [cartProvider.selectedSizeIndex]);
                String size = widget.jsonData['newCollection']['items']
                        [int.parse(itemId) - 1]['sizes']
                    [cartProvider.selectedSizeIndex];
                await Share.share(
                    "  Product Name :  $itemName\n Product Price :  $price \n Product Image : $image \n  Product Size : $size");
              },
              child: Container(
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
                    Icons.file_upload_outlined,
                    size: 20,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 120,
            right: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.32,
              width: MediaQuery.of(context).size.width * 1,
              // color: Colors.green,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.jsonData['newCollection']['items'].length,
                  itemBuilder: (contex, index) {
                    final item = widget.jsonData['newCollection']['items']
                        [int.parse(widget.id) - 1];
                    return ProductSizeBoxWidget(
                      jsonData: widget.jsonData,
                      id: widget.id,
                      bannerTitle: item['name'],
                      images: [
                        for (int i = 0; i < item['images'].length; i++)
                          Image(image: NetworkImage(item['images'][i])).image
                      ],
                      prices: [
                        for (int j = 0; j < item['prices'].length; j++)
                          item['prices'][j]
                      ],
                      sizes: [
                        for (int i = 0; i < item['sizes'].length; i++)
                          item['sizes'][i]
                      ],
                    );
                  }),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 0,
            child: SizedBox(
              height: 80,
              width: MediaQuery.of(context).size.width * 1,
              child: Consumer<CartProvider>(
                builder: (context, cartProvider, _) {
                  int selectedSizeIndex = cartProvider.selectedSizeIndex;
                  String originalPrice = widget.jsonData['newCollection']
                          ['items'][int.parse(widget.id)]['prices']
                      [selectedSizeIndex];
                  String oldPrice = widget.jsonData['newCollection']['items']
                      [int.parse(widget.id) - 1]['Price'];
                  double discountPrice =
                      double.parse(originalPrice) * (10 / 100);
                  double finalPrice =
                      double.parse(originalPrice) - discountPrice;

                  return CartPriceFavwidget(
                    jsonData: widget.jsonData,
                    oldPrice: oldPrice,
                    price: GlobalVar.isApply != true
                        ? finalPrice.toString()
                        : originalPrice.toString(),
                    onPress: () {
                      addToCart();
                    },
                  );
                },
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 1,
              color: AppColors.whiteColor.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Use This Cupon code \n And Get 10% Discount all item .",
                        style: AppTextStyle.coupuntitle,
                      ),
                    ),
                    const SizedBox(width: 5),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          backgroundColor: GlobalVar.isApply == true
                              ? Colors.green[200]
                              : Colors.red[200]),
                      onPressed: () {
                        applyOffer();
                        Future.delayed(Duration.zero, () {
                          setState(() {
                            GlobalVar.isApply = !GlobalVar.isApply;
                          });
                        });
                      },
                      child: Text(
                        GlobalVar.isApply == true ? "Apply" : "Remove",
                        style: AppTextStyle.applyButton,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
