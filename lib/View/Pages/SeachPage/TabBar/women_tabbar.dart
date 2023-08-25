import 'package:flutter/material.dart';
import 'package:vega/View/Pages/SeachPage/TabBar/Widgets/sales_in.dart';

class WomenTabbar extends StatefulWidget {
  const WomenTabbar({super.key});

  @override
  State<WomenTabbar> createState() => _WomenTabbarState();
}

class _WomenTabbarState extends State<WomenTabbar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        // color: Colors.red,
        child: Column(
          children: [
            SalesInWidget(
              discountTitle: 'Sale in',
              secondImage: const Image(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80'))
                  .image,
              firstImage: const Image(
                      image: NetworkImage(
                          'https://media.istockphoto.com/id/452470765/photo/3d-red-knitted-winter-cap-on-white-background.jpg?s=612x612&w=0&k=20&c=96ZQ2VReqIcw6wiBVFd2kvVxDkhUoX5DPvopv8wAh6M='))
                  .image,
              timer: 'Up To ',
            ),
          ],
        ),
      ),
    );
  }
}
