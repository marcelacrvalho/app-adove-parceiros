import 'package:app_adove/app/data/graphql/mutations.dart';
import 'package:app_adove/app/data/graphql/server.dart';
import 'package:graphql/client.dart';

class StoreRepository {
  final GraphQLClient _client = getGraphQLClient();

  Future updateAddress(
    int id,
    String location,
    String street,
    String neighborhood,
    String number,
  ) async {
    try {
      final MutationOptions options = MutationOptions(
        document: gql(updateStoreAddress),
        variables: <String, dynamic>{
          'id': id,
          'location': location,
          'street': street,
          'neighborhood': neighborhood,
          'number': number
        },
      );
      final QueryResult result = await _client.mutate(options);
      var updateAddress = result.data?['updateStore'];
      return updateAddress;
    } catch (e) {
      return e;
    }
  }

  Future updateInfo(int id, bool homecare, String payment, String open) async {
    try {
      final MutationOptions options = MutationOptions(
        document: gql(updateStoreInfo),
        variables: <String, dynamic>{
          'id': id,
          'homecare': homecare,
          'payment': payment,
          'open': open
        },
      );
      final QueryResult result = await _client.mutate(options);
      var updateInfo = result.data?['updateStore'];
      return updateInfo;
    } catch (e) {
      return e;
    }
  }

  Future updateStatus(int id) async {
    try {
      final MutationOptions options = MutationOptions(
        document: gql(updateStoreStatus),
        variables: <String, dynamic>{'id': id},
      );
      final QueryResult result = await _client.mutate(options);
      var updateStore = result.data?['updateStore'];
      return updateStore;
    } catch (e) {
      return e;
    }
  }

  Future updateToken(int id, String firebaseToken) async {
    try {
      final MutationOptions options = MutationOptions(
        document: gql(updateStoreToken),
        variables: <String, dynamic>{'id': id, 'firebaseToken': firebaseToken},
      );
      final QueryResult result = await _client.mutate(options);
      var updateInfo = result.data?['updateStore'];
      return updateInfo;
    } catch (e) {
      return e;
    }
  }
}
