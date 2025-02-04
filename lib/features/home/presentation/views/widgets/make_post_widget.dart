import 'package:arapface1/features/user/domain/entities/user_entitiy.dart';
import 'package:flutter/material.dart';

class MakePostWidget extends StatelessWidget {
  const MakePostWidget({
    super.key,
    required this.userEntitiy,
  });
  final UserEntitiy userEntitiy;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: Colors.amber.shade100,
          borderRadius: BorderRadius.circular(30)),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            'Make Your Post ${userEntitiy.userName}....?',
            style: const TextStyle(
                fontSize: 18,
                // color: Colors.white,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
