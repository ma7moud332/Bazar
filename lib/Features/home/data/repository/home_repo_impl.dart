import 'package:book_app/Features/home/data/models/book_model/book_model.dart';
import 'package:book_app/Features/home/data/repository/home_repo.dart';
import 'package:book_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks() {

    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() {

    throw UnimplementedError();
  }
}