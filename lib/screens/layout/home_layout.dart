import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jad/bloc/bottom_nav_bar/bottom_nav_bar_cubit.dart';
import 'package:jad/components/bottom_nav_bar.dart';
import 'package:jad/components/default_scaffold.dart';
import 'package:jad/constants/app_images.dart';
import 'package:jad/screens/cart/cart_screen.dart';
import 'package:jad/screens/category/category_screen.dart';
import 'package:jad/screens/home/home_screen.dart';
import 'package:jad/screens/profile/profile_screen.dart';
import 'package:jad/screens/sale/sale_screen.dart';
import 'package:jad/utilities/translation.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => BottomNavBarCubit(),
        child: Builder(builder: (context) {
          final state = context.watch<BottomNavBarCubit>().state;
          return DefaultScaffold(
            appBar: state is! HomeState
                ? null
                : AppBar(
                    leadingWidth: 0,
                    leading: const SizedBox(),
                    backgroundColor: Theme.of(context).colorScheme.background,
                    title: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          AppImages.logoApp,
                          width: 70.w,
                          height: 70.h,
                        ),
                        Expanded(
                          child: SizedBox(
                            child: Padding(
                              padding: EdgeInsetsDirectional.only(end: 5.sp),
                              child: InkWell(
                                onTap: () {},
                                child: Stack(
                                  alignment: AlignmentDirectional.centerEnd,
                                  children: [
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        height: 30.h,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primaryContainer,
                                            borderRadius:
                                                BorderRadius.circular(8.r)),
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer),
                                    Padding(
                                      padding: EdgeInsets.all(5.sp),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.search,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            size: 45.sp,
                                          ),
                                          Expanded(
                                            child: Text(
                                              translation(context).search,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 19.sp),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.only(start: 0.sp, end: 10.sp),
                        child: GestureDetector(
                          onTap: () {},
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Image.asset(
                                AppImages.beelIcon,
                                width: 22.w,
                                height: 22.h,
                              ),
                              CircleAvatar(
                                radius: 8.r,
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                                child: Text(
                                  '1',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                          fontSize: 12, color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
            body: getBody(state),
            bottomNavigation: const BottomNavBarItem(),
          );
        }));
  }

  Widget getBody(BottomNavBarState state) => state is HomeState
      ? const HomeScreen()
      : state is SaleState
          ? const SaleScreen()
          : state is CategoryState
              ? const CategoryScreen()
              : state is CartState
                  ? const CartScreen(
                      hasBackButton: false,
                    )
                  : const ProfileScreen();
}
