// the code below is used to create a class having the properties for getting the
// data from the api using the graphql query
class HomeModel {
  // the property below is used to get the country code
  String? countryCode;
  // the property below is used to get the country name
  String? countryName;

  // initializing the above properties using the dart constructor
  HomeModel({this.countryCode, this.countryName});
}

// the code below is used to create an ItemModel class for getting the list of
// type HomeModel that  will contain the list of data that we get from the api
// using graphql
class ItemModel {
  // the code below is used to create a list of type HomeModel to get the data
  // in the form of list from api using graphql
  List<HomeModel> countryList = [];

  // the code below is used to create a factory method for getting the data from api
  // and converting that data to Dart Object
  ItemModel.fromJSON(data) {
    for (int index = 0; index < data.length; index++) {
      countryList.add(HomeModel(
        countryCode: data[index]['code'],
        countryName: data[index]['name'],
      ));
    }
  }
}
