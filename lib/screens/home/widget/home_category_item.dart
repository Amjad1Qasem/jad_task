import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jad/model/home_category_calss.dart';
import 'package:jad/themes/extentions/bg_category_theme_extention.dart';

// ignore: must_be_immutable
class HomeCategoryItem extends StatelessWidget {
  HomeCategoryItem({super.key, required this.model});
  HomeCategoryModel model;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorsThemeExtention>()!;
    return Padding(
      padding: EdgeInsets.all(10.sp),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: 90,
            height: 90,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: colors.categoryBgColor),
                borderRadius: BorderRadius.circular(50)),
            child: Image.network(
              model.image,
              fit: BoxFit.fill,
              width: 70,
              height: 60,
            ),
          ),
          Expanded(
            child: Text(
              model.categoryName,
              style: Theme.of(context).textTheme.labelMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
