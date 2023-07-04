import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_app/core/state/state.dart';
import 'package:my_app/core/usecase/usecase.dart';
import 'package:my_app/features/domain/entities/assets.dart';
import 'package:my_app/features/domain/entities/coin.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/features/domain/usecases/coin/get_all_coin_usecase.dart';
import 'package:my_app/features/domain/usecases/portifolio/create.dart';

final portifolioFormControllerProvider = StateNotifierProvider.autoDispose<
    PortifolioFormController,
    PortifolioFormState>((ref) => Modular.get<PortifolioFormController>());

class PortifolioFormState extends BaseState<PortifolioFormState> {
  final Portifolio? portifolio;
  final List<Coin> coins;
  final bool wasCrated;
  PortifolioFormState({
    required this.portifolio,
    required this.coins,
    required this.wasCrated,
    required isLoading,
    String? error,
  }) : super(isLoading: isLoading, error: error);

  factory PortifolioFormState.initial() => PortifolioFormState(
        portifolio: null,
        wasCrated: false,
        coins: [],
        isLoading: false,
      );

  PortifolioFormState copyWith({
    Portifolio? portifolio,
    List<Coin>? coins,
    bool? wasCrated,
    bool? isLoading,
    String? error,
  }) {
    return PortifolioFormState(
      portifolio: portifolio ?? this.portifolio,
      coins: coins ?? this.coins,
      wasCrated: wasCrated ?? this.wasCrated,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class PortifolioFormController extends StateNotifier<PortifolioFormState> {
  final CreatePortifolioUseCase createUsecase;
  final GetAllCoinUseCase getAllCoinUseCase;

  PortifolioFormController(
    this.createUsecase,
    this.getAllCoinUseCase,
  ) : super(PortifolioFormState.initial());

  createTrade(Portifolio portifolio) async {
    state = state.copyWith(isLoading: true);
    final result = await createUsecase(portifolio);

    state = state.copyWith(
        isLoading: false,
        wasCrated: true,
        portifolio: result.fold(
          (error) => Portifolio(
            id: '',
            name: '',
            coin: '',
            subTotal: 0,
            totalPriceActual: 0,
            percent: 0,
            assets: const [Assets(symbol: '', quanty: 0, price: 0)],
          ),
          (sucess) => sucess,
        ));
  }

  getAllCoin() async {
    try {
      final result = await getAllCoinUseCase.call(NoParams());
      state = state.copyWith(
          coins: result.fold(
        (error) => [],
        (sucess) => sucess
            .where((element) => element.symbol.toUpperCase().contains('USDT'))
            .toList(),
      ));
    } catch (e) {
      rethrow;
    }
  }

  fetch() async {
    state = state.copyWith(isLoading: true);
    await getAllCoin();
    state = state.copyWith(isLoading: false);
  }
}
