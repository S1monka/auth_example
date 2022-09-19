import 'package:auth_example/data/models/auth_data.dart';
import 'package:injectable/injectable.dart';

import 'repository_request_executor.dart';

@injectable
class AuthRepository {
  final RepositoryRequestExecutor _requestExecutor;

  AuthRepository(this._requestExecutor);

  Future signUp({required AuthData authData}) async {
    return _requestExecutor.execute(
      (apiService) => apiService.signUp(authData: authData),
    );
  }

  Future signIn({required AuthData authData}) async {
    return _requestExecutor.execute(
      (apiService) => apiService.signIn(authData: authData),
    );
  }
}
