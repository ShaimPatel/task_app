import 'package:flutter/material.dart';

class ItemShowWidget extends StatelessWidget {
  const ItemShowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: 130,
        width: double.infinity,
        color: Colors.amber,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("This is Product title"),
                    Text("This is Product description"),
                    Text("Size : S"),
                    Text("Price : 128"),
                  ],
                ),
              ),
            ),
            Column(
              children: const [
                Image(
                  height: 70,
                  width: 70,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/image/man_phone.png'),
                ),
                Image(
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/image/man_phone.png'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
