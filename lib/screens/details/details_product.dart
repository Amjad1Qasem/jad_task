// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jad/components/default_scaffold.dart';

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
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.arrow_back_ios_rounded,
                size: 25.sp,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              Text(
                productName,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Icon(
                Icons.share,
                size: 25.sp,
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
