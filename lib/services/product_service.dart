import 'dart:convert';

import 'package:shamo/models/product_model.dart';
import 'package:http/http.dart' as http;

import 'api_service.dart';

class ProductService {
  Future<List<ProductModel>> getProducts() async {
    final url = Uri.parse('$baseUrl/products');
    final headers = {'Content-Type': 'application/json'};

    final response = await http.get(
      url,
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<ProductModel> products = [];

      for (final item in data) {
        products.add(ProductModel.fromJson(item));
      }

      return products;
    } else {
      throw Exception('Gagal Get Products!');
    }
  }
}
