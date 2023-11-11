import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jad/bloc/apis/cart/cart_cubit.dart';
import 'package:jad/components/cart_product.dart';
import 'package:jad/components/default_scaffold.dart';
import 'package:jad/components/moer_to_love_item.dart';
import 'package:jad/components/product_item.dart';
import 'package:jad/router/app_router.dart';
import 'package:jad/utilities/navigation.dart';
import 'package:jad/utilities/translation.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    super.key,
    this.hasBackButton = true,
  });
  final bool hasBackButton;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..fetch(),
      child: DefaultScaffold(
          bottomNavigation: !hasBackButton
              ? const SizedBox()
              : SizedBox(
                  height: 40.h,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 40.h,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                            width: 0.1,
                            color: const Color(0xff333333),
                          )),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.sp, vertical: 10.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      translation(context).total,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                    BlocBuilder<CartCubit, CartState>(
                                      builder: (context, state) {
                                        int sum = 0;
                                        if (state is CartSuccessed) {
                                          state.cartItems
                                              .map((e) => e.price * e.quantity)
                                              .forEach((element) {
                                            sum += element;
                                          });
                                        } else if (state is CartChanged) {
                                          state.cartItems
                                              .map((e) => e.price * e.quantity)
                                              .forEach((element) {
                                            
                                            sum += element;
                                          });
                                        }
                                        return Text(
                                          sum.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 140.w,
                                  child: GestureDetector(
                                    onTap: () {
                                      context.pushNamed(AppRouter.orderScreen);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 30.h,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          borderRadius:
                                              BorderRadius.circular(30.r)),
                                      child: Text(
                                        translation(context).placeOrder,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onPrimary),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          appBar: AppBar(
              centerTitle: true,
              backgroundColor: Theme.of(context).colorScheme.background,
              leading: !hasBackButton
                  ? Padding(
                      padding:
                          EdgeInsetsDirectional.only(start: 10.sp, top: 14.sp),
                      child: Text(
                        translation(context).cart,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 25.sp,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
              actions: [
                Padding(
                  padding: EdgeInsetsDirectional.only(end: 10.sp),
                  child: Icon(
                    Icons.share,
                    size: 25.sp,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ]),
          body: Builder(builder: (context) {
            final state = context.watch<CartCubit>().state;
            if (state is! CartSuccessed) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 340.h,
                        child: Padding(
                          padding: EdgeInsets.all(10.sp),
                          child: ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => CartProduct(
                                    model: state.cartItems[index],
                                    onChanged: (count) => context
                                        .read<CartCubit>()
                                        .changeProductQuantity(
                                            state.cartItems[index], count),
                                  ),
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 10.h,
                                  ),
                              itemCount: state.cartItems.length),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 10.sp),
                        child: Text(
                          translation(context).moreToLove,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 25.sp,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.all(4.sp),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 1,
                                      crossAxisSpacing: 9,
                                      childAspectRatio: 10 / 18,
                                      crossAxisCount: 2),
                              itemCount: state.moreToLoveItems.length,
                              itemBuilder: (context, index) => MoreToLoveItem(
                                model: state.moreToLoveItems[index],
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
          })),
    );
  }
}
