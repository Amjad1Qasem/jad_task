// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jad/bloc/apis/details/details_cubit.dart';
import 'package:jad/components/default_scaffold.dart';
import 'package:jad/components/product_item.dart';
import 'package:jad/constants/app_images.dart';
import 'package:jad/router/app_router.dart';
import 'package:jad/utilities/navigation.dart';
import 'package:jad/utilities/translation.dart';

class DetailsProduct extends StatelessWidget {
  const DetailsProduct({
    super.key,
    required this.productName,
  });

  final String productName;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  context.goNamed(AppRouter.homeLayout);
                },
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 25.sp,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              Text(
                productName,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Icon(
                Icons.share,
                size: 25.sp,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ),
        bottomNavigation: Container(
          padding: EdgeInsets.all(10.sp),
          color: Theme.of(context).colorScheme.background,
          height: 42.h,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  context.pushNamed(AppRouter.homeLayout);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.favorite_outline,
                      size: 30.sp,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    Text(
                      translation(context).favorait,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              GestureDetector(
                onTap: () {
                  context.pushNamed(AppRouter.cartScreen);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      AppImages.cartIcon2,
                      width: 30.w,
                      height: 31,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    Text(
                      translation(context).cart,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 122.w,
                      height: 28.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(25.r),
                            bottomStart: Radius.circular(25.r),
                          )),
                      child: Text(
                        translation(context).addtoCart,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context).colorScheme.background),
                      ),
                    ),
                    Container(
                      width: 115.w,
                      height: 28.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadiusDirectional.only(
                            topEnd: Radius.circular(25.r),
                            bottomEnd: Radius.circular(25.r),
                          )),
                      child: Text(
                        translation(context).buyNow,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context).colorScheme.background),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        body: SafeArea(
          child: BlocProvider(
            create: (context) => DetailsCubit()..fetch(),
            child: Builder(builder: (context) {
              final state = context.watch<DetailsCubit>().state;
              if (state is! DetailsSuccessed) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return SingleChildScrollView(
                  // physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          Row(
                            children: [
                              Image.network(
                                state.details.image,
                                width: MediaQuery.of(context).size.width,
                                height: 232.h,
                              ),
                            ],
                          ),
                          if (state.details.oldPrice >
                              state.details.currentPrice)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  alignment: AlignmentDirectional.center,
                                  width: 62.w,
                                  height: 18.h,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onTertiaryContainer,
                                  child: Text('-34%',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          const SizedBox(),
                          SizedBox(
                            height: 225.h,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    alignment: AlignmentDirectional.center,
                                    width: 70.w,
                                    height: 18.h,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                        borderRadius:
                                            BorderRadius.circular(20.r)),
                                    child: Text('1 / 3',
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium
                                            ?.copyWith(
                                                color:
                                                    const Color(0xff454545))),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  state.details.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontSize: 24.sp,
                                      ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                if (state.details.currentPrice ==
                                    state.details.oldPrice)
                                  Text(
                                    '\$ ${state.details.oldPrice}',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  )
                                else if (state.details.currentPrice <
                                    state.details.oldPrice)
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        '\$${state.details.oldPrice}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                decorationColor:
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .onPrimary),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 10.w,
                                          height: 2.h,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                        ),
                                      ),
                                      Text(
                                        '\$${state.details.currentPrice}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium,
                                      ),
                                    ],
                                  )
                              ],
                            ),
                            SizedBox(
                              width: 80.w,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    padding: EdgeInsets.all(5.sp),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(
                                            width: 1.5.w,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary)),
                                    child: Image.asset(
                                      AppImages.categoryOfficeDesk,
                                      fit: BoxFit.contain,
                                      width: 20.w,
                                      height: 20.h,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    'OFFICE FURNITURE',
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            color: const Color(0xff363636)),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.sp),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(translation(context).description,
                                style: Theme.of(context).textTheme.titleLarge),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(state.details.description,
                                maxLines: 10,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.labelMedium),
                          ],
                        ),
                      ),
                      if (state is DetailsLoading)
                        const CircularProgressIndicator(),
                      Padding(
                        padding: EdgeInsets.all(10.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              translation(context).recommended,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontSize: 24.sp),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            SizedBox(
                              height: 300,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) => ProductItem(
                                        model: state.details.recommended[index],
                                      ),
                                  separatorBuilder: (context, index) =>
                                      SizedBox(width: 0.0.w),
                                  itemCount: state.details.recommended.length),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }
            }),
          ),
        ));
  }
}
