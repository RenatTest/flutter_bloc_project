import '../models/user.dart';
import 'user_api_provider.dart';

class UsersRepository {
  final UserProvider _usersProvider = UserProvider();
  Future<List<User>> getAllUsers() => _usersProvider.getUser();
}
