import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jad/constants/app_images.dart';
import 'package:jad/model/cart.dart';
import 'package:jad/utilities/translation.dart';

class CartProduct extends HookWidget {
  const CartProduct({
    super.key,
    required this.model,
    required this.onChanged,
  });
  final CartModel model;

  final Function(int count) onChanged;

  @override
  Widget build(BuildContext context) {
    final count = useState(model.quantity);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Theme.of(context).colorScheme.background,
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
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(5.sp),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 150.w,
              height: 90.h,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.circular(8.r)),
              child: Image.network(
                model.image,
                fit: BoxFit.contain,
                width: 180.w,
                height: 90.h,
              ),
            ),
            SizedBox(
              width: 3.sp,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            model.name,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge
                                ?.copyWith(fontSize: 20),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            model.category,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w300,
                                ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Container(
                            padding: EdgeInsets.all(5.sp),
                            width: 85.w,
                            height: 16.h,
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                borderRadius: BorderRadius.circular(5.r)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  AppImages.notIcon,
                                  width: 15.w,
                                  height: 15.h,
                                ),
                                Text(
                                  translation(context).addNote,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                AppImages.saleIcon2,
                                width: 15.w,
                                height: 15.h,
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Text(
                                translation(context).sale,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(
                                        fontSize: 16,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onTertiaryContainer),
                              )
                            ],
                          ),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.only(end: 14.sp),
                              child: Image.asset(
                                AppImages.removeIcon,
                                width: 20.w,
                                height: 20.h,
                              ),
                            ),
                            SizedBox(
                              height: 26.sp,
                            ),
                            SizedBox(
                              width: 100.w,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      if (count.value > 1) {
                                        count.value--;
                                        onChanged(count.value);
                                      }
                                    },
                                    child: Container(
                                        alignment: AlignmentDirectional.center,
                                        padding: EdgeInsets.all(5.sp),
                                        width: 30.w,
                                        height: 18.h,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            borderRadius:
                                                BorderRadius.circular(5.r)),
                                        child: Icon(
                                          Icons.remove,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Text(
                                      count.value.toString(),
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      count.value++;
                                      onChanged(count.value);
                                    },
                                    child: Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.all(5.sp),
                                        width: 30.w,
                                        height: 18.h,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            borderRadius:
                                                BorderRadius.circular(5.r)),
                                        child: Icon(
                                          Icons.add,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background,
                                        )),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Text(
                    'US \$${model.price}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontSize: 16),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
