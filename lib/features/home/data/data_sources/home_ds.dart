import 'package:e_commerce_c10_monday/features/home/data/models/BrandModel.dart';
import 'package:e_commerce_c10_monday/features/home/data/models/CartModel.dart';
import 'package:e_commerce_c10_monday/features/home/data/models/CategoryModel.dart';
import 'package:e_commerce_c10_monday/features/home/data/models/ProductModel.dart';

abstract class HomeDS{

  Future<BrandModel>getBrands();
  Future<CategoryModel>getCategories();
  Future<ProductModel>getProducts();
  Future<CartModel>addToCart(String productId);
  Future<int>getCartItems();
}