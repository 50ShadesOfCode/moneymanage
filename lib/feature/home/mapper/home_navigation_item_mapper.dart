import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moneymanage/feature/home/home_navigation_item.dart';

extension HomeNavItemViewMapper on HomeNavigationItem {
  String toViewString() {
    switch (this) {
      case HomeNavigationItem.HOME:
        return AppLocalizations.ofGlobalContext('navigationToDiscover');
      case HomeNavigationItem.CHARTS:
        return AppLocalizations.ofGlobalContext('navigationToFavourite');
      case HomeNavigationItem.ACCOUNT:
        return AppLocalizations.ofGlobalContext('navigationToProfile');
    }
  }

  String _getIconAssetPath() {
    switch (this) {
      case HomeNavigationItem.HOME:
        return AppImages.navigationIconDiscover;
      case HomeNavigationItem.CHARTS:
        return AppImages.navigationIconFavourite;
      case HomeNavigationItem.ACCOUNT:
        return AppImages.navigationIconProfile;
    }
  }

  Widget toView({
    required bool isSelected,
  }) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 20,
          height: 20,
          child: SvgPicture.asset(
            _getIconAssetPath(),
            color: isSelected
                ? AppTheme.activeColor
                : AppTheme.inactivePrimaryColor,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          toViewString(),
          style: AppFonts.sfUi12Regular.copyWith(
            color: isSelected
                ? AppTheme.activeColor
                : AppTheme.inactivePrimaryColor,
          ),
        ),
        const SizedBox(height: 6),
      ],
    );
  }
}
