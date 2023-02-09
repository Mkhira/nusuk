












import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nusuk/auth_view/check_email.dart';
import 'package:nusuk/auth_view/status_screen.dart';
import 'package:nusuk/config/color_scheme_exrension.dart';
import 'package:nusuk/shared_widgets/custom_button.dart';
import 'package:nusuk/utlis/context_extensions.dart';

import '../config/enums.dart';
import '../shared_widgets/app_text_view.dart';
import '../shared_widgets/custom_text_input.dart';
import '../shared_widgets/logo_widget.dart';

class SendEmail extends StatefulWidget {
  const SendEmail({Key? key,required this.type,required this.title,required this.description}) : super(key: key);
  final String title;
  final String description;
  final SendEmailTypes type;
  @override
  State<SendEmail> createState() => _SendEmailState();
}

class _SendEmailState extends State<SendEmail> {
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
                  LogoWidget(),
                  SizedBox(height: .03.sh),
                  AppTextView(text: '${widget.title} ',size: 20.sp),
                  SizedBox(height: .01.sh),

                  AppTextView(text: widget.description,size: 10.sp),
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
                    // hintTextString: 'username'
                    bgWhite: true,
                    showRequired: false,

                    textInputAction: TextInputAction.next,
                  ),


                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: WCustomButton(

                      radius: 8,
                      width: .8.sw,
                      color: context.theme.primaryColor,
                      onPressed: doLogin,
                      text: 'Continue',
                    ),
                  ),
                  SizedBox(
                    height: .3.sh,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Dont\'t have account?',
                      style: context.textTheme.headline4!.copyWith(
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
                              ..onTap=(){}
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
    context.navigator(StatusScreen(isSuccess: true,));
  }
}
