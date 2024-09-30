import 'package:groceries_app/core/domain/entities/user_entity.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';
import 'package:groceries_app/features/account/domain/repo/account_repo.dart';

class GetProfileUseCase extends BaseUseCase<void, UserEntity> {
  final AccountRepository _accountRepository;
  GetProfileUseCase(this._accountRepository);
  @override
  ResultFuture<UserEntity> execute([void input]) {
    return _accountRepository.getProfile();
  }
}
