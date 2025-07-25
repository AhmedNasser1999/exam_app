import 'package:flutter/material.dart';

class SubjectItem extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String imageUrl;
  const SubjectItem({
    super.key,
    required this.onTap,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        height: 80,
        child: Card(
          elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                SizedBox(
                  width: 50.0,
                  height: 50.0,
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
