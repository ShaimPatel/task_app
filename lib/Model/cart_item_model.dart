// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartItem {
  final String itemId;
  final String itemName;
  final String image;
  final double price;
  final String size;
  int quantity;

  CartItem({
    required this.size,
    required this.itemId,
    required this.itemName,
    required this.image,
    required this.price,
    this.quantity = 0,
  });
}
