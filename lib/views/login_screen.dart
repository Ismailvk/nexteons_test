import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_1/constants/text_style.dart';
import 'package:test_1/controller/login/login_bloc.dart';
import 'package:test_1/utils/snackbar.dart';
import 'package:test_1/utils/validations.dart';
import 'package:test_1/widget/button_widget.dart';
import 'package:test_1/widget/textformfield_widget.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ListView(
            shrinkWrap: true,
            children: [
              Form(
                key: loginKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/login_page_logo.png'),
                    Text(
                      'Welcome Back!',
                      style: AppFonts.welcomeStyle,
                    ),
                    const Text('Login your Account'),
                    SizedBox(height: size.height / 28),
                    Text('Username or Email', style: AppFonts.normalBold),
                    TextFormFieldWidget(
                      controller: emailController,
                      validator: (value) => Validation.isEmpty(value, 'email'),
                    ),
                    Text('Password', style: AppFonts.normalBold),
                    TextFormFieldWidget(
                      controller: passwordController,
                      validator: (value) => Validation.isPassword(value),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: BlocConsumer<LoginBloc, LoginState>(
                        listener: (context, state) {
                          if (state is LoginFailedState) {
                            // ignore: void_checks
                            return customSnackbar(context, true, state.message);
                          }
                        },
                        builder: (context, state) {
                          // if (state is LoginLoadingState) {
                          //   return const Center(
                          //     child: CircularProgressIndicator(),
                          //   );
                          // }
                          return ButtonWidget(
                            title: 'LOGIN',
                            onPress: () {
                              if (loginKey.currentState!.validate()) {
                                context.read<LoginBloc>().add(
                                      LoginButtonEvent(
                                        email: emailController.text,
                                        password: passwordController.text,
                                        context: context,
                                      ),
                                    );
                              }
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
