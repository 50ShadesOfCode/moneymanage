import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneymanage/feature/home/home_navigation_item.dart';
import 'package:moneymanage/router/router.dart';

import 'home_event.dart';
import 'home_state.dart';

export 'home_event.dart';
export 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AppRouter _appRouter;
  HomeBloc({
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(const HomeState(
          title: 'Home',
          selectedTab: HomeNavigationItem.HOME,
        )) {
    on<ChangeTab>(_onChangeTab);
  }

  Future<void> _onChangeTab(ChangeTab event, Emitter<HomeState> emit) async {
    emit(
      state.copyWith(
        title: state.title,
        selectedTab: event.tab,
      ),
    );
  }
}
