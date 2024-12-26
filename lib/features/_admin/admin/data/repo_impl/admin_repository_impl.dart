import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cloudinary_public/cloudinary_public.dart';

import '/core/_core.dart';
import '../../_admin.dart';

class AdminRepositoryImpl implements IAdminRepository {
  final AdminRemoteDataSource _remoteDataSource;
  AdminRepositoryImpl(this._remoteDataSource);

  @override
  Future<void> addProduct(
      {required BuildContext context,
      required ProductEntities product,
      required List<File> images}) async {
    try {
      // Upload images to Cloudinary
      final cloudinary = CloudinaryPublic('dwpv7bmfx', 'hj71qwkq');

      // get the URL
      List<String> imageUrls = [];

      // fill the imageUrls list with the URLs of the uploaded images
      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: product.name),
        );
        imageUrls.add(res.secureUrl);
      }

      // Create a new product model
      final productEntity = ProductEntities(
        name: product.name,
        description: product.description,
        quantity: product.quantity,
        images: imageUrls,
        category: product.category,
        price: product.price,
      );

      // Create a new product model
      final productModel = ProductMapper.toModel(productEntity);

      // Call the remote data source to save the product
      await _remoteDataSource.addProduct(product: productModel);

      // Show a success message
      if (context.mounted) {
        THelperFunctions.showToastBar(context, Text('Product added successfully'));
        GoRouter.of(context).pop();
      }
    } catch (e) {
      if (context.mounted) {
        THelperFunctions.showToastBar(context, Text(e.toString()));
      }
    }
  }

  @override
  Future<List<ProductEntities>> getProducts() async {
    try {
      final productsModel = await _remoteDataSource.getProducts();

      return productsModel
          .map((productModel) => ProductMapper.toEntity(productModel))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteProduct({required String id}) async {
    try {
      return await _remoteDataSource.deleteProduct(id: id);
    } catch (e) {
      rethrow;
    }
  }
}
