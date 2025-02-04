import 'package:arapface1/core/setup_service_locator.dart';
import 'package:arapface1/features/auth/data/repos_imple/auth_repos_imple.dart';
import 'package:arapface1/features/auth/domain/usecases/register_usecase.dart';
import 'package:arapface1/features/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:arapface1/features/auth/presentation/views/widgets/register_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(
        RegisterUsecase(authRepos: getIt.get<AuthReposImple>()),
      ),
      child: const Scaffold(
        body: SafeArea(child: RegisterViewBody()),
      ),
    );
  }
}
