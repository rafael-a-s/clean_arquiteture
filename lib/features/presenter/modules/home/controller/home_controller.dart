import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_app/core/state/state.dart';
import 'package:my_app/core/usecase/usecase.dart';
import 'package:my_app/features/domain/entities/assets.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/features/domain/usecases/assets/get_all_recents_usecase.dart';
import 'package:my_app/features/domain/usecases/portifolio/get_all_portifolios.dart';
import 'package:flutter_modular/flutter_modular.dart';

final homeControllerProvider =
    StateNotifierProvider.autoDispose<HomeController, HomeState>((ref) {
  return Modular.get<HomeController>();
});

class HomeState extends BaseState<HomeState> {
  final List<Portifolio> portifolios;
  final List<Assets> assets;

  HomeState({
    required this.portifolios,
    required this.assets,
    required isLoading,
    String? error,
  }) : super(isLoading: isLoading, error: error);

  factory HomeState.initial() =>
      HomeState(portifolios: [], assets: [], isLoading: false);

  HomeState copyWith({
    List<Portifolio>? portifolios,
    List<Assets>? assets,
    bool? isLoading,
    String? error,
  }) {
    return HomeState(
      portifolios: portifolios ?? this.portifolios,
      assets: assets ?? this.assets,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class HomeController extends StateNotifier<HomeState> {
  final GetAllPortifolioUseCase getAllPortifolioUseCase;
  final GetAllAssetsRecentsUseCase getAllAssetsRecentsUseCase;

  HomeController(
    this.getAllAssetsRecentsUseCase,
    this.getAllPortifolioUseCase,
  ) : super(HomeState.initial());

  fetch() async {
    state = state.copyWith(isLoading: true);
    await getAllPortifolio();
    await getAllAssetsRecents();
    state = state.copyWith(isLoading: false);
  }

  Future<void> getAllPortifolio() async {
    try {
      final result = await getAllPortifolioUseCase(NoParams());
      state = state.copyWith(
          portifolios: result.fold((error) => [], (sucess) => sucess));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getAllAssetsRecents() async {
    try {
      final result = await getAllAssetsRecentsUseCase(NoParams());
      state = state.copyWith(
          assets: result.fold((error) => [], (sucess) => sucess));
    } catch (e) {
      rethrow;
    }
  }
}
