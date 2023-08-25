import 'package:flutter/material.dart';

class IconLink extends StatelessWidget {
  final IconData icon;
  final String link;

  const IconLink({super.key, required this.icon, required this.link});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon),
          const SizedBox(width: 20),
          Text(
            link,
            maxLines: 1,
            style: const TextStyle(color: Colors.blue, fontSize: 12),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
