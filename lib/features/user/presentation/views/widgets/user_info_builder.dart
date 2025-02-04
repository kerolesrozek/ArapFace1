import 'package:arapface1/features/user/presentation/cubits/get_user_info_cubit/get_user_info_cubit.dart';
import 'package:arapface1/features/user/presentation/views/widgets/user_info_loading.dart';
import 'package:arapface1/features/user/presentation/views/widgets/user_info_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfoBuilder extends StatelessWidget {
  const UserInfoBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserInfoCubit, GetUserInfoState>(
      builder: (context, state) {
        if (state is GetUserInfoSuccess) {
          return UserInfoTop(
            userEntitiy: state.userEntitiy,
          );
        } else if (state is GetUserInfoFailure) {
          return SliverToBoxAdapter(child: Text(state.errormessage));
        } else {
          return const UserInfoLoading();
        }
      },
    );
  }
}
