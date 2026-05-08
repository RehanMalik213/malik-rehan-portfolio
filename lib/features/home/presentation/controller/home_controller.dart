import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/home/presentation/controller/home_state.dart';

class HomeController extends Notifier<HomeState> {
  @override
  HomeState build() {
    return HomeState();
  }

  void increment() {
    state = state.copyWith(count: state.count + 1);
  }

  void decrement() {
    if (state.count > 0) {
      state = state.copyWith(count: state.count - 1);
    }
  }
}

final homeControllerProvider = NotifierProvider<HomeController, HomeState>(() {
  return HomeController();
});
