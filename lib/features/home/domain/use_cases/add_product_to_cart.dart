import 'package:dartz/dartz.dart';
import 'package:e_commerce_c10_monday/features/home/data/models/ProductCartModel.dart';
import 'package:e_commerce_c10_monday/features/home/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failuers.dart';

@injectable
class AddProductToCartUseCase {
  HomeRepo repo;
  AddProductToCartUseCase(this.repo);

  Future<Either<Failures, ProductCartModel>> call({required String productId}) => repo.addProductToCart(productId);
}