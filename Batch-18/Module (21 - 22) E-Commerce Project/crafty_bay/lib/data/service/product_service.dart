import 'dart:convert';

import '../../core/end_points.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/product_details.dart';
import '../model/product_details_model.dart';
import '../model/product_model.dart';
import 'network/network_caller.dart';

class ProductService {
  final _networkCaller = NetworkCaller();

  Future<List<Product>> getProducts() async {
    final response = await _networkCaller.get(
      Uri.parse(EndPoints.products),
      headers: {'accept': 'application/json'},
    );
    if (response.isSuccess != true) {
      throw Exception(response.errorMessage);
    }
    final json = jsonDecode(response.body!);
    return (json['data']['results'] as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }

  Future<ProductDetails> getProductDetails(String id) async {
    final response = await _networkCaller.get(
      Uri.parse(EndPoints.productById(id)),
      headers: {'accept': 'application/json'},
    );
    if (response.isSuccess != true) {
      throw Exception(response.errorMessage);
    }
    final json = jsonDecode(response.body!);
    return ProductDetailsModel.fromJson(json['data']);
  }
}
