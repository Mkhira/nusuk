














import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nusuk/auth_view/login.dart';
import 'package:nusuk/auth_view/send_email.dart';
import 'package:nusuk/config/color_scheme_exrension.dart';
import 'package:nusuk/shared_widgets/app_text_view.dart';
import 'package:nusuk/utlis/context_extensions.dart';

import '../config/enums.dart';
import '../shared_widgets/custom_button.dart';
import '../shared_widgets/custom_text_input.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({Key? key}) : super(key: key);

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _passportNumberController = TextEditingController();
  final TextEditingController _dateIisuanceController = TextEditingController();
  final TextEditingController _dateExpireController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _issusePlaceController = TextEditingController();
  final TextEditingController _birthPlaceController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _personalPhoto = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _thirdNameArabicController = TextEditingController();
  final TextEditingController _lastNameArabicController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool passVisible = false;
  bool passConfirmVisible = false;
  bool subscribe = false;
  bool terms = false;
  bool knowledge = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.primaryColor,
        elevation: 0,
        leading: const SizedBox(),
        iconTheme: const IconThemeData(color: Colors.white),
        bottom: PreferredSize(preferredSize: Size.fromHeight(.06.sh), child: SizedBox(
          height: .08.sh,
          child: Column(
            children: [
              Row(
                children:  [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: IconButton(icon: const Icon(Icons.arrow_back_ios_outlined,color: Colors.white,)
                      ,onPressed: (){
                        Navigator.pop(context);
                      },),
                  ),
                  const Spacer(),
                  AppTextView(text: 'Complete Profile', size: 20.sp,color: Colors.white,),
                  const Spacer(),

                ],
              ),
              const Spacer(),
            ],
          ),
        ),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AppTextView(text: 'Pilgrim\'s information',size: 20.sp),
                    SizedBox(height: .01.sh),

                    AppTextView(text: 'Passport type',size: 20.sp),
                    SizedBox(height: .03.sh),
                    CustomTextInput(
                      cornerRadius:5,

                      textEditController: _passportNumberController,
                      inputType: InputType.Number,
                      showPrefix: false,

                      showSuffix: false,
                      paddingH: context.width * .01,
                      topLabel: 'Passport Number',
                      bgWhite: true,
                      showRequired: true,

                      // hintTextString: 'username'

                      textInputAction: TextInputAction.next,
                    ),
                    CustomTextInput(
                      cornerRadius:5,

                      textEditController: _dateIisuanceController,
                      inputType: InputType.Date,
                      showPrefix: false,

                      showSuffix: true,
                      paddingH: context.width * .01,
                      topLabel: 'Date of issuance',
                      bgWhite: true,
                      showRequired: true,
                      suffixIcon: Icon(Icons.calendar_month,color: context.theme.primaryColor),
                      // hintTextString: 'username'

                      textInputAction: TextInputAction.next,
                    ),
                    CustomTextInput(
                      cornerRadius:5,

                      textEditController: _dateExpireController,
                      inputType: InputType.Date,
                      showPrefix: false,

                      showSuffix: true,
                      paddingH: context.width * .01,
                      topLabel: 'Date of Expire',
                      bgWhite: true,
                      showRequired: true,
                      suffixIcon: Icon(Icons.calendar_month,color: context.theme.primaryColor),
                      // hintTextString: 'username'

                      textInputAction: TextInputAction.next,
                    ),

                    CustomTextInput(
                      cornerRadius:5,

                      textEditController: _issusePlaceController,
                      inputType: InputType.Default,
                      showPrefix: false,

                      showSuffix: false,
                      paddingH: context.width * .01,
                      topLabel: 'Issue place',
                      bgWhite: true,
                      showRequired: true,

                      // hintTextString: 'username'

                      textInputAction: TextInputAction.next,
                    ),
                    CustomTextInput(
                      cornerRadius:5,

                      textEditController: _birthPlaceController,
                      inputType: InputType.Default,
                      showPrefix: false,

                      showSuffix: false,
                      paddingH: context.width * .01,
                      topLabel: 'Birth Place',
                      bgWhite: true,
                      showRequired: true,
                      // hintTextString: 'username'

                      textInputAction: TextInputAction.next,
                    ),

                    AppTextView(text: 'Attachments',size: 20.sp),

                    CustomTextInput(
                      cornerRadius:5,

                      textEditController: _lastNameController,
                      inputType: InputType.upload,
                      showPrefix: false,

                      showSuffix: true,

                      suffixIcon: Icon(Icons.file_upload_outlined,color: context.theme.primaryColor,),
                      paddingH: context.width * .01,
                      topLabel: 'Passport',
                      bgWhite: true,
                      showRequired: true,

                      // hintTextString: 'username'

                      textInputAction: TextInputAction.next,
                    ),
                    CustomTextInput(
                      cornerRadius:5,

                      textEditController: _personalPhoto,
                      inputType: InputType.upload,
                      showPrefix: false,

                      showSuffix: true,

                      suffixIcon: Icon(Icons.file_upload_outlined,color: context.theme.primaryColor,),
                      paddingH: context.width * .01,
                      topLabel: 'Personal Photo',
                      bgWhite: true,
                      showRequired: true,

                      // hintTextString: 'username'

                      textInputAction: TextInputAction.next,
                    ),
                    CustomTextInput(
                      cornerRadius:5,

                      textEditController: _idController,
                      inputType: InputType.upload,
                      showPrefix: false,

                      showSuffix: true,

                      suffixIcon: Icon(Icons.file_upload_outlined,color: context.theme.primaryColor,),
                      paddingH: context.width * .01,
                      topLabel: 'ID',
                      bgWhite: true,
                      showRequired: true,

                      // hintTextString: 'username'

                      textInputAction: TextInputAction.next,
                    ),



                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: WCustomButton(

                        radius: 6,
                        height: .06.sh,
                        width: .8.sw,
                        color: context.theme.primaryColor,
                        onPressed: signUp,
                        text: 'Save',
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'already have account?',
                          style: context.textTheme.headline5!.copyWith(
                            color: context.theme.primaryColor,
                            fontSize: 10.sp,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Login',
                                style: context.textTheme.headline4!.copyWith(
                                    color: context.theme.primaryColor,
                                    fontSize: 10.sp,
                                    decoration: TextDecoration.underline
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap=(){
                                    context.navigator(LoginPage());
                                  }
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
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

  Future<void> signUp()async{
    _formKey.currentState?.validate();
    // context.navigator(const SendEmail(title: 'Email verification',type: SendEmailTypes.forgetPassword,description: 'Please enter  your email address for verify',));

  }
}
