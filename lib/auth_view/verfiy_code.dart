import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nusuk/config/constants.dart';
import 'package:nusuk/utlis/context_extensions.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../shared_widgets/app_text_view.dart';
import '../shared_widgets/custom_button.dart';

class VerfiyCode extends StatefulWidget {
  const VerfiyCode({Key? key}) : super(key: key);

  @override
  State<VerfiyCode> createState() => _VerfiyCodeState();
}

class _VerfiyCodeState extends State<VerfiyCode> {
  Timer? _timer;
  int _start = 300;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
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
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    errorController = StreamController<ErrorAnimationType>();

    startTimer();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
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
                  AppTextView(text: 'Check your email', size: 20.sp),
                  SizedBox(height: .01.sh),
                  SizedBox(
                    width: .5.sw,
                    child: AppTextView(
                        text: 'Open the verification link sent to your email or enter the verifcation code',
                        size: 10.sp),
                  ),
                  SizedBox(height: .1.sh),
                  SizedBox(
                    width: .5.sw,
                    child: PinCodeTextField(
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 4,

                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v!.length < 3) {
                          return "";
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                        activeColor: Colors.white,
                        selectedColor: context.theme.primaryColor,
                        disabledColor: Colors.white,
                        inactiveColor: Colors.white,
                        selectedFillColor: Colors.white,
                        inactiveFillColor: Colors.white,

                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeFillColor: Colors.white,
                      ),
                      cursorColor: Colors.black,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      errorAnimationController: errorController,
                      controller: textEditingController,
                      keyboardType: TextInputType.number,
                      boxShadows: const [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                      onCompleted: (v) {
                        debugPrint("Completed");
                      },
                      // onTap: () {
                      //   print("Pressed");
                      // },
                      onChanged: (value) {
                        debugPrint(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        debugPrint("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    ),
                  ),
                  SizedBox(height: .05.sh),

                  Center(
                    child: WCustomButton(
                      radius: 8,
                      width: .8.sw,
                      height: .06.sh,
                      color: context.theme.primaryColor,
                      onPressed: goMail,
                      text: 'Continue',
                    ),
                  ),
                  SizedBox(height: .01.sh),
                  SizedBox(
                    width: .7.sw,
                    child: AppTextView(
                        text:
                            'If you can not find the email try checking your junk folder',
                        size: 10.sp),
                  ),
                  SizedBox(height: .1.sh),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppTextView(
                            text: 'Resend Email',
                            size: 10.sp,
                            color: Colors.grey),
                        AppTextView(
                            text: ' (${_start ~/ 60}:${_start % 60})',
                            size: 10.sp,
                            color: Colors.grey),
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

  Future<void> goMail() async {}
}
