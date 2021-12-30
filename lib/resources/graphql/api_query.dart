// the code below is used to create a variable of type string to store the query that
// we need to perform on the api using the graphql
String query = r'''
query {
  continent(code: "AS"){
    countries{
      code
      name
    }
  }
}
''';
