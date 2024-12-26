import 'dart:io';

import 'package:flutter/material.dart';

import '../domain.dart';

class AddProductUseCase {
  final IAdminRepository repo;
  AddProductUseCase(this.repo);

  Future<void> call({
    required BuildContext context,
    required ProductEntities product,
    required List<File> images,
  }) async {
    await repo.addProduct(
      context: context,
      product: product,
      images: images,
    );
  }
}