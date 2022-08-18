import 'package:app_adove/app/data/graphql/mutations.dart';
import 'package:app_adove/app/data/graphql/server.dart';
import 'package:graphql/client.dart';

class AuthRepository {
  final GraphQLClient _client = getGraphQLClient();

  Future login(String email, String password) async {
    try {
      final MutationOptions options = MutationOptions(
        document: gql(loginStore),
        variables: <String, dynamic>{'email': email, 'password': password},
      );
      QueryResult result = await _client.mutate(options);
      return result.data?['loginStore'];
    } catch (e) {
      return e;
    }
  }
}
