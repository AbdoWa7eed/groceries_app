import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';
import 'package:groceries_app/features/account/domain/repo/account_repo.dart';

class LogoutUseCase extends BaseUseCase<void, String> {
  final AccountRepository _accountRepository;
  LogoutUseCase(this._accountRepository);
  @override
  ResultFuture<String> execute([void input]) {
    return _accountRepository.logout();
  }
}
