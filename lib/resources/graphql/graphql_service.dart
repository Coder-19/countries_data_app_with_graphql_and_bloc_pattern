// the code below is used to create a class for getting the data from the api
// using graphql
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  // the code below is used to create an instance of the graphql client
  late GraphQLClient _client;

  // the code below is used to create a constructor of the
  GraphQLService() {
    // the code below is used to get the link of the url for quering the api
    // using graphql
    HttpLink link = HttpLink("https://countries.trevorblades.com/");

    // the code below is used to pass the link to the graphqlclient

    // we are using the value notifier so that whosoever is listening to this link will get
    // the value as soon as the value is updated
    _client = GraphQLClient(link: link, cache: GraphQLCache());
  }

  // the code below is used to create a query for getting the data from api using
  // graphql server
  Future<QueryResult>? performQuery(String query) async {
    // the code below is used to convert the query to the graphql document
    QueryOptions options = QueryOptions(document: gql(query));

    // the code below is used to query the api using the graphql query method
    final result = _client.query(options);

    // the code below is to return the query result
    return result;
  }
}
