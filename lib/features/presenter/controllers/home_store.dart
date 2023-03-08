import 'package:flutter_triple/flutter_triple.dart';
import 'package:my_app/core/usecase/erros/failures.dart';
import 'package:my_app/features/domain/entities/example.dart';
import 'package:my_app/features/domain/usecases/get_example_from_username_usecase.dart';

class HomeStore extends NotifierStore<Failure, Example> {
  final GetExampleFromUsernameUsecase usecase;

  HomeStore(this.usecase)
      : super(Example(login: '', id: '', avatar_url: '', url: ''));

  getUserGitFormUsername(String username) async {
    executeEither(() => usecase(username) as Future<EitherAdapter<Failure, Example>>);
  }



}
