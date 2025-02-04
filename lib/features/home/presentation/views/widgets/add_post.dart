import 'package:arapface1/features/home/presentation/views/widgets/add_post_loading.dart';
import 'package:arapface1/features/home/presentation/views/widgets/make_post_widget.dart';
import 'package:arapface1/features/home/presentation/views/widgets/modal_sheet_body.dart';
import 'package:arapface1/features/user/presentation/cubits/get_user_info_cubit/get_user_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPost extends StatefulWidget {
  const AddPost({
    super.key,
  });

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetUserInfoCubit>(context).getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserInfoCubit, GetUserInfoState>(
      builder: (context, state) {
        if (state is GetUserInfoSuccess) {
          return Row(
            children: [
              CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(state.userEntitiy.userImage),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return const ModalSheetBody();
                        });
                  },
                  child: MakePostWidget(
                    userEntitiy: state.userEntitiy,
                  ),
                ),
              ),
            ],
          );
        } else if (state is GetUserInfoFailure) {
          return Text(state.errormessage);
        } else {
          return const AddPostLoadingWidget();
        }
      },
    );
  }
}
