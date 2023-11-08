// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jad/components/default_scaffold.dart';
import 'package:jad/model/product_item_class.dart';

class DetailsProduct extends StatelessWidget {
  const DetailsProduct({super.key, required this.productName});
  final String productName;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Icon(
                Icons.arrow_back_ios_rounded,
                size: 18.sp,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              Text(
                productName,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Icon(
                Icons.share,
                size: 18.sp,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ),
        body: const Column(
          children: [],
        ));
  }
}
