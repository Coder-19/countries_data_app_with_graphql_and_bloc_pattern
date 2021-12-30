// the code below is used to create a repository for our project
import 'package:countries_data_app_with_graphql_and_bloc_pattern/resources/graphql/graphql_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Repository {
  // the code below is used to create an instance of the graphQL service
  GraphQLService service = GraphQLService();

  // the code below is used to create a method for getting the data from the
  // api using graphql

  // the method below takes query of type string as input and this query is the
  // graphql query that we need to perform on the api
  Future<QueryResult>? getData(String query) => service.performQuery(query);
}
