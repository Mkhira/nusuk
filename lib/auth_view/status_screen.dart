






import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nusuk/auth_view/reset_password.dart';
import 'package:nusuk/auth_view/sign_up.dart';
import 'package:nusuk/config/constants.dart';
import 'package:nusuk/shared_widgets/app_text_view.dart';
import 'package:nusuk/shared_widgets/custom_button.dart';
import 'package:nusuk/utlis/context_extensions.dart';
import 'package:nusuk/utlis/context_extensions.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({Key? key,required this.isSuccess}) : super(key: key);
 final bool isSuccess;

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  Future<void> doLogin() async {
    context.navigator(ResetPassword());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(8),
          height: 1.sh,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(  height: .1.sh,),
              Center(
                child: SizedBox(
                  height: .3.sh,
                  child: Image.asset(widget.isSuccess? ImageConstants.success:ImageConstants.error),
                ),
              ),
              SizedBox(height: .03.sh),

              AppTextView(text: 'login to your account',size: 10.sp,color: widget.isSuccess? Colors.black:Colors.red),
              SizedBox(height: .1.sh),

              Center(
                child: WCustomButton(

                  radius: 6,
                  height: .06.sh,
                  width: .8.sw,
                  color: context.theme.primaryColor,
                  onPressed: doLogin,
                  text: widget.isSuccess?'Continue':'Retry',
                ),
              ),
              SizedBox(  height: .1.sh,),

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
                          ..onTap=(){
                          context.navigator(SignUp());
                          }
                    ),
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

