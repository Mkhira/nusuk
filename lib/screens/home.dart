import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nusuk/auth_view/complite_profile.dart';
import 'package:nusuk/config/constants.dart';
import 'package:nusuk/config/enums.dart';
import 'package:nusuk/screens/add_compinanion.dart';
import 'package:nusuk/screens/edit_profile.dart';
import 'package:nusuk/screens/mange_compainions.dart';
import 'package:nusuk/shared_widgets/app_text_view.dart';
import 'package:nusuk/utlis/context_extensions.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  height: .25.sh,
                  color: Colors.blue,
                )
              ],
            ),
          ),
          Container(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: .1.sh,
                  ),
                  Container(
                    height: .3.sh,
                    width: .8.sw,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: context.theme.primaryColor),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [Spacer(), IconButton(icon: Icon(Icons.edit,color: context.theme.primaryColor,), onPressed: () {
                            context.navigator(EditProfileScreen());

                          },)],
                        ),
                        Container(
                          height: .15.sh,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(
                                  color: context.theme.primaryColor)),
                        ),
                        AppTextView(
                          text: 'Mohamed khaled',
                          size: 20.sp,
                        ),
                        AppTextView(
                          text: 'mkhira@gmail.com',
                          size: 10.sp,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: .1.sh,
                  ),
                  SizedBox(
                    width: 1.sw,
                    child: Row(
                      children: [
                        SizedBox(
                          width: .08.sw,
                        ),
                        Expanded(
                            child: ProfileButton(
                          name: 'Mange companions',
                          image: ImageConstants.mange,
                          onPress: () {
                            context.navigator(MangeCompanions());
                          },
                        )),
                        SizedBox(
                          width: .08.sw,
                        ),
                        Expanded(
                            child: ProfileButton(
                          name: 'Mange Packages',
                          image: ImageConstants.magePacakges,
                          onPress: () {
                            context.navigator(MangeCompanions());
                          },
                        )),
                        SizedBox(
                          width: .08.sw,
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ],
      ),
    ));
  }
}

class ProfileButton extends StatelessWidget {
  const ProfileButton(
      {Key? key,
      required this.name,
      required this.image,
      required this.onPress})
      : super(key: key);
  final String image;
  final String name;
  final Function() onPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: .15.sh,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: .05.sh, child: Image.asset(image)),
            AppTextView(text: name, size: 15.sp)
          ],
        ),
      ),
    );
  }
}
