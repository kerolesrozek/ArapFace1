import 'package:arapface1/core/app_routes.dart';
import 'package:arapface1/features/auth/domain/entities/user_auth_entity.dart';
import 'package:arapface1/features/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:arapface1/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:arapface1/features/auth/presentation/views/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController textEditingController1 = TextEditingController();

  TextEditingController textEditingController2 = TextEditingController();
  String? email;
  String? password;
  @override
  void dispose() {
    textEditingController1.dispose();
    textEditingController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: textEditingController1,
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
            controller: textEditingController2,
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
          BlocConsumer<RegisterCubit, RegisterState>(
            listener: (BuildContext context, RegisterState state) {
              if (state is RegisterSuccess) {
                GoRouter.of(context).push(AppRoutes.kAddUserView);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Successssss',
                    ),
                  ),
                );
              }
              if (state is RegisterFailure) {
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
                isLoading: state is RegisterLoading ? true : false,
                buttonName: 'Register',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    BlocProvider.of<RegisterCubit>(context).register(
                      userauthentity:
                          UserAuthEntity(email: email!, password: password!),
                    );
                  }
                  textEditingController1.clear();
                  textEditingController2.clear();
                },
              );
            },
          )
        ],
      ),
    );
  }
}
