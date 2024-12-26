import 'package:flutter/material.dart';

class AdminSingleProduct extends StatelessWidget {
  final String image;
  const AdminSingleProduct({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Container(
          width: 180,
          padding: const EdgeInsets.all(10),
          child: Image.network(
            image,
            fit: BoxFit.fitHeight,
            width: 180,
            loadingBuilder: (context, child, loadingProgress) => Center(
              child: loadingProgress == null ? child : const CircularProgressIndicator(),
            ),
            errorBuilder: (context, error, stackTrace) => Icon(
              Icons.error,
            ),
          ),
        ),
      ),
    );
  }
}
