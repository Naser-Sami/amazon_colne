import 'dart:io';

import 'package:flutter/material.dart';

import '../domain.dart';

class SellProductUseCase {
  final IAdminRepository repo;
  SellProductUseCase({required this.repo});

  Future<void> call({
    required BuildContext context,
    required ProductEntities product,
    required List<File> images,
  }) async {
    await repo.sellProduct(
      context: context,
      product: product,
      images: images,
    );
  }
}
