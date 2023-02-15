







import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nusuk/utlis/context_extensions.dart';

import '../config/string_constants.dart';
import '../shared_widgets/app_text_view.dart';

class UsingPolicy extends StatelessWidget {
  const UsingPolicy({Key? key}) : super(key: key);

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
                  AppTextView(text: 'Using Policy', size: 20.sp,color: Colors.white,),
                  const Spacer(),

                ],
              ),
              const Spacer(),
            ],
          ),
        ),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: AppTextView(fontWeight: FontWeight.w600,text: StringConstants.usingPolicyTitle, size: 18.sp,color: context.theme.primaryColor,)),
              SizedBox(height: .05.sh,),
              AppTextView(textAlign: TextAlign.start,text: 'Introduction', size: 20.sp,),
              SizedBox(height: .03.sh,),

              AppTextView(textAlign: TextAlign.start,text: StringConstants.usingPolicyIntro, size: 14.sp,),
              SizedBox(height: .05.sh,),
              AppTextView(textAlign: TextAlign.start,text: 'Definitions', size: 20.sp,),
              SizedBox(height: .02.sh,),
              AppTextView(textAlign: TextAlign.start,text: StringConstants.usingPolicyDefinition, size: 14.sp,),

            ],
          ),
        ),
      ),
    ));
  }
}
