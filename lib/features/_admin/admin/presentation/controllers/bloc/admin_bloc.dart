import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/features/_features.dart';

part 'admin_event.dart';
part 'admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  List<ProductEntities> _products = [];
  final AddProductUseCase _addProductUseCase;
  final GetProductsUseCase _getProductsUseCase;
  final DeleteProductUseCase _deleteProductUseCase;

  AdminBloc(
    this._addProductUseCase,
    this._getProductsUseCase,
    this._deleteProductUseCase,
  ) : super(AdminInitial()) {
    on<AddProductEvent>(_onAddProductEvent);
    on<GetProductsEvent>(_onGetProductsEvent);
    on<DeleteProductEvent>(_onDeleteProductEvent);
  }

  void _onAddProductEvent(AddProductEvent event, Emitter<AdminState> emit) async {
    emit(AdminLoadingState());
    try {
      await _addProductUseCase.call(
        context: event.context,
        product: event.product,
        images: event.images,
      );

      log('images: ${event.images}');
      log('product: ${event.product}');

      _products.add(event.product);
      emit(AdminSuccessState(_products));
    } catch (e) {
      emit(AdminFailureState(e.toString()));
    }
  }

  Future<void> _onGetProductsEvent(
      GetProductsEvent event, Emitter<AdminState> emit) async {
    emit(AdminLoadingState());
    try {
      _products = await _getProductsUseCase.call();
      emit(AdminSuccessState(_products));
    } catch (e) {
      emit(AdminFailureState(e.toString()));
    }
  }

  void _onDeleteProductEvent(DeleteProductEvent event, Emitter<AdminState> emit) {
    emit(AdminLoadingState());
    try {
      _deleteProductUseCase.call(id: event.id);
      _products.removeWhere((product) => product.id == event.id);
      emit(AdminSuccessState(_products));
    } catch (e) {
      emit(AdminFailureState(e.toString()));
    }
  }
}
