import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jad/model/cart.dart';
import 'package:jad/model/home_banner.dart';
import 'package:jad/model/home_category_calss.dart';
import 'package:jad/model/product_item.dart';

abstract class ApiController {
  static const _baseUrl = 'https://e-solutionsgroup.org';

  static Future<List<HomeBannerModel>> getHomeBanners() async {
    final response = await http.get(
      Uri.parse('${ApiController._baseUrl}/home_banner.php'),
      headers: {
        'accept': 'application/json',
      },
    );
    print(response.body);
    return (jsonDecode(response.body)['Home_banner'] as List)
        .map((json) => HomeBannerModel.fromJson(json))
        .toList();
  }

  static Future<List<HomeCategoryModel>> getCategories() async {
    final response = await http.get(
      Uri.parse('${ApiController._baseUrl}/home_category.php'),
      headers: {
        'accept': 'application/json',
      },
    );
    print(response.body);
    return (jsonDecode(response.body)['Home_Category'] as List)
        .map((json) => HomeCategoryModel.fromJson(json))
        .toList();
  }

  static Future<Map<String, dynamic>> getCarts() async {
    final response = await http.get(
      Uri.parse('${ApiController._baseUrl}/cart.php'),
      headers: {
        'accept': 'application/json',
      },
    );
    print(response.body);
    return jsonDecode(response.body);
  }

  static Future<ProductModel> getProduct() async {
    final response = await http.get(
      Uri.parse('${ApiController._baseUrl}/view_product.php'),
      headers: {
        'accept': 'application/json',
      },
    );
    print(response.body);
    return ProductModel.fromJson(
        (jsonDecode(response.body) as Map<String, dynamic>));
  }

  static Future<List<ProductModel>> getAllProducts() async {
    final response = await http.get(
      Uri.parse('${ApiController._baseUrl}/all_products.php'),
      headers: {
        'accept': 'application/json',
      },
    );
    print(response.body);
    return (jsonDecode(response.body)['Home_All'] as List)
        .map((json) => ProductModel.fromJson(json))
        .toList();
  }
}
