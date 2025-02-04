import 'package:arapface1/core/app_routes.dart';
import 'package:arapface1/features/user/domain/entities/user_entitiy.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserInfoTop extends StatelessWidget {
  const UserInfoTop({super.key, required this.userEntitiy});
  final UserEntitiy userEntitiy;

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
      CircleAvatar(
        radius: 102,
        child: CircleAvatar(
          radius: 100,
          backgroundImage: NetworkImage(
            userEntitiy.userImage,
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        userEntitiy.userName,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            userEntitiy.bio??'',
          ),
          IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRoutes.kEditUserInfoView,extra: userEntitiy);
              },
              icon: Icon(
                Icons.edit,
                color: Colors.black,
                size: 27,
              )),
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      const Divider(
        endIndent: 20,
        indent: 20,
      ),
    ]));
  }
}
