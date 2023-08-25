import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vega/Utils/AppTxetStyle/text_style.dart';

import '../../../Model/cart_item_model.dart';
import '../../../Provider/cart_provider.dart';
import '../../../Utils/AppColors/app_colors.dart';

class CartTabPage extends StatefulWidget {
  const CartTabPage({
    super.key,
  });

  @override
  State<CartTabPage> createState() => _CartTabPageState();
}

class _CartTabPageState extends State<CartTabPage> {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text("Cart"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: AppColors.whiteColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(cartProvider.cartItems.length.toString(),
                    style: const TextStyle(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                CartItem cartItem = cartProvider.cartItems[index];
                if (cartProvider.cartItems.isEmpty) {
                  return const Text("There are no Item , Into Cart List");
                } else {
                  return Card(
                    elevation: 3,
                    color: AppColors.firstListColor,
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          cartItem.image,
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        cartItem.itemName,
                        style: AppTextStyle.offertitle,
                        maxLines: 1,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '\$${cartItem.price.toStringAsFixed(2)}',
                            style: AppTextStyle.offertitle,
                          ),
                          Text(
                            "Quantity : ${cartItem.quantity}",
                            style: AppTextStyle.offerDescription,
                          ),
                          Text(
                            "Size : ${cartItem.size..toString()}",
                            style: AppTextStyle.offerDescription,
                          ),
                        ],
                      ),
                      trailing: InkWell(
                        onTap: () {
                          CartProvider cartProvider =
                              Provider.of<CartProvider>(context, listen: false);
                          cartProvider.removeFromCart(cartItem);
                        },
                        child: const CircleAvatar(
                          minRadius: 5,
                          maxRadius: 15,
                          backgroundColor: AppColors.blackColor,
                          child: Icon(
                            Icons.remove,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                color: AppColors.firstListColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Total Discount: \$${cartProvider.totalSavings.toStringAsFixed(2)}',
                        style: AppTextStyle.offertitle),
                    Text(
                        'Total Price: \$${cartProvider.totalPrice.toStringAsFixed(2)}',
                        style: AppTextStyle.offertitle),
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
