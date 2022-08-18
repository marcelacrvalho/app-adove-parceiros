import 'package:app_adove/app/data/graphql/queries.dart';
import 'package:app_adove/app/data/graphql/server.dart';
import 'package:app_adove/app/data/models/publication.dart';
import 'package:graphql/client.dart';

class PublicationRepository {
  final GraphQLClient _client = getGraphQLClient();

  Future publications() async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(getPublications),
      );
      final QueryResult result = await _client.query(options);
      List<Publication> listPublications =
          result.data?['publications'].map<Publication>((map) {
        return Publication.fromJson(map);
      }).toList();
      return listPublications;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
