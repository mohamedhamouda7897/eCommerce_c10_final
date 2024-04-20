import 'package:bloc/bloc.dart';
import 'package:e_commerce_c10_monday/core/enums/enums.dart';
import 'package:e_commerce_c10_monday/core/errors/failuers.dart';
import 'package:e_commerce_c10_monday/features/home/data/models/BrandModel.dart';
import 'package:e_commerce_c10_monday/features/home/data/models/CategoryModel.dart';
import 'package:e_commerce_c10_monday/features/home/data/models/ProductModel.dart';
import 'package:e_commerce_c10_monday/features/home/domain/use_cases/add_to_cart.dart';
import 'package:e_commerce_c10_monday/features/home/domain/use_cases/get_brands_useCase.dart';
import 'package:e_commerce_c10_monday/features/home/domain/use_cases/get_cart_items.dart';
import 'package:e_commerce_c10_monday/features/home/domain/use_cases/get_categories_useCase.dart';
import 'package:e_commerce_c10_monday/features/home/domain/use_cases/get_products_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_event.dart';

part 'home_state.dart';

part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetBrandsUseCase getBrandsUseCase;
  GetProductsUseCase getProductsUseCase;
  GetCategoriesUseCase getCategoriesUseCase;

  GetCartItemsUseCase getCartItemsUseCase;
  AddToCartUseCase addToCartUseCase;

  HomeBloc(
      {required this.getBrandsUseCase,
      required this.getProductsUseCase,
      required this.addToCartUseCase,
      required this.getCartItemsUseCase,
      required this.getCategoriesUseCase})
      : super(const HomeState()) {
    on<GetBrandsEvent>((event, emit) async {
      emit(state.copyWith(getBrandsStatus: RequestStatus.loading));

      var result = await getBrandsUseCase();
      result.fold((l) {
        emit(state.copyWith(
            getBrandsStatus: RequestStatus.failure, brandFailure: l));
      }, (r) {
        emit(state.copyWith(
            getBrandsStatus: RequestStatus.success, brandModel: r));
      });
    });

    on<GetCategoriesEvent>((event, emit) async {
      emit(state.copyWith(getCategoriesStatus: RequestStatus.loading));
      var result = await getCategoriesUseCase();

      result.fold((l) {
        emit(state.copyWith(
            getCategoriesStatus: RequestStatus.failure, categoryFailure: l));
      }, (r) {
        emit(state.copyWith(
            getCategoriesStatus: RequestStatus.success, categoryModel: r));
      });
    });

    on<GetProductsEvent>((event, emit) async {
      emit(state.copyWith(getProductsStatus: RequestStatus.loading));
      var result = await getProductsUseCase();

      result.fold((l) {
        emit(state.copyWith(
            getProductsStatus: RequestStatus.failure, productFailure: l));
      }, (r) {
        emit(state.copyWith(
            getProductsStatus: RequestStatus.success, productModel: r));
      });
    });
    on<ChangeNavBar>((event, emit) {
      emit(state.copyWith(currentIndex: event.index));
    });

    on<AddToCartEvent>((event, emit) async {
      emit(state.copyWith(addToCart: RequestStatus.loading));

      var result = await addToCartUseCase(event.productId);

      result.fold((l) {
        emit(state.copyWith(addToCart: RequestStatus.failure));
      }, (r) {
        emit(state.copyWith(addToCart: RequestStatus.success));
      });
    });

    on<GetCartEvent>((event, emit) async {
      emit(state.copyWith(getCartItemsStatus: RequestStatus.loading,
          addToCart: RequestStatus.init));

      var result = await getCartItemsUseCase();

      result.fold((l) {
        emit(state.copyWith(getCartItemsStatus: RequestStatus.failure));
      }, (r) {
        emit(state.copyWith(
            getCartItemsStatus: RequestStatus.success, cartItems: r));
      });
    });
  }
}
