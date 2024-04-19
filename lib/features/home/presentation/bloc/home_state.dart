part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(RequestStatus.init) RequestStatus getBrandsStatus,
    @Default(RequestStatus.init) RequestStatus addToCart,
    @Default(RequestStatus.init) RequestStatus getCartStatus,
    @Default(RequestStatus.init) RequestStatus getProductsStatus,
    @Default(RequestStatus.init) RequestStatus getCategoriesStatus,
    BrandModel? brandModel,
    @Default(0) int currentIndex,
    @Default(0) int cartItems,
    CategoryModel? categoryModel,
    ProductModel? productModel,
    Failures? brandFailure,
    Failures? categoryFailure,
    Failures? productFailure,
  }) = _HomeState;
}
