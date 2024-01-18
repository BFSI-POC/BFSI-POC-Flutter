import 'package:bfsi/blocs/app_state_bloc.dart';
import 'package:bfsi/blocs/login/login_bloc.dart';
import 'package:bfsi/core/consts/asset_images.dart';
import 'package:bfsi/core/consts/bfsi_colors.dart';
import 'package:bfsi/presentation/views/components/bfsi_background_box.dart';
import 'package:bfsi/presentation/views/components/bfsi_input.dart';
import 'package:bfsi/routes/page_routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF010101),
      ),
      body: BfsiBackgroundBox(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccessState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      content: Text(
                        state.message,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  );
                  // Route back to login page on successful signup
                  BlocProvider.of<AppStateBloc>(context).add(
                    const CompleteLoginEvent(),
                  );
                }
              },
              builder: (context, state) {
                if (state is LoginOnLoadState) {
                  return Column(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 16.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Sign In',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          fontSize: 48.0,
                                          fontWeight: FontWeight.w500,
                                          color: BfsiColors.signInGrey,
                                        ),
                                  ),
                                  Image.asset(AssetImages.logo),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: BfsiInput(
                                label: 'User name',
                                withLabel: true,
                                prefixIcon: Image.asset(
                                  AssetImages.iaUser,
                                  height: 24.0,
                                  width: 24.0,
                                ),
                                onChanged: (String? value) {
                                  BlocProvider.of<LoginBloc>(context).add(
                                    LoginDetailsUpdateEvent(
                                      email: value,
                                    ),
                                  );
                                },
                                onSubmitted: (String value) {},
                              ),
                            ),
                            if (state.isEmailError)
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  'Enter valid username',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        color: BfsiColors.errorColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.0,
                                      ),
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: BfsiInput(
                                obscureText: state.isPasswordObscured,
                                label: 'Password',
                                withLabel: true,
                                prefixIcon: Image.asset(
                                  AssetImages.carbonPassword,
                                  height: 24.0,
                                  width: 24.0,
                                ),
                                isSuffix: true,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    BlocProvider.of<LoginBloc>(context)
                                        .add(const LoginPasswordVisibleEvent());
                                  },
                                  icon: Icon(
                                    state.isPasswordObscured
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.black,
                                    size: 24.0,
                                  ),
                                ),
                                onChanged: (String? value) {
                                  BlocProvider.of<LoginBloc>(context).add(
                                    LoginDetailsUpdateEvent(
                                      password: value,
                                    ),
                                  );
                                },
                                onSubmitted: (String value) {},
                              ),
                            ),
                            if (state.isPasswordError)
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  'Enter valid Password',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        color: BfsiColors.errorColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.0,
                                      ),
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.only(top: 80.0),
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    BlocProvider.of<LoginBloc>(context).add(
                                      const LoginSubmitEvent(),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: BfsiColors.buttonColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0),
                                    child: Text(
                                      'Sign In',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 24.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Center(
                                child: Text.rich(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  TextSpan(
                                    text: 'Hi, new to Shoal? ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                    children: [
                                      TextSpan(
                                        text: 'click here',
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Routemaster.of(context).push(
                                              '${InitialPageRoutes.login}/${RelativePageRoutes.signUp}',
                                            );
                                          },
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              decoration:
                                                  TextDecoration.underline,
                                              color: BfsiColors.clickHere,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                      ),
                                      TextSpan(
                                        text: ' to SignUp',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              color: Colors.white,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'When signing in your are accepting our',
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w400,
                                ),
                      ),
                      Text(
                        'Terms and conditions',
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w400,
                                ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Image.asset(AssetImages.shoalCopyright),
                      ),
                    ],
                  );
                } else {
                  return const SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
