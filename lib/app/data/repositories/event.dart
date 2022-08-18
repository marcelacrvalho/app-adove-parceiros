import 'package:app_adove/app/data/graphql/mutations.dart';
import 'package:app_adove/app/data/graphql/queries.dart';
import 'package:app_adove/app/data/graphql/server.dart';
import 'package:app_adove/app/data/models/event.dart';
import 'package:graphql/client.dart';

class EventRepository {
  final GraphQLClient _client = getGraphQLClient();

  Future getEvents(int storeId) async{
    try {
      final QueryOptions options = QueryOptions(
        document: gql(getStoreEvents),
        variables: {'store': storeId},
      );
      final QueryResult result = await _client.query(options);
      List<Event> listEvent = result.data?['events'].map<Event>((map) {
        return Event.fromJson(map);
      }).toList();
      return listEvent;
    } catch (e) {
      return null;
    }
  }

  Future deleteEvent(int eventId) async {
    final MutationOptions options = MutationOptions(
      document: gql(deleteStoreEvent),
      variables: <String, dynamic>{
        'id': eventId
      },
    );
    QueryResult result = await _client.mutate(options);
    return result;
  }
}