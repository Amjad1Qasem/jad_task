// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jad/components/default_scaffold.dart';
import 'package:jad/components/product_item.dart';
import 'package:jad/constants/app_images.dart';
import 'package:jad/model/home_banner_calss.dart';
import 'package:jad/model/home_category_calss.dart';
import 'package:jad/model/product_item_class.dart';
import 'package:jad/screens/home/widget/home_banner_item.dart';
import 'package:jad/screens/home/widget/home_category_item.dart';
import 'package:jad/utilities/translation.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<HomeBannerModel> listHomeBannerModel = [
    HomeBannerModel(
        title: 'larg dishes',
        description: 'description description Data',
        image: AppImages.homeBannerProduct),
    HomeBannerModel(
        title: 'larg dishes',
        description: 'description description Data',
        image: AppImages.homeBannerProduct),
    HomeBannerModel(
        title: 'larg dishes',
        description: 'description description Data',
        image: AppImages.homeBannerProduct),
    HomeBannerModel(
        title: 'larg dishes',
        description: 'description description Data',
        image: AppImages.homeBannerProduct),
    HomeBannerModel(
        title: 'larg dishes',
        description: 'description description Data',
        image: AppImages.homeBannerProduct),
  ];
  List<HomeCategoryModel> listHomeCategoryModel = [
    HomeCategoryModel(
        categoryName: 'larg dishes', image: AppImages.homeBannerProduct),
    HomeCategoryModel(
        categoryName: 'larg dishes', image: AppImages.homeBannerProduct),
    HomeCategoryModel(
        categoryName: 'larg dishes', image: AppImages.homeBannerProduct),
    HomeCategoryModel(
        categoryName: 'larg dishes', image: AppImages.homeBannerProduct),
    HomeCategoryModel(
        categoryName: 'larg dishes', image: AppImages.homeBannerProduct),
  ];
  List<ProductModel> listProductModel = [
    ProductModel(
        productName: "Office Desk",
        productdescription:
            "Excepteur sint occaecat cupidatat non proident, sunt in cu",
        oldPrice: 202,
        currentPrice: 180,
        categoryName: "OFFICE FURNI",
        image: AppImages.product1),
    ProductModel(
        productName: "Office Desk",
        productdescription:
            "Excepteur sint occaecat cupidatat non proident, sunt in cu",
        oldPrice: 200,
        currentPrice: 200,
        categoryName: "OFFICE FURNI",
        image: AppImages.product1),
    ProductModel(
        productName: "Office Desk",
        productdescription:
            "Excepteur sint occaecat cupidatat non proident, sunt in cu",
        oldPrice: 2500,
        currentPrice: 2000,
        categoryName: "OFFICE FURNI",
        image: AppImages.product1),
    ProductModel(
        productName: "Office Desk",
        productdescription:
            "Excepteur sint occaecat cupidatat non proident, sunt in cu",
        oldPrice: 20,
        currentPrice: 20,
        categoryName: "OFFICE FURNI",
        image: AppImages.product1),
    ProductModel(
        productName: "Office Desk",
        productdescription:
            "Excepteur sint occaecat cupidatat non proident, sunt in cu",
        oldPrice: 20,
        currentPrice: 20,
        categoryName: "OFFICE FURNI",
        image: AppImages.product1),
    ProductModel(
        productName: "Office Desk",
        productdescription:
            "Excepteur sint occaecat cupidatat non proident, sunt in cu",
        oldPrice: 20,
        currentPrice: 20,
        categoryName: "OFFICE FURNI",
        image: AppImages.product1),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 6,
          ),
          SizedBox(
            height: 90.h,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => HomeBannerItem(
                      model: listHomeBannerModel[index],
                    ),
                separatorBuilder: (context, index) => SizedBox(width: 0.w),
                itemCount: listHomeBannerModel.length),
          ),
          SizedBox(
            height: 15.h,
          ),
          SizedBox(
            height: 80.h,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => HomeCategoryItem(
                      model: listHomeCategoryModel[index],
                    ),
                separatorBuilder: (context, index) => SizedBox(width: 10.w),
                itemCount: listHomeCategoryModel.length),
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
                      model: listProductModel[index],
                    ),
                separatorBuilder: (context, index) => SizedBox(width: 0.0.w),
                itemCount: listProductModel.length),
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
                        model: listProductModel[index],
                      ),
                  separatorBuilder: (context, index) => SizedBox(width: 0.0.w),
                  itemCount: listProductModel.length),
            ),
          ]),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              HomeBannerItem(
                model: listHomeBannerModel[1],
              ),
              HomeBannerItem(
                model: listHomeBannerModel[2],
              ),
            ],
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
                        model: listProductModel[index],
                      ),
                  separatorBuilder: (context, index) => SizedBox(width: 0.0.w),
                  itemCount: listProductModel.length),
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
                        model: listProductModel[index],
                      ),
                  separatorBuilder: (context, index) => SizedBox(width: 0.0.w),
                  itemCount: listProductModel.length),
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
                        model: listProductModel[index],
                      ),
                  separatorBuilder: (context, index) => SizedBox(width: 0.0.w),
                  itemCount: listProductModel.length),
            ),
          ]),
        ],
      ),
    ));
  }
}
