import 'package:countries_data_app_with_graphql_and_bloc_pattern/bloc/graphql_bloc.dart';
import 'package:countries_data_app_with_graphql_and_bloc_pattern/model/home_model.dart';
import 'package:countries_data_app_with_graphql_and_bloc_pattern/resources/graphql/api_query.dart';
import 'package:flutter/material.dart';

// the code below is used to create a class to act as home screen for the project
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bloc.getData(query);
    return Scaffold(
      body: StreamBuilder<ItemModel>(
        stream: bloc.countryData,
        builder: (context, AsyncSnapshot<ItemModel> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.countryList.length,
              itemBuilder: (context, index) {
                // the below line of code is for debugging purpose
                print(
                    "HomScreen: ${snapshot.data!.countryList[index].countryName}");
                return ListTile(
                  title: Text(
                    snapshot.data!.countryList[index].countryName.toString(),
                  ),
                  subtitle: Text(
                    snapshot.data!.countryList[index].countryCode.toString(),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
