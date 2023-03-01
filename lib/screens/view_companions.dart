





import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nusuk/shared_widgets/app_text_view.dart';
import 'package:nusuk/utlis/context_extensions.dart';
enum SampleItem { itemOne, itemTwo }

class ViewCompanions extends StatefulWidget {
  const ViewCompanions({Key? key}) : super(key: key);

  @override
  State<ViewCompanions> createState() => _ViewCompanionsState();
}

class _ViewCompanionsState extends State<ViewCompanions> {
  SampleItem? selectedMenu;

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
          PopupMenuButton<SampleItem>(
            initialValue: selectedMenu,
            // Callback that sets the selected popup menu item.
            onSelected: (SampleItem item) {
              setState(() {
                selectedMenu = item;
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
              const PopupMenuItem<SampleItem>(
                value: SampleItem.itemOne,
                child: Text('Edit'),
              ),
              const PopupMenuItem<SampleItem>(
                value: SampleItem.itemTwo,
                child: Text('Delete'),
              ),

            ],
          ),


                ],
              ),
              const Spacer(),
            ],
          ),
        ),),
      ),
     body: SingleChildScrollView(
       physics: const BouncingScrollPhysics(),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           SizedBox(
             height: .05.sh,
           ),
           Center(
             child: Container(
               height: .1.sh,
               width: .2.sw,
               decoration: BoxDecoration(
                 color: Colors.blue,
                 borderRadius: BorderRadius.circular(10)
               ),
             ),
           ),
            ViewCompanionsWidget(title: 'Name',data: 'Mohamed khaled'),
            ViewCompanionsWidget(title: 'Name (Arabic)',data: 'Mohamed khaled'),
            ViewCompanionsWidget(title: 'Relative relation',data: 'Mohamed khaled'),
            ViewCompanionsWidget(title: 'Country Of Residence',data: 'Mohamed khaled'),
            ViewCompanionsWidget(title: 'Nationality',data: 'Mohamed khaled'),
            ViewCompanionsWidget(title: 'Gander',data: 'Mohamed khaled'),
            ViewCompanionsWidget(title: 'Date Of Birth',data: 'Mohamed khaled'),
            ViewCompanionsWidget(title: 'Mobile',data: 'Mohamed khaled'),
            ViewCompanionsWidget(title: 'Email',data: 'Mohamed khaled'),
            ViewCompanionsWidget(title: 'Passport Type',data: 'Mohamed khaled'),
            ViewCompanionsWidget(title: 'Passport Number',data: 'Mohamed khaled'),
            ViewCompanionsWidget(title: 'Date Of Issuance',data: 'Mohamed khaled'),
            ViewCompanionsWidget(title: 'Expiry Date',data: 'Mohamed khaled'),
            ViewCompanionsWidget(title: 'Issue Place',data: 'Mohamed khaled'),
            ViewCompanionsWidget(title: 'Birth Place',data: 'Mohamed khaled'),
           ViewCompanionsWidget(title: 'Passport',isImage: true),
         ],
       ),
     ),

    ));
  }
}



class ViewCompanionsWidget extends StatelessWidget {
   ViewCompanionsWidget({Key? key, this.data,required this.title, this.isImage =false}) : super(key: key);
  final String title;
  final String? data;
  bool isImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextView(text: title, size: 15.sp,color: Colors.black38,),
          SizedBox(height: .01.sh,),
         isImage?
            Container(
              height: .2.sh,
              width: .7.sw,
              color: Colors.blue,
            ) : AppTextView(text: data??'', size: 20.sp,color: Colors.black87,),
          SizedBox(height: .01.sh,),
        ],
      ),
    );
  }
}

