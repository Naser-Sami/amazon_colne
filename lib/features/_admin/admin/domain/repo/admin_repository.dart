import 'dart:io';

import 'package:flutter/material.dart';
import '../domain.dart';

abstract class IAdminRepository {
  Future<void> sellProduct({
    required BuildContext context,
    required ProductEntities product,
    required List<File> images,
  });
}
