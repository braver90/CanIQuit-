import 'package:can_i_quit/features/home/presentation/pages/first_page.dart';
import 'package:can_i_quit/features/home/presentation/pages/second_page.dart';
import 'package:go_router/go_router.dart';

class HomeRouter {
  static getRoutes() {
    return [
      GoRoute(
          path: '/',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: FirstPage())),
      GoRoute(
          path: '/second',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: SecondPage())),
    ];
  }
}
