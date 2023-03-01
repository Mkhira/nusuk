







import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nusuk/screens/add_compinanion.dart';
import 'package:nusuk/screens/view_companions.dart';
import 'package:nusuk/shared_widgets/app_text_view.dart';
import 'package:nusuk/shared_widgets/custom_button.dart';
import 'package:nusuk/utlis/context_extensions.dart';

class MangeCompanions extends StatelessWidget {
  const MangeCompanions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.primaryColor,
        elevation: 0,
        leading: const SizedBox(),
        iconTheme: const IconThemeData(color: Colors.white),
        bottom: PreferredSize(preferredSize: Size.fromHeight(.06.sh), child: SizedBox(
          height: .07.sh,
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
                  AppTextView(text: 'Mange Companions', size: 20.sp,color: Colors.white,),
                  const Spacer(),
                  IconButton(onPressed: (){
                    context.navigator(AddCompanion());
                  }, icon: Icon(Icons.add,color: Colors.white,))

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
            Column(
              children: List.generate(2, (index) => InkWell(
                onTap: (){
                  context.navigator(ViewCompanions());
                },
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(20),
                          height: .1.sh,
                          width: .2.sw,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue,

                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextView(text: 'Mohamed khaled', size: 20.sp),
                            AppTextView(text: 'Son', size: 15.sp,color: Colors.black45,),
                          ],
                        )
                      ],
                    ),
                    Divider()
                  ],
                ),
              )),
            ),
            SizedBox(
              height: .1.sh,
            ),
            WCustomButton(color: context.theme.primaryColor,text: 'Add New Companions',onPressed: add,radius: 0,width: .7.sw,)
          ],
        ),
      ),));
  }

  Future<void> add() async {
    // context.navigator(CheckEmail());
  }
}
