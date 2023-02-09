





import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nusuk/auth_view/check_email.dart';
import 'package:nusuk/auth_view/send_email.dart';
import 'package:nusuk/auth_view/sign_up.dart';
import 'package:nusuk/config/color_scheme_exrension.dart';
import 'package:nusuk/config/enums.dart';
import 'package:nusuk/shared_widgets/custom_button.dart';
import 'package:nusuk/utlis/context_extensions.dart';

import '../shared_widgets/app_text_view.dart';
import '../shared_widgets/custom_text_input.dart';
import '../shared_widgets/logo_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  bool passVisible = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const LogoWidget(),
                  SizedBox(height: .03.sh),
                  AppTextView(text: 'Welcome Back',size: 20.sp),
                  SizedBox(height: .01.sh),

                  AppTextView(text: 'login to your account',size: 10.sp),
                  SizedBox(height: .03.sh),
                  CustomTextInput(
                    cornerRadius:5,

                    textEditController: _nameController,
                    inputType: InputType.Email,
                    showPrefix: false,
                    prefixIcon: Icon(
                      Icons.mail_outline,
                      size: 20,
                      color: context.theme.colorScheme.acceptButton,
                    ),
                    showSuffix: false,
                    paddingH: context.width * .01,
                    topLabel: 'Email',
                    bgWhite: true,
                    showRequired: false,

                    // hintTextString: 'username'

                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: context.propHeight(20),
                  ),
                  CustomTextInput(
                    cornerRadius:5,

                    textEditController: _passwordController,
                    inputType: InputType.Password,
                    showPrefix: false,

                    prefixIcon: Icon(
                      Icons.lock,
                      size: 20,
                      color: context.theme.colorScheme.acceptButton,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(passVisible ? Icons.visibility_off : Icons.visibility,color: context.theme.colorScheme.kPrimaryColor,),
                      onPressed: () {
                        setState(() => passVisible = !passVisible);
                      },
                    ),
                    isVisible: passVisible,
                    paddingH: context.width * .01,
                    topLabel: 'Password',
                    bgWhite: true,
                    showRequired: false,
                    // hintTextString: 'password',
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  InkWell(
                      // onTap: () => Modular.to.pushNamed(AppRoutes.userForgotPassword),
                      child: Container(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () {
                            // Modular.to.pushNamed(AppRoutes.userForgotPassword);
                            context.navigator(const SendEmail(title: 'Forget your password',type: SendEmailTypes.forgetPassword,description: 'Enter your email to reset your password',));
                          },
                          child: Text(
                            'Forget Password?',

                            style: context.textTheme.headline2!.copyWith(
                              color: context.theme.primaryColor,
                              fontSize: 10.sp,
                              decoration: TextDecoration.underline

                            ),
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: WCustomButton(

                      radius: 6,
                      height: .06.sh,
                      width: .8.sw,
                      color: context.theme.primaryColor,
                      onPressed: doLogin,
                      text: 'Login',
                    ),
                  ),
                   SizedBox(
                    height: .1.sh,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Dont\'t have account?',
                      style: context.textTheme.headline5!.copyWith(
                        color: context.theme.primaryColor,
                        fontSize: 10.sp,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Create account',
                          style: context.textTheme.headline4!.copyWith(
                            color: context.theme.primaryColor,
                            fontSize: 10.sp,
                              decoration: TextDecoration.underline
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap=(){
                            context.navigator(const SignUp());
                            }
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
        ),
      ),
    ));
  }


  Future<void> doLogin() async {
    _formKey.currentState!.validate() ?context.navigator(const CheckEmail()):null;

  }
}
