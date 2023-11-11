// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jad/bloc/apis/details/details_cubit.dart';
import 'package:jad/constants/app_images.dart';
import 'package:jad/model/product_item.dart';
import 'package:jad/router/app_router.dart';
import 'package:jad/utilities/navigation.dart';
import 'package:jad/utilities/translation.dart';

class ProductecommendedItem extends StatelessWidget {
  ProductecommendedItem({super.key, required this.model});
  ProductModel model;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsCubit(),
      child: Builder(builder: (context) {
        final state = context.watch<DetailsCubit>().state;
        if (state is! DetailsSuccessed) {
          return const CircularProgressIndicator();
        }
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.sp),
          child: GestureDetector(
            onTap: () {
              context.goNamed(AppRouter.detailsScreen,
                  argument: (model.name));
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
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Image.network(
                            state.details.recommended[7] as String,
                            fit: BoxFit.fill,
                            width: 165.w,
                            height: 110.h,
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
                            if (state.details.recommended[1].currentPrice < state.details.recommended[1].oldPrice)
                              Container(
                                alignment: Alignment.center,
                                width: 65.w,
                                height: 15.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadiusDirectional.only(
                                      topStart: const Radius.circular(0),
                                      topEnd: Radius.circular(10.sp)),
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                ),
                                child: Text(
                                  translation(context).sale,
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
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
                          if (state.details.recommended[3] == state.details.recommended[4])
                            Text(
                              '\$ ${state.details.recommended[1].oldPrice}',
                              style: Theme.of(context).textTheme.labelSmall,
                            )
                          else if (state.details.recommended[1].currentPrice < state.details.recommended[1].oldPrice)
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '\$ ${state.details.recommended[1].oldPrice}',
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey,
                                      fontSize: 15.sp),
                                ),
                                SizedBox(
                                  width: 12.w,
                                ),
                                Text(
                                  '\$ ${state.details.recommended[1].category}',
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              ],
                            )
                          else
                            const Text('Pleas Confirm from your price'),
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
        );
      }),
    );
  }
}
