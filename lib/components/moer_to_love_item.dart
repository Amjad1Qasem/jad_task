// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jad/constants/app_images.dart';
import 'package:jad/model/cart.dart';
import 'package:jad/router/app_router.dart';
import 'package:jad/utilities/navigation.dart';
import 'package:jad/utilities/translation.dart';

class MoreToLoveItem extends StatelessWidget {
  MoreToLoveItem({
    super.key,
    required this.model,
  });
  CartModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.sp),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              context.goNamed(AppRouter.detailsScreen, argument: (model.name));
            },
            child: Container(
                width: 165.w,
                height: 180.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(48, 0, 0, 0),
                        offset: Offset(0, 4),
                        blurRadius: 4,
                      ),
                      BoxShadow(
                        color: Color.fromARGB(48, 0, 0, 0),
                        offset: Offset(4, 0),
                        blurRadius: 4,
                      )
                    ],
                    color: Theme.of(context).colorScheme.background),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5.sp),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Image.network(
                            model.image,
                            fit: BoxFit.fill,
                            width: 165.w,
                            height: 100.h,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                start: 5.sp,
                              ),
                              child: GestureDetector(
                                onTap: () {},
                                child: CircleAvatar(
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withOpacity(0.8),
                                  radius: 11.r,
                                  child: Icon(
                                    Icons.favorite_border,
                                    size: 18.sp,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.all(12.sp),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model.name,
                            style: Theme.of(context).textTheme.labelMedium,
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                          ),
                            Text(
                              '\$ ${model.price}',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          GestureDetector(
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(translation(context).addtoCart),
                                Image.asset(
                                  AppImages.cartIcon2,
                                  width: 20.w,
                                  height: 20.h,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ))
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
