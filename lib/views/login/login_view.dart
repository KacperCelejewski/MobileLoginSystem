import 'package:dsw51715/utils/my_images.dart';
import 'package:dsw51715/views/widgets/basic_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../utils/my_colors.dart';
import '../register/register_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 62),
              Image.asset(MyImages.logo),
              Padding(
                padding: const EdgeInsets.only(
                  left: 19,
                  bottom: 46,
                  top: 21,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _signInText,
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: BasicTextFormField(
                  initialValue: 'Email or User Name',
                  pathToIcon: MyImages.userIcon,
                ),
              ),
              SizedBox(height: 40),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: BasicTextFormField(
                  pathToIcon: MyImages.pwdIcon,
                  pathToSufIcon: MyImages.eye,
                  initialValue: 'Password',
                ),
              ),
              const SizedBox(height: 40),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forget Password?',
                      style: TextStyle(
                        color: MyColors.purpleColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 19,
                    )
                  ],
                ),
              ),
              SizedBox(height: 40),
              SizedBox(
                width: 390,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: MyColors.borderPurpleColor,
                    elevation: 0,
                  ),
                  child: const Text('Sign in'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterView()),
                    );
                  },
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 75),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dont have account? ',
                        style: TextStyle(
                          fontSize: 15,
                          color: MyColors.purpleColor,
                        ),
                      ),
                      GestureDetector(
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: MyColors.purpleColor,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterView()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget get _signInText {
  return Text(
    'Sign in',
    style: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w700,
      color: MyColors.purpleColor,
    ),
  );
}
