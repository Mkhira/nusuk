











import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nusuk/auth_view/login.dart';
import 'package:nusuk/config/enums.dart';
import 'package:nusuk/shared_widgets/app_text_view.dart';
import 'package:nusuk/shared_widgets/custom_button.dart';
import 'package:nusuk/shared_widgets/custom_text_input.dart';
import 'package:nusuk/utlis/context_extensions.dart';

class AddCompanion extends StatefulWidget {
  const AddCompanion({Key? key}) : super(key: key);

  @override
  State<AddCompanion> createState() => _AddCompanionState();
}

class _AddCompanionState extends State<AddCompanion> {
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

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _secondNameController = TextEditingController();
  final TextEditingController _thirdNameController = TextEditingController();
  final TextEditingController _nameArabicController = TextEditingController();
  final TextEditingController _secondNameArabicController =
  TextEditingController();


  bool passVisible = false;
  bool passConfirmVisible = false;
  bool subscribe = false;
  bool terms = false;
  bool knowledge = false;

  String dropdownvalue = 'Item 1';

  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

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
                  AppTextView(text: 'Add Companion', size: 20.sp,color: Colors.white,),
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
                    AppTextView(text: 'Country', size: 15.sp,color: Colors.black45,),

                    Container(

                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButton(
                        isExpanded: true,
                        // Initial Value
                        value: dropdownvalue,
                        underline: SizedBox(),

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ),

                    SizedBox(height: .02.sh),

                    AppTextView(text: 'Nationality', size: 15.sp,color: Colors.black45,),
                    Container(

                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButton(
                        isExpanded: true,
                        // Initial Value
                        value: dropdownvalue,
                        underline: SizedBox(),

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: .02.sh),

                    CustomTextInput(
                      cornerRadius: 5,

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
                      cornerRadius: 5,

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
                      cornerRadius: 5,

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
                      cornerRadius: 5,

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
                      cornerRadius: 5,

                      textEditController: _nameArabicController,
                      inputType: InputType.arabic,
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
                      cornerRadius: 5,

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
                      cornerRadius: 5,

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
                      cornerRadius: 5,

                      textEditController: _lastNameArabicController,
                      inputType: InputType.arabic,
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

                    CustomTextInput(
                      cornerRadius: 5,

                      textEditController: _dateController,
                      inputType: InputType.Date,
                      showPrefix: false,

                      showSuffix: true,
                      paddingH: context.width * .01,
                      topLabel: 'Date of Birth',
                      bgWhite: true,
                      showRequired: true,
                      suffixIcon: Icon(Icons.calendar_month,
                          color: context.theme.primaryColor),
                      // hintTextString: 'username'

                      textInputAction: TextInputAction.next,
                    ),
                    CustomTextInput(
                      cornerRadius: 5,

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
                      cornerRadius: 5,

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

                    AppTextView(text: 'Relevant Relation', size: 15.sp,color: Colors.black45,),
                    Container(

                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButton(
                        isExpanded: true,
                        // Initial Value
                        value: dropdownvalue,
                        underline: SizedBox(),

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: .02.sh),

                    AppTextView(text: 'Passport type', size: 15.sp,color: Colors.black45,),
                    Container(

                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButton(
                        isExpanded: true,
                        // Initial Value
                        value: dropdownvalue,
                        underline: SizedBox(),

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ),
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
                    // Center(
                    //   child: RichText(
                    //     text: TextSpan(
                    //       text: 'already have account?',
                    //       style: context.textTheme.headline5!.copyWith(
                    //         color: context.theme.primaryColor,
                    //         fontSize: 10.sp,
                    //       ),
                    //       children: <TextSpan>[
                    //         TextSpan(
                    //             text: ' Login',
                    //             style: context.textTheme.headline4!.copyWith(
                    //                 color: context.theme.primaryColor,
                    //                 fontSize: 10.sp,
                    //                 decoration: TextDecoration.underline
                    //             ),
                    //             recognizer: TapGestureRecognizer()
                    //               ..onTap=(){
                    //                 context.navigator(LoginPage());
                    //               }
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
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
