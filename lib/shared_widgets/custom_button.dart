import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nusuk/config/color_scheme_exrension.dart';
import 'package:nusuk/utlis/context_extensions.dart';
import 'package:progress_state_button/progress_button.dart';


typedef FutureVoidCallback = Future<void> Function();

class WCustomButton extends StatefulWidget {
  const WCustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.color,
    this.icon,
    this.width = 200,
    this.height ,
    this.radius = 20,
    this.disabled = false,
  }) : super(key: key);

  final IconData? icon;
  final String text;
  final FutureVoidCallback onPressed;
  final Color color;
  final double width;
  final double? height;
  final bool disabled;
  final double radius;

  @override
  State<WCustomButton> createState() => _WCustomButtonState();
}

class _WCustomButtonState extends State<WCustomButton> {
  double _radius = 0.0;
  ButtonState state = ButtonState.idle;
  bool _disabled = false;

  @override
  void initState() {
    _radius = widget.radius;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: ProgressButton(
        minWidth: widget.height??.06.sh,
        maxWidth: widget.width,
        height: widget.height??.06.sh,
        progressIndicatorSize: widget.height??.06.sh * .5,
        radius: _radius,
        progressIndicatorAlignment: MainAxisAlignment.center,
        stateWidgets: <ButtonState, Widget>{
          ButtonState.idle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: <Widget>[
              if (widget.icon != null)
                Icon(
                  widget.icon,
                  color: context.theme.colorScheme.light,
                ),
              Text(
                widget.text,
                style: context.theme.textTheme.headline3!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: context.theme.colorScheme.light,
                  fontSize: 20
                ),
              ),
            ],
          ),
          ButtonState.loading: const SizedBox(),
          // ButtonState.loading: Text(
          //   'btnLoading',
          //   style: context.theme.textTheme.headline3!.copyWith(
          //     fontWeight: FontWeight.w400,
          //     color: context.theme.colorScheme.light,
          //   ),
          // ),
          ButtonState.fail: Text(
            'btnFail',
            style: context.theme.textTheme.headline3!.copyWith(
              fontWeight: FontWeight.w400,
              color: context.theme.colorScheme.light,
            ),
          ),
          ButtonState.success: Text(
            'btnSuccess',
            style: context.theme.textTheme.headline3!.copyWith(
              fontWeight: FontWeight.w400,
              color: context.theme.colorScheme.light,
            ),
          )
        },
        stateColors: <ButtonState, Color>{
          ButtonState.idle:
              widget.disabled ? context.theme.disabledColor : widget.color,
          ButtonState.loading: Colors.blue.shade300,
          ButtonState.fail: Colors.red.shade300,
          ButtonState.success: Colors.green.shade400,
        },
        onPressed: _disabled
            ? null
            : () async {
                if (widget.disabled) {
                  // return AppUtils().showAlert(
                  //   EAlertType.deadSession,
                  //   'لا يمكن إتمام العملية',
                  // );
                }

                setState(() {
                  _radius = widget.height??.06.sh * .5;
                  state = ButtonState.loading;
                  _disabled = true;
                });

                if (!widget.disabled) {
                  await widget.onPressed();
                }

                setState(() {
                  _radius = widget.radius;
                  state = ButtonState.idle;
                  _disabled = false;
                });
              },
        state: state,
      ),
    );
  }
}
