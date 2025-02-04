import 'package:arapface1/features/home/presentation/views/widgets/modal_sheet_body.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AddPostLoadingWidget extends StatelessWidget {
  const AddPostLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        enabled: true,
        child: Row(
          children: [
            const CircleAvatar(
              radius: 35,
              backgroundColor: Colors.grey,
              // backgroundImage: NetworkImage(''),
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
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.amber.shade100,
                      borderRadius: BorderRadius.circular(30)),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        'Make Your Post ....?',
                        style: TextStyle(
                            fontSize: 18,
                            // color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
