// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jad/bloc/apis/home/home_cubit.dart';
import 'package:jad/components/default_scaffold.dart';
import 'package:jad/components/product_item.dart';
import 'package:jad/screens/home/widget/home_banner_item.dart';
import 'package:jad/screens/home/widget/home_category_item.dart';
import 'package:jad/utilities/translation.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // List<ProductModel> listProductModel = [
  //   ProductModel(
  //       id: 1,
  //       name: "Office Desk",
  //       description:
  //           "Excepteur sint occaecat cupidatat non proident, sunt in cu",
  //       oldPrice: 202,
  //       currentPrice: 180,
  //       category: "OFFICE FURNI",
  //       image: AppImages.product1,
  //       recommended: []),
  //   ProductModel(
  //       id: 1,
  //       name: "Office Desk",
  //       description:
  //           "Excepteur sint occaecat cupidatat non proident, sunt in cu",
  //       oldPrice: 202,
  //       currentPrice: 180,
  //       category: "OFFICE FURNI",
  //       image: AppImages.product1,
  //       recommended: []),
  //   ProductModel(
  //       id: 1,
  //       name: "Office Desk",
  //       description:
  //           "Excepteur sint occaecat cupidatat non proident, sunt in cu",
  //       oldPrice: 202,
  //       currentPrice: 180,
  //       category: "OFFICE FURNI",
  //       image: AppImages.product1,
  //       recommended: []),
  //   ProductModel(
  //       id: 1,
  //       name: "Office Desk",
  //       description:
  //           "Excepteur sint occaecat cupidatat non proident, sunt in cu",
  //       oldPrice: 202,
  //       currentPrice: 180,
  //       category: "OFFICE FURNI",
  //       image: AppImages.product1,
  //       recommended: []),
  // ];

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        body: BlocProvider(
      create: (context) => HomeCubit()..fetch(),
      child: Builder(builder: (context) {
        final state = context.watch<HomeCubit>().state;
        if (state is! HomeSuccessed) {
          return const Center(child: CircularProgressIndicator());
        }
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 90.h,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          HomeBannerItem(model: state.banners[index]),
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 0.w),
                      itemCount: state.banners.length),
                ),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  height: 80.h,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          HomeCategoryItem(model: state.categories[index]),
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 10.w),
                      itemCount: state.categories.length),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        translation(context).newProduct,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      GestureDetector(
                        onTap: () {
                          print('View All Products');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              translation(context).viewAll,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Icon(
                              Icons.play_arrow_rounded,
                              size: 15.sp,
                              color: Theme.of(context).colorScheme.primary,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 190.h,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => ProductItem(
                            model: state.products[index],
                          ),
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 0.0.w),
                      itemCount: state.products.length),
                ),
                //   ),
                // SizedBox(
                //   height: 190.h,
                // child: ListView.separated(
                //     scrollDirection: Axis.horizontal,
                //     itemBuilder: (context, index) => ProductItem(
                //           model: state.products[index],
                //         ),
                //     separatorBuilder: (context, index) =>
                //         SizedBox(width: 0.0.w),
                //     itemCount: state.products.length),
                // ),
                Column(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          translation(context).bestSeller,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        GestureDetector(
                          onTap: () {
                            print('View All Products');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                translation(context).viewAll,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Icon(
                                Icons.play_arrow_rounded,
                                size: 15.sp,
                                color: Theme.of(context).colorScheme.primary,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 190.h,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => ProductItem(
                              model: state.products[index],
                            ),
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 0.0.w),
                        itemCount: state.products.length),
                  ),
                ]),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 200.h,
                  child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) =>
                          HomeBannerItem(model: state.banners[index]),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10.h),
                      itemCount: 2),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Column(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          translation(context).bestSeller,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        GestureDetector(
                          onTap: () {
                            print('View All Products');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                translation(context).viewAll,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Icon(
                                Icons.play_arrow_rounded,
                                size: 15.sp,
                                color: Theme.of(context).colorScheme.primary,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 190.h,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => ProductItem(
                              model: state.products[index],
                            ),
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 0.0.w),
                        itemCount: state.products.length),
                  ),
                ]),
                SizedBox(
                  height: 15.h,
                ),
                Column(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          translation(context).cutlery,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        GestureDetector(
                          onTap: () {
                            print('View All Products');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                translation(context).viewAll,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Icon(
                                Icons.play_arrow_rounded,
                                size: 15.sp,
                                color: Theme.of(context).colorScheme.primary,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 190.h,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => ProductItem(
                              model: state.products[index],
                            ),
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 0.0.w),
                        itemCount: state.products.length),
                  ),
                ]),
                SizedBox(
                  height: 15.h,
                ),
                Column(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          translation(context).buffet,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        GestureDetector(
                          onTap: () {
                            print('View All Products');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                translation(context).viewAll,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Icon(
                                Icons.play_arrow_rounded,
                                size: 15.sp,
                                color: Theme.of(context).colorScheme.primary,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 190.h,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => ProductItem(
                              model: state.products[index],
                            ),
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 0.0.w),
                        itemCount: state.products.length),
                  ),
                ]),
              ],
            ),
          ),
        );
      }),
    ));
  }
}
