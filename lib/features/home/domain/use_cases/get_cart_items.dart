import 'package:dartz/dartz.dart';
import 'package:e_commerce_c10_monday/core/errors/failuers.dart';
import 'package:e_commerce_c10_monday/features/home/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/CartModel.dart';

@injectable
class GetCartItemsUseCase {
  HomeRepo repo;

  GetCartItemsUseCase(this.repo);

  Future<Either<Failures, int>> call() =>
      repo.getCartItems();
}
