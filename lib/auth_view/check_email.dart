




import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nusuk/auth_view/verfiy_code.dart';
import 'package:nusuk/config/constants.dart';
import 'package:nusuk/utlis/context_extensions.dart';

import '../shared_widgets/app_text_view.dart';
import '../shared_widgets/custom_button.dart';

class CheckEmail extends StatefulWidget {
  const CheckEmail({Key? key}) : super(key: key);

  @override
  State<CheckEmail> createState() => _CheckEmailState();
}

class _CheckEmailState extends State<CheckEmail> {
  Timer? _timer ;
  int _start = 300;

  void startTimer() {
    const oneSec =  Duration(seconds: 1);
    _timer =  Timer.periodic(
      oneSec,
          (Timer timer) => setState(
            () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },

      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(appBar: AppBar(
      elevation: 0,

    ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    height: .1.sh,
                    child: Image.asset(ImageConstants.email),
                  ),
                ),
                SizedBox(height: .03.sh),
                AppTextView(text: 'Check your email',size: 20.sp),
                SizedBox(height: .01.sh),

                AppTextView(text: 'Open the verification link to sent email',size: 10.sp),
                SizedBox(height: .1.sh),

                Center(
                  child: WCustomButton(

                    radius: 8,
                    width: .8.sw,
                    height: .06.sh,
                    color: context.theme.primaryColor,
                    onPressed: goMail,
                    text: 'Go To Mail',
                  ),
                ),
                SizedBox(height: .01.sh),
                SizedBox(
                  width: .7.sw,
                  child: AppTextView(

                      text: 'If you can not find the email try checking your junk folder',size: 10.sp),
                ),  SizedBox(height: .1.sh),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppTextView(

                          text: 'Resend Email',size: 10.sp,color: Colors.grey),
                      AppTextView(

                          text: ' (${_start ~/ 60}:${_start % 60})',size: 10.sp,color: Colors.grey),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    ));
  }

  Future<void> goMail()async{
    context.navigator(VerfiyCode());
  }
}
