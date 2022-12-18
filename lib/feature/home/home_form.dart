import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneymanage/feature/home/home_bloc/home_bloc.dart';
import 'package:moneymanage/feature/home/home_navigation_item.dart';
import 'package:moneymanage/feature/home/mapper/home_navigation_item_mapper.dart';

class HomeForm extends StatefulWidget {
  const HomeForm({super.key});

  @override
  HomeFormState createState() => HomeFormState();
}

class HomeFormState extends State<HomeForm> with TickerProviderStateMixin {
  late TabController _tabController;

  final List<HomeNavigationItem> _tabs = <HomeNavigationItem>[
    ...HomeNavigationItem.values
  ];

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: HomeNavigationItem.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (BuildContext context, HomeState state) {
      return Scaffold(
        body: Stack(
          children: <Widget>[
            TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                Container(),
                Container(),
                Container(),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    color: AppTheme.primaryColor,
                    height: Dimensions.ITEM_HEIGHT_56,
                    child: TabBar(
                      labelPadding: EdgeInsets.zero,
                      indicatorColor: Colors.transparent,
                      controller: _tabController,
                      tabs: _tabs
                          .map((HomeNavigationItem item) => item.toView(
                                isSelected: state.selectedTab == item,
                              ))
                          .toList(),
                      onTap: (int index) {
                        BlocProvider.of<HomeBloc>(context).add(
                          ChangeTab(tab: _tabs[index]),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
