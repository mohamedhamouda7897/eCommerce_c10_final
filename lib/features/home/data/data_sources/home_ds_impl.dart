import 'package:e_commerce_c10_monday/core/api/api_manager.dart';
import 'package:e_commerce_c10_monday/core/api/end_points.dart';
import 'package:e_commerce_c10_monday/core/cache/shared_pref.dart';
import 'package:e_commerce_c10_monday/core/errors/failuers.dart';
import 'package:e_commerce_c10_monday/features/home/data/data_sources/home_ds.dart';
import 'package:e_commerce_c10_monday/features/home/data/models/BrandModel.dart';
import 'package:e_commerce_c10_monday/features/home/data/models/CartModel.dart';
import 'package:e_commerce_c10_monday/features/home/data/models/CategoryModel.dart';
import 'package:e_commerce_c10_monday/features/home/data/models/ProductCartModel.dart';
import 'package:e_commerce_c10_monday/features/home/data/models/ProductModel.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeDS)
class HomeDSImpl implements HomeDS {
  ApiManager apiManager;

  HomeDSImpl(this.apiManager);

  @override
  Future<BrandModel> getBrands() async {
    var response = await apiManager.getData(EndPoints.brands);

    BrandModel brandModel = BrandModel.fromJson(response.data);
    return brandModel;
  }

  @override
  Future<CategoryModel> getCategories() async {
    var response = await apiManager.getData(EndPoints.categories);

    CategoryModel categoryModel = CategoryModel.fromJson(response.data);
    return categoryModel;
  }

  @override
  Future<ProductModel> getProducts() async {
    var response = await apiManager.getData(EndPoints.products);

    ProductModel productModel = ProductModel.fromJson(response.data);
    return productModel;
  }

  @override
  Future<ProductCartModel> addProductToCart(String productId) async {
    var token = CacheHelper.getToken("token");
    var response = await apiManager.postData(EndPoints.addToCart,
        body: {"productId": productId}, header: {"token": token});
    ProductCartModel model = ProductCartModel.fromJson(response.data);
    return model;
  }

  @override
  Future<CartModel> getCart() async {
    try {
      var token = CacheHelper.getToken("token");
      var response = await apiManager
          .getData(EndPoints.addToCart, header: {"token": token});
      CartModel model = CartModel.fromJson(response.data);
      return model;
    } on FormatException catch (e) {
      print(e.message);
      throw RemoteFailures(e.message);
    } catch (e) {
      throw RemoteFailures("message");
    }
  }
}
