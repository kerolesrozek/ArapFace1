import 'package:arapface1/core/app_routes.dart';
import 'package:arapface1/features/auth/presentation/views/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.20,
          ),
          const Text(
            'ArapFace',
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          const SizedBox(
            height: 30,
          ),
          const Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              'LogIn',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const LoginForm(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'You dont hanve an account?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              TextButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRoutes.kRegisterView);
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
