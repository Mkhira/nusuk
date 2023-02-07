






import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nusuk/auth_view/login.dart';
import 'package:nusuk/config/color_scheme_exrension.dart';
import 'package:nusuk/shared_widgets/app_text_view.dart';
import 'package:nusuk/utlis/context_extensions.dart';

import '../shared_widgets/custom_button.dart';
import '../shared_widgets/custom_text_input.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _secondNameController = TextEditingController();
  final TextEditingController _thirdNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _nameArabicController = TextEditingController();
  final TextEditingController _secondNameArabicController = TextEditingController();
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
                       Navigator.canPop(context);
                       },),
                   ),
                  const Spacer(),
                  AppTextView(text: 'Create Account', size: 20.sp,color: Colors.white,),
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
                    AppTextView(text: 'Country',size: 20.sp),
                    SizedBox(height: .01.sh),

                    AppTextView(text: 'Nationality',size: 20.sp),
                    SizedBox(height: .03.sh),
                    CustomTextInput(
                      cornerRadius:5,

                      textEditController: _nameController,
                      inputType: InputType.Default,
                      showPrefix: false,

                      showSuffix: false,
                      paddingH: context.width * .01,
                      topLabel: 'First name',
                      bgWhite: true,
                      showRequired: true,
                      bottomHint: 'Same as passport',

                      // hintTextString: 'username'

                      textInputAction: TextInputAction.next,
                    ),
                    CustomTextInput(
                      cornerRadius:5,

                      textEditController: _secondNameController,
                      inputType: InputType.Optional,
                      showPrefix: false,

                      showSuffix: false,
                      paddingH: context.width * .01,
                      topLabel: 'Second name',
                      bgWhite: true,
                      showRequired: false,

                      // hintTextString: 'username'

                      textInputAction: TextInputAction.next,
                    ),
                    CustomTextInput(
                      cornerRadius:5,

                      textEditController: _thirdNameController,
                      inputType: InputType.Optional,
                      showPrefix: false,

                      showSuffix: false,
                      paddingH: context.width * .01,
                      topLabel: 'Third name',
                      bgWhite: true,
                       showRequired: false,
                      // hintTextString: 'username'

                      textInputAction: TextInputAction.next,
                    ),
                    CustomTextInput(
                      cornerRadius:5,

                      textEditController: _lastNameController,
                      inputType: InputType.Default,
                      showPrefix: false,

                      showSuffix: false,
                      paddingH: context.width * .01,
                      topLabel: 'Last name',
                      bgWhite: true,
                      showRequired: true,
                      bottomHint: 'Same as passport',

                      // hintTextString: 'username'

                      textInputAction: TextInputAction.next,
                    ),
                    CustomTextInput(
                      cornerRadius:5,

                      textEditController: _nameArabicController,
                      inputType: InputType.Default,
                      showPrefix: false,

                      showSuffix: false,
                      paddingH: context.width * .01,
                      topLabel: 'First name (Arabic)',
                      bgWhite: true,
                      showRequired: true,
                      bottomHint: 'Same as passport',

                      // hintTextString: 'username'

                      textInputAction: TextInputAction.next,
                    ),
                    CustomTextInput(
                      cornerRadius:5,

                      textEditController: _secondNameArabicController,
                      inputType: InputType.Optional,
                      showPrefix: false,

                      showSuffix: false,
                      paddingH: context.width * .01,
                      topLabel: 'Second name (Arabic)',
                      bgWhite: true,
                      showRequired: false,

                      // hintTextString: 'username'

                      textInputAction: TextInputAction.next,
                    ),
                    CustomTextInput(
                      cornerRadius:5,

                      textEditController: _thirdNameArabicController,
                      inputType: InputType.Optional,
                      showPrefix: false,

                      showSuffix: false,
                      paddingH: context.width * .01,
                      topLabel: 'Third name (Arabic)',
                      bgWhite: true,
                      showRequired: false,

                      // hintTextString: 'username'

                      textInputAction: TextInputAction.next,
                    ),
                    CustomTextInput(
                      cornerRadius:5,

                      textEditController: _lastNameArabicController,
                      inputType: InputType.Default,
                      showPrefix: false,

                      showSuffix: false,
                      paddingH: context.width * .01,
                      topLabel: 'Last name (Arabic)',
                      bgWhite: true,
                      showRequired: true,
                      bottomHint: 'Same as passport',

                      // hintTextString: 'username'

                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(height: .01.sh),

                    AppTextView(text: 'Gander',size: 20.sp),
                    SizedBox(height: .01.sh),
                    CustomTextInput(
                      cornerRadius:5,

                      textEditController: _dateController,
                      inputType: InputType.Date,
                      showPrefix: false,

                      showSuffix: true,
                      paddingH: context.width * .01,
                      topLabel: 'Date of Birth',
                      bgWhite: true,
                      showRequired: true,
                      suffixIcon: Icon(Icons.calendar_month,color: context.theme.primaryColor),
                      // hintTextString: 'username'

                      textInputAction: TextInputAction.next,
                    ),
                    CustomTextInput(
                      cornerRadius:5,

                      textEditController: _mobileController,
                      inputType: InputType.Phone,
                      showPrefix: false,

                      showSuffix: false,
                      paddingH: context.width * .01,
                      topLabel: 'Mobile',
                      bgWhite: true,
                      showRequired: true,

                      // hintTextString: 'username'

                      textInputAction: TextInputAction.next,
                    ),
                    CustomTextInput(
                      cornerRadius:5,

                      textEditController: _emailController,
                      inputType: InputType.Email,
                      showPrefix: false,

                      showSuffix: false,
                      paddingH: context.width * .01,
                      topLabel: 'Email',
                      bgWhite: true,
                      showRequired: true,

                      // hintTextString: 'username'

                      textInputAction: TextInputAction.next,
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
                    CustomTextInput(
                      cornerRadius:5,

                      textEditController: _confirmPasswordController,
                      inputType: InputType.Password,
                      showPrefix: false,

                      prefixIcon: Icon(
                        Icons.lock,
                        size: 20,
                        color: context.theme.colorScheme.acceptButton,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(passConfirmVisible ? Icons.visibility_off : Icons.visibility,color: context.theme.colorScheme.kPrimaryColor,),
                        onPressed: () {
                          setState(() => passConfirmVisible = !passConfirmVisible);
                        },
                      ),
                      isVisible: passConfirmVisible,
                      paddingH: context.width * .01,
                      topLabel: 'Confirm Password',
                      bgWhite: true,
                      showRequired: false,
                      // hintTextString: 'password',
                      textInputAction: TextInputAction.done,
                    ),
                    SizedBox(
                      width: .6.sw,
                      child: CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                        activeColor: context.theme.primaryColor,
                        value: subscribe,

                        onChanged: (value) {
                          setState(() {
                            subscribe = value!;
                          });
                        },
                        title: Text('Subscribe to flow up the reservation availability', style: context.textTheme.headline5!.copyWith(
                          fontSize: 10.sp,
                        ),),
                      ),
                    ),
                    SizedBox(
                      width: .7.sw,
                      child: CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                        activeColor: context.theme.primaryColor,
                        value: terms,

                        onChanged: (value) {
                          setState(() {
                            terms = value!;
                          });
                        },
                        title:  RichText(
                          text: TextSpan(
                            text: 'I agree to the',
                            style: context.textTheme.headline5!.copyWith(
                              fontSize: 10.sp,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' Terms and condition',
                                  style: context.textTheme.headlineMedium!.copyWith(
                                      color: context.theme.primaryColor,
                                      fontSize: 10.sp,
                                      decoration: TextDecoration.underline
                                  ),

                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: .7.sw,
                      child: CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                        activeColor: context.theme.primaryColor,
                        value: knowledge,

                        onChanged: (value) {
                          setState(() {
                            knowledge = value!;
                          });
                        },
                        title: Text('I acknowledge that my registration on the platform dose not mean that i will be accepted int Hija, and i know that reservation will be opened later', style: context.textTheme.headline5!.copyWith(
                          fontSize: 10.sp,
                        ),),
                      ),
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
                        text: 'Sign UP',
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
  _formKey.currentState!.validate();
  }
}
