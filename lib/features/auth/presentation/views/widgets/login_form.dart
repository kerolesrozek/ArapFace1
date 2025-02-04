import 'package:arapface1/core/app_routes.dart';
import 'package:arapface1/features/auth/domain/entities/user_auth_entity.dart';
import 'package:arapface1/features/auth/presentation/cubits/Login_cubit/login_cubit.dart';
import 'package:arapface1/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:arapface1/features/auth/presentation/views/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? email;
  String? password;
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: emailController,
            obscureText: false,
            onSaved: (value) {
              email = value;
            },
            hint: 'Email',
            lapel: 'Email',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            controller: passwordController,
            obscureText: true,
            onSaved: (value) {
              password = value;
            },
            hint: 'Password',
            lapel: 'Password',
          ),
          const SizedBox(
            height: 15,
          ),
          BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                GoRouter.of(context).push(AppRoutes.kAppViews);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Sucessssss',
                    ),
                  ),
                );
              }
              if (state is LoginFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.errorMessage,
                    ),
                  ),
                );
              }
            },
            builder: (context, state) {
              return CustomButton(
                isLoading: state is LoginLoading ? true : false,
                buttonName: 'Login',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    BlocProvider.of<LoginCubit>(context).login(
                      userauthentity: UserAuthEntity(
                        email: email!,
                        password: password!,
                      ),
                    );
                    emailController.clear();
                    passwordController.clear();
                  }
                },
              );
            },
          )
        ],
      ),
    );
  }
}
