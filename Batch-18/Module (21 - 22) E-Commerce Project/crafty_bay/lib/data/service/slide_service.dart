import 'dart:convert';

import '../../core/end_points.dart';
import '../../domain/entities/slide.dart';
import '../model/slide_model.dart';
import 'network/network_caller.dart';

class SlideService {
  final _networkCaller = NetworkCaller();

  Future<List<Slide>> getSlides() async {
    final response = await _networkCaller.get(
      Uri.parse(EndPoints.slides),
      headers: {'accept': 'application/json'},
    );
    if (response.isSuccess != true) {
      throw Exception(response.errorMessage);
    }
    final json = jsonDecode(response.body!);
    return (json['data']['results'] as List)
        .map((e) => SlideModel.fromJson(e))
        .toList();
  }
}
