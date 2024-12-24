import 'package:book_app/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../Features/home/data/models/book_model/book_model.dart';
import '../../Features/home/data/repository/home_repo_impl.dart';
import '../../Features/home/presentation/manger/similar_books_cubit/similar_books__cubit.dart';
import '../../Features/home/presentation/views/book_details_view.dart';
import '../../Features/home/presentation/views/home_view.dart';
import '../../Features/search/data/repository/search_repo_impl.dart';
import '../../Features/search/presentation/manger/search_result_cubit/search_result_books_cubit.dart';
import '../../Features/search/presentation/views/search_view.dart';
import '../../Features/search/presentation/views/widgets/search_result_list_view.dart';
import '../../Features/splash/presentation/views/splash_view.dart';


abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchsView';
  static const kSearchViewResult = '/searchViewResult';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: kBookDetailsView,
      builder: (context, state) => BlocProvider(
        create: (context) => SimilarBooksCubit(
          getIt.get<HomeRepoImpl>(),
        ),
        child: BookDetailsView(
          bookModel: state.extra as BookModel,
        ),
      ),
    ),
    GoRoute(
      path: kSearchView,
      builder: (context, state) => BlocProvider(
        create: (context) => SearchResultCubit(getIt.get<SearchRepoImpl>()),
        child: const SearchView(),
      ),
    ),
    GoRoute(
      path: kSearchViewResult,
      builder: (context, state) => SearchResultListView(
        bookModel: state.extra as List<BookModel>,
      ),
    ),
  ]);
}