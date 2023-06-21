import 'package:dio/dio.dart';
import 'package:ecommerce/api/app.dart';
import 'package:ecommerce/models/product.dart';

class ApiProduct{

  Future<List<Product>> getProductsByCategory({int categoryId=1, int page=0}) async {
    List<Product> products = [];
    var json = await Dio().get('${url}products/getProductsByParams?categoryId=${categoryId}&page=${page}');
    print(json.data['content']);
    List myProducts = json.data['content'];
    myProducts.forEach((value) {
      Product product = Product.fromMap(value);
      products.add(product);
    });
    return products;
  }
}