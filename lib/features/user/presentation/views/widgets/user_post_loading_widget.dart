import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

class UserPostsLoadingWidget extends StatelessWidget {
  const UserPostsLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.grey.shade300,
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.70,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => Column(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      height: 20,
                      width: 40,
                    ),
                    const Spacer(),
                    CircleAvatar(
                      radius: 31,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: const NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4ajTJjt8y_cc9ZkiqQgBI89hJMiWnhtkYNg&s',
                        ),
                        onBackgroundImageError: (exception, stackTrace) =>
                            const Text('error'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.comment,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  indent: 25,
                  endIndent: 25,
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ));
  }
}
