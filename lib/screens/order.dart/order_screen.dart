import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jad/bloc/apis/cart/cart_cubit.dart' hide cartItems;
import 'package:jad/components/cart_product.dart';
import 'package:jad/components/default_scaffold.dart';
import 'package:jad/constants/app_images.dart';
import 'package:jad/utilities/navigation.dart';
import 'package:jad/utilities/translation.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.background,
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              size: 25.sp,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          title: Text(
            translation(context).orderConfirmation,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        bottomNavigation: BlocProvider(
          create: (context) => CartCubit()..fetch(),
          child: SizedBox(
            height: 40.h,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                width: 0.1,
                color: const Color(0xff333333),
              )),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          translation(context).total,
                          style: Theme.of(context).textTheme.labelMedium,
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
                              'US \$ ${sum.toString()}',
                              style: Theme.of(context).textTheme.labelMedium,
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 140.w,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          height: 30.h,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(30.r)),
                          child: Text(
                            translation(context).checkout,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: BlocProvider(
          create: (context) => CartCubit()..fetch(),
          child: Builder(builder: (context) {
            final state = context.watch<CartCubit>().state;
            if (state is! CartSuccessed) {
              return const Center(child: CircularProgressIndicator());
            }
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 330.h,
                      child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => CartProduct(
                                model: state.cartItems[index],
                                onChanged: (int count) {},
                              ),
                          separatorBuilder: (context, index) => SizedBox(
                                height: 10.h,
                              ),
                          itemCount: state.cartItems.length),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.sp),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10.sp),
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurStyle: BlurStyle.outer,
                                blurRadius: 5)
                          ],
                          color: Theme.of(context).colorScheme.background,
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Shipping adddress',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 25.sp,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Bashar +963 996633221',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(
                                            color: const Color(0xff545454)),
                                  ),
                                  Icon(
                                    Icons.arrow_back_ios_rounded,
                                    size: 20.sp,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text(
                                'Damascus , Syria',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(color: const Color(0xff545454)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.sp),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              translation(context).summary,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 25.sp,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  translation(context).totalCosts,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                          color: const Color(0xff545454)),
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
                                      'US \$ ${sum.toString()}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(
                                            color: const Color(0xff545454),
                                          ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      AppImages.saleIcon2,
                                      width: 15.w,
                                      height: 15.h,
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text(
                                      translation(context).sale,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(
                                              color: const Color(0xffFF4E4E)),
                                    ),
                                  ],
                                ),
                                Text(
                                  '-UC \$0.0',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                          color: const Color(0xffFF4E4E)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  translation(context).promoCode,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                          color: const Color(0xff545454)),
                                ),
                                Text(
                                  '-UC \$0.0',
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  translation(context).deliveryFees,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                          color: const Color(0xff545454)),
                                ),
                                Text(
                                  '-UC \$0.0',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                          color: const Color(0xff545454)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  translation(context).totalShipping,
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
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
                                      'US \$ ${sum.toString()}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
        ));
  }
}
