import 'package:arapface1/features/home/presentation/cubits/get_likes_cubit/get_likes_cubit.dart';
import 'package:arapface1/features/user/presentation/views/widgets/likes_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModalBottomSheetBody extends StatefulWidget {
  const ModalBottomSheetBody({
    super.key,
    required this.docId,
  });
  final String docId;

  @override
  State<ModalBottomSheetBody> createState() => _ModalBottomSheetBodyState();
}

class _ModalBottomSheetBodyState extends State<ModalBottomSheetBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetLikesCubit>(context).getLikes(docID: widget.docId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetLikesCubit, GetLikesState>(
      builder: (context, state) {
        if (state is GetLikesSuccess) {
          return LiskesListView(
            likes: state.likes,
          );
        } else if (state is GetLikesFailure) {
          return Text(state.errorMessage);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
