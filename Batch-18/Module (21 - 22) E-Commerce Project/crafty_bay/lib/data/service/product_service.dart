import 'dart:convert';

import '../../core/end_points.dart';
import '../../domain/entities/product.dart';
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
}
