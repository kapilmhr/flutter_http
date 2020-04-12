import 'dart:convert';

import 'package:flowers/models/flowers.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<Flower>> getFlowers() async {
    try {
      var url = Uri.http("services.hanselandpetal.com", "feeds/flowers.json");

      final response = await http.get(url);
      final responseJson = json.decode(response.body);

      print('flowers: $responseJson');

      print(responseJson);
      return parseflowers(response.body);
    } catch (e) {
      print(e);
      throw Exception('Failed to load Flowers from API');
    }
  }

  List<Flower> parseflowers(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Flower>((json) => Flower.fromJson(json)).toList();
  }
}
