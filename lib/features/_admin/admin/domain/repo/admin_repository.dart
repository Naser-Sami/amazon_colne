import 'dart:io';

import 'package:flutter/material.dart';
import '../domain.dart';

abstract class IAdminRepository {
  Future<void> addProduct({
    required BuildContext context,
    required ProductEntities product,
    required List<File> images,
  });

  Future<List<ProductEntities>> getProducts();

  Future<void> deleteProduct({
    required String id,
  });
}
