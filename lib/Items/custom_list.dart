import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Modals/biodata.dart';

class CustomList extends StatelessWidget {
  BioData? item;
  CustomList({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 20.w),
                child: CircleAvatar(
                  radius: 40.sp,
                  child: Image.network(item!.image!.main!, fit: BoxFit.fill),
                ),
              ),
              Text(
                  "${item!.fullName!.first} ${item!.fullName!.middle} ${item!.fullName!.last}",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
            ],
          ),
          SizedBox(height: 20.h),
          sameRow("Gender", "${item!.gender}"),
          sameRow("Species", "${item!.species}"),
          sameRow("HomePlanet", "${item!.homePlanet}"),
          sameRow("Occupation", "${item!.occupation}"),
          sameRow("Sayings", item!.sayings!.join(', ')),
        ],
      ),
    );
  }
}

Widget sameRow(String text1, String text2) {
  return Container(
    margin: EdgeInsets.only(left: 80.w, bottom: 20.h),
    width: double.infinity,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            width: 150.w,
            child: Text("$text1 :",
                style:
                    TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500))),
        SizedBox(
            width: 1000.w,
            child: Text(text2,
                style:
                    TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500))),
      ],
    ),
  );
}
