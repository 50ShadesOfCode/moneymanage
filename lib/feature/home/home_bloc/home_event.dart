import 'package:flutter/foundation.dart';
import 'package:moneymanage/feature/home/home_navigation_item.dart';

@immutable
abstract class HomeEvent {}

class ChangeTab extends HomeEvent {
  final HomeNavigationItem tab;

  ChangeTab({
    required this.tab,
  });
}
