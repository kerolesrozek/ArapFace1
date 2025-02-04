import 'package:arapface1/features/add_user/presentation/views/add_user_view.dart';
import 'package:arapface1/features/auth/presentation/views/login_view.dart';
import 'package:arapface1/features/auth/presentation/views/register_view.dart';
import 'package:arapface1/features/splash/presentation/views/splash_view.dart';
import 'package:arapface1/features/user/presentation/views/app_views.dart';
import 'package:arapface1/features/user/presentation/views/edit_user_info_view.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const kLoginView = '/kLoginView';
  static const kRegisterView = '/kRegisterView';

  static const kAddUserView = '/kAddUserView';

  static const kAppViews = '/kAppViews';
  static const kEditUserInfoView = '/kEditUserInfoView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: kAddUserView,
        builder: (context, state) => const AddUserView(),
      ),
      GoRoute(
        path: kAddUserView,
        builder: (context, state) => const AppViews(),
      ),
      GoRoute(
        path: kAppViews,
        builder: (context, state) => const AppViews(),
      ),
      GoRoute(
        path: kEditUserInfoView,
        builder: (context, state) => const EditUserInfoView(),
      ),
    ],
  );
}
