import 'package:can_i_quit/features/login/presentation/pages/login_page.dart';
import 'package:go_router/go_router.dart';

class LoginRouter {
  static List<RouteBase> getRoutes() {
    return [
      GoRoute(path: "/login", builder: (context, state) => const LoginPage())
    ];
  }
}
