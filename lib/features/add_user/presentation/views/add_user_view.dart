import 'package:arapface1/features/add_user/data/data_sources/add_user_remote_data_source.dart';
import 'package:arapface1/features/add_user/data/repso_imple/add_user_repos_imple.dart';
import 'package:arapface1/features/add_user/domain/usecases/add_user_usecase.dart';
import 'package:arapface1/features/add_user/presentation/cubits/add_user_cubit/add_user_cubit.dart';
import 'package:arapface1/features/add_user/presentation/views/widgets/add_user_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddUserView extends StatelessWidget {
  const AddUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddUserCubit(
        AddUserUsecase(
          addUserRepos: AddUserReposImple(
            addUserRemoteDataSource: AddUserRemoteDataSourceImple(),
          ),
        ),
      ),
      child: WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return false;
        },
        child: const Scaffold(
          body: SafeArea(child: AddUserViewBody()),
        ),
      ),
    );
  }
}
