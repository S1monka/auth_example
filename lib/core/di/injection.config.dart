// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/api/api_provider.dart' as _i4;
import '../../data/repositories/repository_request_executor.dart' as _i5;
import 'modules/remote_module.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final remoteModule = _$RemoteModule();
  gh.factory<_i3.Dio>(() => remoteModule.dio);
  gh.factory<_i4.ApiServiceProvider>(
      () => _i4.ApiServiceProvider(get<_i3.Dio>()));
  gh.factory<_i5.RepositoryRequestExecutor>(
      () => _i5.RepositoryRequestExecutor(get<_i4.ApiServiceProvider>()));
  return get;
}

class _$RemoteModule extends _i6.RemoteModule {}
