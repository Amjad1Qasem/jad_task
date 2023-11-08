import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jad/bloc/localization/localization_cubit.dart';
import 'package:jad/bloc/theme/theme_cubit.dart';
import 'package:jad/router/app_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jad/themes/app_themes.dart';
import 'package:jad/translation/app_translations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => LocalizationCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 488),
        builder: (context, child) {
          final ThemeState themeState = context.watch<ThemeCubit>().state;
          final LocalizationState localizationState =
              context.watch<LocalizationCubit>().state;
          if (themeState is! ThemeFetched ||
              localizationState is! LocalizationFetched) {
            return const SizedBox();
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppThemes.light,
            initialRoute: AppRouter.homeLayout,
            themeMode: themeState.themeMode,
            locale: localizationState.locale,
            supportedLocales: AppTranslation.all,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            onGenerateRoute: AppRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
