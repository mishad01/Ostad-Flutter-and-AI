import 'dart:convert';

import '../../core/end_points.dart';
import '../../domain/entities/brand.dart';
import '../model/brand_model.dart';
import 'network/network_caller.dart';

class BrandService {
  final _networkCaller = NetworkCaller();

  Future<List<Brand>> getBrands() async {
    final response = await _networkCaller.get(
      Uri.parse(EndPoints.brands),
      headers: {'accept': 'application/json'},
    );
    if (response.isSuccess != true) {
      throw Exception(response.errorMessage);
    }
    final json = jsonDecode(response.body!);
    return (json['data']['results'] as List)
        .map((e) => BrandModel.fromJson(e))
        .toList();
  }
}
