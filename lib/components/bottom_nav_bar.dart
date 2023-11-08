import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jad/bloc/BottomNavBar/bottom_nav_bar_cubit.dart';
import 'package:jad/constants/app_images.dart';
import 'package:jad/utilities/translation.dart';

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<BottomNavBarCubit>().state;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .1,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          boxShadow: const [
            BoxShadow(
                offset: Offset(1, 0),
                blurRadius: 5,
                color: Color.fromARGB(75, 0, 0, 0))
          ]),
      child: Padding(
        padding: EdgeInsets.all(5.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                BottomNavigationBarShadowItem(
                    opacity: state is! HomeState ? 0 : 1),
                GestureDetector(
                  onTap: context.read<BottomNavBarCubit>().homeScreen,
                  child: Padding(
                    padding: state is! HomeState
                        ? const EdgeInsets.only(top: 11, bottom: 0)
                        : const EdgeInsets.all(0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(AppImages.homeIcon,
                            width: 27.w,
                            height: 27.h,
                            color: state is! HomeState
                                ? Theme.of(context).colorScheme.onSecondary
                                : Theme.of(context).colorScheme.tertiary),
                        state is! HomeState
                            ? const SizedBox()
                            : Text(
                                translation(context).home,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold),
                              )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                BottomNavigationBarShadowItem(
                    opacity: state is! SaleState ? 0 : 1),
                GestureDetector(
                  onTap: context.read<BottomNavBarCubit>().saleScreen,
                  child: Padding(
                    padding: state is! SaleState
                        ? const EdgeInsets.only(top: 11, bottom: 0)
                        : const EdgeInsets.all(0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(AppImages.saleIcon,
                            width: 27.w,
                            height: 27.h,
                            color: state is! SaleState
                                ? Theme.of(context).colorScheme.onSecondary
                                : Theme.of(context).colorScheme.tertiary),
                        state is! SaleState
                            ? const SizedBox()
                            : Text(
                                translation(context).sale,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold),
                              )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                BottomNavigationBarShadowItem(
                    opacity: state is! CategoryState ? 0 : 1),
                GestureDetector(
                  onTap: context.read<BottomNavBarCubit>().categoryScreen,
                  child: Padding(
                    padding: state is! CategoryState
                        ? const EdgeInsets.only(top: 11, bottom: 0)
                        : const EdgeInsets.all(0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(AppImages.categoryIcon,
                            width: 27.w,
                            height: 27.h,
                            color: state is! CategoryState
                                ? Theme.of(context).colorScheme.onSecondary
                                : Theme.of(context).colorScheme.tertiary),
                        state is! CategoryState
                            ? const SizedBox()
                            : Text(
                                translation(context).category,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold),
                              )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                BottomNavigationBarShadowItem(
                    opacity: state is! CartState ? 0 : 1),
                GestureDetector(
                  onTap: context.read<BottomNavBarCubit>().cartScreen,
                  child: Padding(
                    padding: state is! CartState
                        ? const EdgeInsets.only(top: 11, bottom: 0)
                        : const EdgeInsets.all(0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(AppImages.cartIcon,
                            width: 27.w,
                            height: 27.h,
                            color: state is! CartState
                                ? Theme.of(context).colorScheme.onSecondary
                                : Theme.of(context).colorScheme.tertiary),
                        state is! CartState
                            ? const SizedBox()
                            : Text(
                                translation(context).cart,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold),
                              )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                BottomNavigationBarShadowItem(
                    opacity: state is! ProfileState ? 0 : 1),
                GestureDetector(
                  onTap: context.read<BottomNavBarCubit>().profileScreen,
                  child: Padding(
                    padding: state is! ProfileState
                        ? const EdgeInsets.only(top: 11, bottom: 0)
                        : const EdgeInsets.all(0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(AppImages.profileIcon,
                            width: 27.w,
                            height: 27.h,
                            color: state is! ProfileState
                                ? Theme.of(context).colorScheme.onSecondary
                                : Theme.of(context).colorScheme.tertiary),
                        state is! ProfileState
                            ? const SizedBox()
                            : Text(
                                translation(context).profile,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold),
                              )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigationBarShadowItem extends StatelessWidget {
  const BottomNavigationBarShadowItem({
    super.key,
    required this.opacity,
  });

  final double opacity;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 100),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          width: 55.w,
          height: 35.h,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
              borderRadius: BorderRadius.circular(5.r)),
        ),
      ]),
    );
  }
}
