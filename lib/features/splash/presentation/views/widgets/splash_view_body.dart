import 'package:arapface1/core/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    navigateToLoginView();
  }

// method navigate to login view
  void navigateToLoginView() {
    Future.delayed(
        const Duration(
          seconds: 5,
        ), () {
      GoRouter.of(context).push(AppRoutes.kLoginView);
    });
  }
  //end

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Shimmer.fromColors(
      baseColor: Colors.blue,
      highlightColor: Colors.white,
      child: const Text(
        'ArapFace',
        style: TextStyle(
            fontSize: 60, color: Colors.blue, fontWeight: FontWeight.bold),
      ),
    ));
  }
}
