import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

List<PageViewModel> pages = <PageViewModel>[
  PageViewModel(
    titleWidget: Text(
      texts[0],
      textAlign: TextAlign.center,
      style: AppFonts.sfUi24bold.copyWith(color: AppTheme.activeColor),
    ),
    image: Container(
        width: 100,
        height: 100,
        padding: const EdgeInsets.symmetric(
          vertical: 2,
        ),
        child: Image(
          image: AssetImage(icons[0]),
        )),
    bodyWidget: dots(0),
  ),
  PageViewModel(
    titleWidget: Text(
      texts[1],
      textAlign: TextAlign.center,
      style: AppFonts.sfUi24bold.copyWith(color: AppTheme.activeColor),
    ),
    image: Container(
        width: 100,
        height: 100,
        padding: const EdgeInsets.symmetric(
          vertical: 2,
        ),
        child: Image(
          image: AssetImage(icons[1]),
        )),
    bodyWidget: dots(1),
  ),
  PageViewModel(
    titleWidget: Text(
      texts[2],
      textAlign: TextAlign.center,
      style: AppFonts.sfUi24bold.copyWith(color: AppTheme.activeColor),
    ),
    image: Container(
        width: 100,
        height: 100,
        padding: const EdgeInsets.symmetric(
          vertical: 2,
        ),
        child: Image(
          image: AssetImage(icons[2]),
        )),
    bodyWidget: dots(2),
  ),
];

const List<String> icons = <String>[
  'assets/images/png/music_folder.png',
  'assets/images/png/like.png',
  'assets/images/png/earphone.png',
];

List<String> texts = <String>[
  AppLocalizations.ofGlobalContext('onboarding_count'),
  AppLocalizations.ofGlobalContext('onboarding_manage'),
  AppLocalizations.ofGlobalContext('onboarding_save'),
];

Widget dots(int index) {
  return SizedBox(
    width: 56,
    height: 8,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        index == 0 ? activeDot() : inactiveDot(),
        const SizedBox(width: Dimensions.SPACE_8),
        index == 1 ? activeDot() : inactiveDot(),
        const SizedBox(width: Dimensions.SPACE_8),
        index == 2 ? activeDot() : inactiveDot(),
      ],
    ),
  );
}

Widget inactiveDot() {
  return Container(
    width: 8,
    height: 8,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: AppTheme.inactivePrimaryColor,
    ),
  );
}

Widget activeDot() {
  return Container(
    width: 24,
    height: 8,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: AppTheme.activeColor,
    ),
  );
}
