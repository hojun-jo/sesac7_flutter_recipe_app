import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/component/button/big_button.dart';
import 'package:flutter_recipe_app/core/presentation/component/button/oauth_button.dart';
import 'package:flutter_recipe_app/core/presentation/component/input/input_field.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class SignInScreen extends StatelessWidget {
  static const Key signInButtonKey = Key('SignInScreen sign in button key');
  static const Key signUpButtonKey = Key('SignInScreen sign up button key');

  final VoidCallback onSignInTap;
  final VoidCallback onSignUpTap;

  const SignInScreen({
    super.key,
    required this.onSignInTap,
    required this.onSignUpTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 50, 30, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello,',
                      style: TextStyles.headerTextBold,
                    ),
                    Text(
                      'Welcome back!',
                      style: TextStyles.largeTextRegular,
                    ),
                  ],
                ),
                const SizedBox(height: 57),
                InputField(
                  label: 'Email',
                  placeholder: 'Enter Email',
                  onValueChange: (value) {},
                ),
                const SizedBox(height: 30),
                InputField(
                  label: 'Enter Password',
                  placeholder: 'Enter Password',
                  onValueChange: (value) {},
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 0, 25),
                  child: GestureDetector(
                    onTap: () => {},
                    child: Text(
                      'Forgot Password?',
                      style: TextStyles.smallerTextRegular.copyWith(
                        color: AppColors.secondary100,
                      ),
                    ),
                  ),
                ),
                BigButton(
                  key: signInButtonKey,
                  text: 'Sign In',
                  onClick: onSignInTap,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    spacing: 7,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 1,
                        color: AppColors.gray4,
                      ),
                      Text(
                        'Or Sign In with',
                        style: TextStyles.smallerTextRegular.copyWith(
                          color: AppColors.gray4,
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 1,
                        color: AppColors.gray4,
                      ),
                    ],
                  ),
                ),
                Row(
                  spacing: 25,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OAuthButton(
                      imageAssetPath: 'assets/images/icon/google.png',
                      onTap: () {},
                    ),
                    OAuthButton(
                      imageAssetPath: 'assets/images/icon/facebook.png',
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 55),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account? ',
                      style: TextStyles.smallerTextRegular.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      key: signUpButtonKey,
                      onTap: onSignUpTap,
                      child: Text(
                        'Sign up',
                        style: TextStyles.smallerTextRegular.copyWith(
                          color: AppColors.secondary100,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
