// the code below is used to create a class to act as bloc for the app
import 'package:countries_data_app_with_graphql_and_bloc_pattern/model/home_model.dart';
import 'package:countries_data_app_with_graphql_and_bloc_pattern/resources/repository/repository.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rxdart/rxdart.dart';

// NOTE:- sink in and stream out

class GraphQLBloc {
  // the code below is used to create an instance of the repository class
  Repository repository = Repository();

  // the code below is used to create an Object of PublishSubject for getting the
  // data as a stream
  final PublishSubject<ItemModel> _countryDataFetcher =
      PublishSubject<ItemModel>();

  // the code below is used to create a getter of type Stream<ItemModel> for
  // giving the data as a stream
  Stream<ItemModel> get countryData => _countryDataFetcher.stream;

  // the code below is used to create a method to get the data and add this data
  // to the stream using the sink method

  // the method below takes query as input that we need to get the data from the
  // api using the graphql server
  getData(String query) async {
    try {
      // the code below is used to query the api using the graphql server and store
      // that data in query result
      QueryResult? result = await repository.getData(query);
      // passing the data stored in the result variable to from json method
      // for converting the data from json to dart object
      ItemModel data =
          ItemModel.fromJSON(result!.data!['continent']['countries']);

      // the below line of code is for debugging purpose
      print("GrapQLBloc: $data");

      // the code below is to use the sink method to add the data to the stream
      _countryDataFetcher.sink.add(data);
    } catch (e) {
      // the below line of code is for debugging purpose
      print("GraphQLBloc/Error: $e");
    }
  }

  // the code below is used to create a dispose method to close the stream
  dispose() {
    _countryDataFetcher.close();
  }
}

// the code below is used to create an object of GraphQLBloc
final GraphQLBloc bloc = GraphQLBloc();
