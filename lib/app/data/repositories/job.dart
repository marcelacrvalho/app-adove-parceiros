import 'package:app_adove/app/data/graphql/mutations.dart';
import 'package:app_adove/app/data/graphql/queries.dart';
import 'package:app_adove/app/data/graphql/server.dart';
import 'package:app_adove/app/data/models/job.dart';
import 'package:graphql/client.dart';

class JobRepository {
  final GraphQLClient _client = getGraphQLClient();

  Future jobs(int store) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(getJobsByStore),
        variables: <String, dynamic>{'store': store},
      );
      final QueryResult result = await _client.query(options);
      List<Job> listJobs = result.data?['jobsByStore'].map<Job>((map) {
        return Job.fromJson(map);
      }).toList();
      return listJobs;
    } catch (e) {
      return e;
    }
  }

  Future newJob(String job, String description, String price, int store) async {
    try {
      final MutationOptions options = MutationOptions(
        document: gql(createJob),
        variables: <String, dynamic>{
          'job': job,
          'description': description,
          'price': price,
          'store': store
        },
      );
     QueryResult result = await _client.mutate(options);
     return result.data;
    } catch (e) {
      return e;
    }
  }

  Future editJob(
      int id, String? job, String? description, String? price) async {
    try {
      final MutationOptions options = MutationOptions(
        document: gql(updateJob),
        variables: <String, dynamic>{
          'id': id,
          'job': job,
          'description': description,
          'price': price
        },
      );
      QueryResult result = await _client.mutate(options);
      return result.data;
    } catch (e) {
      return e;
    }
  }

  Future deleteJob(int id) async {
    try {
      final MutationOptions options = MutationOptions(
        document: gql(excludeJob),
        variables: <String, dynamic>{'id': id},
      );
      await _client.mutate(options);
    } catch (e) {
      return e;
    }
  }
}
