import 'package:arapface1/core/setup_service_locator.dart';
import 'package:arapface1/features/home/data/repos_imple/home_repos_imple.dart';
import 'package:arapface1/features/home/domain/usecases/get_likes_usecase.dart';
import 'package:arapface1/features/home/presentation/cubits/get_likes_cubit/get_likes_cubit.dart';
import 'package:arapface1/features/user/presentation/views/widgets/modal_sheet_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowLikes extends StatelessWidget {
  const ShowLikes({
    super.key,
    required this.docId,
  });
  final String docId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return BlocProvider(
                create: (context) => GetLikesCubit(
                    GetLikesUsecase(homeRepos: getIt.get<HomeReposImple>())),
                child: ModalBottomSheetBody(
                  docId: docId,
                ),
              );
            });
      },
      child: const Padding(
        padding: EdgeInsets.only(left: 20.0, top: 5),
        child: Icon(
          Icons.remove_red_eye_outlined,
          size: 28,
        ),
      ),
    );
  }
}
