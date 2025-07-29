import 'package:flutter/material.dart';

class SubjectItem extends StatelessWidget {
  final VoidCallback onTap;
  final String imageUrl;
  final String title;
  const SubjectItem({super.key, 
    required this.onTap,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 80,
        child: Card(
          elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(imageUrl, fit: BoxFit.cover),
                ),
                const SizedBox(width: 10.0),
                Text(title),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
