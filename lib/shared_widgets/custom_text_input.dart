import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:hijri_picker/hijri_picker.dart';
import 'package:nusuk/config/color_scheme_exrension.dart';
import 'package:nusuk/utlis/context_extensions.dart';
import 'package:queen_validators/queen_validators.dart';

import '../utlis/utlis.dart';
import 'custom_validations.dart';

typedef OnChangedCallback = void Function(String? value);

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    Key? key,
    required this.textEditController,
    required this.inputType,
    this.enableBorder = true,
    this.themeColor,
    this.cornerRadius,
    this.maxLength,
    this.prefixIcon,
    this.suffixIcon,
    this.textColor,
    this.errorMessage,
    this.labelText,
    this.min,
    this.max,
    this.textDirection = TextDirection.ltr,
    this.isVisible = false,
    this.mustIncludeNumbersAndLetters = false,
    this.showPrefix = true,
    this.showSuffix = true,
    this.showRequired = true,
    this.disableArabic = true,
    this.onChanged,
    this.paddingH = 24.0,
    this.paddingV = 8.0,
    this.topLabel = '',
    this.bottomHint = '',
    this.match = '',
    this.forbidden = '',
    this.validationMessage,
    this.bgWhite = false,
    this.disableSpecialChars = false,
    this.disableNumbers = false,
    this.choices = const <String>[],
    this.hintTextString,
    this.borderColor = Colors.grey,
    this.maxLines = 1,
    this.onEditingComplete,
    this.textInputAction,
  }) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final TextDirection textDirection;
  final TextEditingController textEditController;
  final InputType? inputType;
  final bool? enableBorder;
  final bool disableArabic;
  final Color? themeColor;
  final Color borderColor;
  final double? cornerRadius;
  final double paddingH;
  final double paddingV;
  final int? maxLength;
  final int? min;
  final int? max;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? textColor;
  final String? errorMessage;
  final String? labelText;
  final String match;
  final String forbidden;
  final String? validationMessage;
  final bool mustIncludeNumbersAndLetters;
  final bool showPrefix;
  final bool disableSpecialChars;
  final bool disableNumbers;
  final bool showSuffix;
  final bool showRequired;
  final String? hintTextString;
  final bool isVisible;
  final String topLabel;
  final String bottomHint;
  final bool bgWhite;
  final List<String> choices;
  final OnChangedCallback? onChanged;
  final VoidCallback? onEditingComplete;
  final int maxLines;
  final TextInputAction? textInputAction;

  // build method for UI rendering
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        end: paddingH,
        top: paddingV,
        bottom: paddingV,
      ),
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              if (topLabel.isNotEmpty)  Padding(
                padding: const EdgeInsets.all(4.0),
                child: RichText(
                  text: TextSpan(
                    text: topLabel??'',
                    style: context.textTheme.headline5!.copyWith(
                      color: bgWhite
                          ? context.theme.colorScheme.kTextColor
                          : context.theme.colorScheme.light,
                      fontSize: 12.sp,
                    ),
                    children: <TextSpan>[
                      if(showRequired)...[TextSpan(
                          text: ' *',
                          style: context.textTheme.headline5!.copyWith(
                              color: context.theme.colorScheme.error,
                            fontSize: 12.sp,
                          ),

                      ),]
                    ],
                  ),
                ),
              ),
              TextFormField(
                textDirection: textDirection,
                readOnly: <InputType>[InputType.Choices, InputType.Date]
                    .contains(inputType),
                onTap: inputType == InputType.Choices
                    ? () => _showChoices(context)
                    : inputType == InputType.Date
                        ? () => _selectDate(context)
                        : null,
                controller: textEditController,
                validator: qValidator(
                  getValidations,
                ),
                textInputAction: textInputAction,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: hintTextString,
                  counterText: '',
                  border: getBorder(),
                  enabledBorder: enableBorder! ? getBorder() : InputBorder.none,
                  focusedBorder: enableBorder! ? getBorder() : InputBorder.none,
                  labelText: labelText ?? hintTextString,
                  labelStyle: TextStyle(
                    color: themeColor ?? context.theme.primaryColor,
                    fontSize: 20,
                  ),
                  prefixIcon:
                      showPrefix ? prefixIcon ?? getPrefixIcon(context) : null,
                  suffixIcon:
                      showSuffix ? suffixIcon ?? getSuffixIcon(context) : null,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
                onChanged: onChanged,
                keyboardType: getInputType(),
                obscureText: inputType == InputType.Password && !isVisible,
                maxLength: maxLength,
                style: TextStyle(
                  color: textColor ?? Colors.black38,
                ),
                inputFormatters: getInputFormatters,
                maxLines: maxLines,
                onEditingComplete: onEditingComplete,
              ),
              if (bottomHint.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    bottomHint,
                    style: context.textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.normal,
                        color: borderColor,
                        fontSize: 10.sp
                    ),
                  ),
                ),
            ],
          ),

        ],
      ),
    );
  }

  List<TextInputFormatter> get getInputFormatters {
    final List<TextInputFormatter> inputFormatters = <TextInputFormatter>[];

    if (inputType == InputType.Phone) {
      inputFormatters.add(
        FilteringTextInputFormatter.digitsOnly,
      );
    }
    if (inputType == InputType.Number) {
      inputFormatters.add(
        FilteringTextInputFormatter.digitsOnly,
      );
    }
    if (disableSpecialChars) {
      inputFormatters.add(
        FilteringTextInputFormatter.deny(
          RegExp(r'[!@#$%^&*()~`{}|\\:;<>?/+-]'),
        ),
      );
    }
    if (disableNumbers) {
      inputFormatters.add(
        FilteringTextInputFormatter.deny(
          RegExp(r'[٠-٩0-9]'),
        ),
      );
    }
    if (max != null) {
      inputFormatters.add(
        LengthLimitingTextInputFormatter(max),
      );
    }

    if (!disableArabic) {
      inputFormatters.add(
        FilteringTextInputFormatter.allow(
          RegExp(r'[a-zA-Z\u0600-\u06FF]'),
        ),
      );
    }

    return inputFormatters;
  }

  List<TextValidationRule> get getValidations {
    final List<TextValidationRule> validations = <TextValidationRule>[
      if (inputType != InputType.Optional) IsRequired('requiredField'),
    ];
    if (inputType == InputType.Email) {
      validations.add(IsEmail('emailValidation'));
    } else if (inputType == InputType.Password) {
      validations.add(IsPassword('passwordValidation'));
    } else if (inputType == InputType.Password2) {
      validations.add(IsPassword2('passwordValidation'));
    } else if (inputType == InputType.Phone) {
      validations.add(IsPhone('phoneValidation'));
    } else if (inputType == InputType.Number) {
      validations.add(IsNumberClass('numberValidation'));
    } else if (inputType == InputType.Date) {
    } else if (inputType == InputType.Choices) {
    } else if (inputType == InputType.PaymentCard) {
      validations.add(MinLength(19, validationMessage));
      validations.add(MaxLength(19, validationMessage));
    } else {}

    if (min != null) {
      validations.add(MinLength(min!, validationMessage));
    }
    if (max != null) {
      validations.add(MaxLength(max!, validationMessage));
    }
    if (forbidden.isNotEmpty) {
      validations.add(
          IsForbidden(forbidden, validationMessage ?? 'alreadyExists'));
    }
    if (match.isNotEmpty) {
      validations.add(IsMatch(match, validationMessage ?? 'notMatch'));
    }

    if (disableSpecialChars) {
      validations.add(IsNotSpecialChars('noSpecialChars'));
    }

    if (mustIncludeNumbersAndLetters) {
      validations.add(const IsNumbersAndLetters('يجب إدخال حروف وأرقام'));
    }

    return validations;
  }

  //get border of textinput filed
  OutlineInputBorder getBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(cornerRadius ?? 12.0)),
      borderSide: BorderSide(color: borderColor),
      gapPadding: 2,
    );
  }

  // return input type for setting keyboard
  TextInputType getInputType() {
    if (inputType == InputType.Email) {
      return TextInputType.emailAddress;
    } else if (inputType == InputType.Number) {
      return TextInputType.number;
    } else if (inputType == InputType.Phone) {
      return TextInputType.phone;
    } else if (inputType == InputType.Password) {
      return TextInputType.text;
    } else if (inputType == InputType.PaymentCard) {
      return TextInputType.number;
    } else {
      return TextInputType.text;
    }
  }

  Widget getPrefixIcon(BuildContext context) {
    late IconData icon;

    if (inputType == InputType.Password && !isVisible) {
      icon = Icons.visibility;
    } else if (inputType == InputType.Password && isVisible) {
      icon = Icons.visibility_off;
    } else if (inputType == InputType.PaymentCard) {
      icon = Icons.credit_card;
    } else if (inputType == InputType.Phone) {
      icon = Icons.phone;
    } else if (inputType == InputType.Email) {
      icon = Icons.email;
    } else if (inputType == InputType.Default) {
      icon = Icons.person;
    } else {
      icon = Icons.person;
    }

    return Icon(
      icon,
      color: themeColor ?? context.theme.primaryColor,
    );
  }

  // get suffix icon
  Widget getSuffixIcon(BuildContext context) {
    late IconData icon;

    if (inputType == InputType.Password) {
      icon = Icons.lock;
    } else if (inputType == InputType.Phone) {
      icon = Icons.phone;
    } else if (inputType == InputType.PaymentCard) {
      icon = Icons.credit_card;
    } else if (inputType == InputType.Email) {
      icon = Icons.email;
    } else if (inputType == InputType.Default) {
      icon = Icons.person;
    } else if (inputType == InputType.Choices) {
      icon = Icons.delete;

      return IconButton(
        icon: Icon(
          icon,
          color: themeColor ?? context.theme.errorColor,
        ),
        onPressed: () {
          textEditController.clear();
        },
      );
    } else {
      icon = Icons.person;
    }

    return Icon(
      icon,
      color: themeColor ?? context.theme.primaryColor,
    );
  }

  void _showChoices(BuildContext ctx) {
    showCupertinoModalPopup(
      context: ctx,
      builder: (_) => SizedBox(
        width: ctx.width * 0.8,
        height: ctx.height * 0.25,
        child: CupertinoPicker(
          backgroundColor: Colors.white,
          itemExtent: 40,
          scrollController: FixedExtentScrollController(initialItem: 1),
          children: choices.map((String i) {
            return Center(child: Text(i));
          }).toList(),
          onSelectedItemChanged: (int index) {
            textEditController.text = choices[index];
            if (onChanged != null) {
              onChanged!(choices[index]);
            }
          },
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final HijriCalendar nowHijri = HijriCalendar.now();




    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(1770, 3, 5),
        maxTime: DateTime.now(), onChanged: (date) {
        }, onConfirm: (date) {
          textEditController.text = '${date.day}/${date.month}/${date.year}';
        }, currentTime: DateTime.now(), locale: LocaleType.en);
    // final HijriCalendar? picked = await showHijriDatePicker(
    //   context: context,
    //   initialDate: nowHijri,
    //   lastDate: HijriCalendar.now(),
    //   firstDate: HijriCalendar()
    //     ..hYear = nowHijri.hYear - 20
    //     ..hMonth = nowHijri.hMonth
    //     ..hDay = nowHijri.hDay,
    // );
    //
    // if (picked != null) {
    //   textEditController.text = AppUtils().replaceArFaNumbersToEn(
    //     picked.toFormat('dd/mm/yyyy'),
    //   );
    // }
  }
}

// _isValidate = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(textFieldValue);
// validationMessage = widget.errorMessage ?? 'Password is not valid';
//input types
enum InputType {
  Optional,
  Default,
  Email,
  Number,
  Password,
  Password2,
  PaymentCard,
  Choices,
  Phone,
  Date,
}
