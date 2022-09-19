import 'package:auth_example/data/models/auth_data.dart';
import 'package:auth_example/data/models/user.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

const _apiKey = 'AIzaSyBxh2wrEcD4mZUgKO9IDSccypvkj14JSjs';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST('accounts:signUp?key=$_apiKey')
  Future<User> signUp({@Body() required AuthData authData});

  @POST('accounts:signInWithPassword?key=$_apiKey')
  Future<User> signIn({@Body() required AuthData authData});
}
