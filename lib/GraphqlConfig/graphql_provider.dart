import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:untitled2/HelperUtils/global_constant.dart';

class GraphqlClass{

  //you check this website for graphql test
  //https://graphqlzero.almansi.me/#example-top

static HttpLink linkr = HttpLink("https://graphqlzero.almansi.me/api");

/*  static Link getLink() {
    print("token calling");

    final AuthLink authLink = AuthLink(
        headerKey: 'Authorization',
        getToken: () async {
          final token = await HelperUtils.getToken(); // token get via shared preference
          print(token.toString());
          return 'Bearer $token'; }
    );

    print("token calling${authLink.requestTransformer.toString()}");
    return linkr = authLink.concat(httpLink);
  }*/


  ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
    GraphQLClient(
      cache: GraphQLCache(store: InMemoryStore()),
      link: linkr,  // here if you have bearer token token then use this function 'getLink()' otherwise linkr
    ),
  );

  GraphQLClient clientToQuery()
  {
    // here if you have bearer token token then use this function 'getLink()' otherwise linkr
    return GraphQLClient(link: linkr, cache:GraphQLCache(store: InMemoryStore()),
    );
  }
}