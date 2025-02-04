import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UserInfoLoading extends StatelessWidget {
  const UserInfoLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Skeletonizer(
          child: Column(
        children: [
          CircleAvatar(
            radius: 102,
            child: CircleAvatar(
              radius: 100,
              backgroundColor: Colors.grey,
              // backgroundImage: NetworkImage('   userEntitiy.userImage,'),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            ' userEntitiy.userName,',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 10,
          ),
          Text('// userEntitiy.bio,'),
          SizedBox(
            height: 10,
          ),
          Divider(
            endIndent: 20,
            indent: 20,
          ),
        ],
      )),
    );
  }
}
