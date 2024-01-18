import 'package:bfsi/blocs/signup/signup_bloc.dart';
import 'package:bfsi/core/consts/asset_images.dart';
import 'package:bfsi/core/consts/bfsi_colors.dart';
import 'package:bfsi/presentation/views/components/bfsi_background_box.dart';
import 'package:bfsi/presentation/views/components/bfsi_input.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF010101),
      ),
      body: BfsiBackgroundBox(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: BlocConsumer<SignupBloc, SignupState>(
              listener: (context, state) {
                if (state is SignupSuccessState) {
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
                  Routemaster.of(context).pop();
                }
              },
              builder: (context, state) {
                if (state is SignupOnLoadState) {
                  return ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 16.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sign Up',
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
                          label: 'First Name',
                          withLabel: true,
                          onChanged: (String? value) {
                            BlocProvider.of<SignupBloc>(context).add(
                              SignupDetailsUpdateEvent(
                                firstName: value,
                              ),
                            );
                          },
                          onSubmitted: (String value) {},
                        ),
                      ),
                      if (state.isFirstNameError)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Enter valid first name',
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
                          label: 'Last Name',
                          withLabel: true,
                          onChanged: (String? value) {
                            BlocProvider.of<SignupBloc>(context).add(
                              SignupDetailsUpdateEvent(
                                lastName: value,
                              ),
                            );
                          },
                          onSubmitted: (String value) {},
                        ),
                      ),
                      if (state.isLastNameError)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Enter valid last name',
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
                          label: 'Email',
                          withLabel: true,
                          onChanged: (String? value) {
                            BlocProvider.of<SignupBloc>(context).add(
                              SignupDetailsUpdateEvent(
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
                            'Enter valid email',
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
                          label: 'Phone Number',
                          withLabel: true,
                          keyboardType: TextInputType.number,
                          onChanged: (String? value) {
                            BlocProvider.of<SignupBloc>(context).add(
                              SignupDetailsUpdateEvent(
                                phoneNumber: value,
                              ),
                            );
                          },
                          onSubmitted: (String value) {},
                        ),
                      ),
                      if (state.isPhoneNumberError)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Enter valid phone number',
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
                              BlocProvider.of<SignupBloc>(context).add(
                                const SignupSubmitEvent(),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: BfsiColors.buttonColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              child: Text(
                                'Sign Up',
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
                              text: 'Hi, already a user? ',
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
                                      Routemaster.of(context).pop();
                                    },
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        decoration: TextDecoration.underline,
                                        color: BfsiColors.clickHere,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                                TextSpan(
                                  text: ' to SignIn',
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
                      Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                        child: Text(
                          'When  signing in your are accepting our',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400,
                              ),
                          textAlign: TextAlign.center,
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
                        textAlign: TextAlign.center,
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
