









import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nusuk/auth_view/check_email.dart';
import 'package:nusuk/auth_view/forgetPassword.dart';
import 'package:nusuk/config/color_scheme_exrension.dart';
import 'package:nusuk/shared_widgets/custom_button.dart';
import 'package:nusuk/utlis/context_extensions.dart';

import '../shared_widgets/app_text_view.dart';
import '../shared_widgets/custom_text_input.dart';
import '../shared_widgets/logo_widget.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _confirmPassword = TextEditingController();

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
                  LogoWidget(),
                  SizedBox(height: .03.sh),
                  AppTextView(text: 'Reset Password',size: 20.sp),
                  SizedBox(height: .01.sh),

                  SizedBox(
                      width: .6.sw,
                      child: AppTextView(text: 'The new password must be different from the current passwrd',size: 10.sp)),
                  SizedBox(height: .03.sh),
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
                    labelText: 'Password',
                    // hintTextString: 'password',
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(
                    height: context.propHeight(20),
                  ),
                  CustomTextInput(
                    cornerRadius:5,

                    textEditController: _confirmPassword,
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
                    labelText: 'Confirm Password',
                    // hintTextString: 'password',
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
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
                      text: 'Confirm',
                    ),
                  ),
                  SizedBox(
                    height: .1.sh,
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
    // context.navigator(CheckEmail());
  }
}
