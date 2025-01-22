import 'dart:developer';
import 'package:dio/dio.dart';
import '../models/user_model.dart';

// i always use repositoy and them implement repository
// but i just use only repo just to demonstrate my basic code
// for full project i use layers like data and domain layers for genaric exception handling etc

class UserRepository {
  final Dio _dio = Dio();

  Future<List<UserModel>> fetchUsers(int page, int results) async {
    const urlPage1 = "https://randomuser.me/api/";
    try {
      final response = await _dio.get(
        urlPage1,
        queryParameters: {'page': page, 'results': results},
      );
      if (response.statusCode == 200) {
        final List<dynamic> users = response.data['results'];
        // log(users.toString());
        return users.map((user) => UserModel.fromJson(user)).toList();
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      log('Error while fetching users: $e');
      throw Exception('Error while fetching users: $e');
    }
  }
}
