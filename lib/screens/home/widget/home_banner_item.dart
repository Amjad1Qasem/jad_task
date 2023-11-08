import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jad/constants/app_images.dart';
import 'package:jad/model/home_banner_calss.dart';

// ignore: must_be_immutable
class HomeBannerItem extends StatelessWidget {
  HomeBannerItem({super.key, required this.model});
  HomeBannerModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Image.asset(
          AppImages.backGround1,
          width: MediaQuery.of(context).size.width,
          height: 140.h,
        ),
        SizedBox(
          width: 340.w,
          height: 140.h,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 90.w,
                          height: 17.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                              borderRadius: BorderRadius.circular(22.r)),
                          child: Text(model.title,
                              style: Theme.of(context).textTheme.titleSmall),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          model.description,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: BorderRadius.circular(4.r)),
                  width: 140.w,
                  height: 70.h,
                  child: Image.asset(
                    model.image,
                    fit: BoxFit.cover,
                    width: 100.w,
                    height: 90.h,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
