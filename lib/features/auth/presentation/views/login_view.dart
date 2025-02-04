import 'package:arapface1/core/setup_service_locator.dart';
import 'package:arapface1/features/auth/data/repos_imple/auth_repos_imple.dart';
import 'package:arapface1/features/auth/domain/usecases/login_usecase.dart';
import 'package:arapface1/features/auth/presentation/cubits/Login_cubit/login_cubit.dart';
import 'package:arapface1/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LoginCubit(LoginUsecase(authRepos: getIt.get<AuthReposImple>())),
      child: WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return false;
        },
        child: const Scaffold(
          body: SafeArea(child: LoginViewBody()),
        ),
      ),
    );
  }
}
