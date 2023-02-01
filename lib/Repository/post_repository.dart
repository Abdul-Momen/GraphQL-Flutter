import 'dart:convert';
import 'dart:io';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:untitled2/HelperUtils/global_constant.dart';
import 'package:untitled2/Query/query_mutation.dart';
import 'package:untitled2/Response/post_response.dart';

import '../GraphqlConfig/graphql_provider.dart';
import '../Response/create_post.dart';


abstract class IPostRepository {
  Future<PostResponseData> getAllPost(int page,int pageLimit);
  Future<CreateResponseData> createPost(String title);

}

class PostRepository implements IPostRepository {

  @override
  Future<PostResponseData> getAllPost(int page,int pageLimit) async {
    var responsedata;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery();
    final MutationOptions options =
        MutationOptions(document: PostQuery.getAllPost,  // call the query
            variables:  {
              "options": {
                "paginate": {
                  "page": page,
                  "limit": pageLimit
                }
              }
            }
        );
    final QueryResult result = await client.mutate(options);

    print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
      print(responseDetails);
      responsedata = PostResponseData.fromJson(responseDetails);
    }

    return responsedata;
  }

  @override
  Future<CreateResponseData> createPost(String title) async {
    var responsedata;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery();
    final MutationOptions options =
        MutationOptions(document: PostQuery.createPost,  // call the query
            variables: {
              "input": {
                "title": title,
                "body": "Some interesting content."
              }
            }
        );
    final QueryResult result = await client.mutate(options);

    print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
      print(responseDetails);
      responsedata = CreateResponseData.fromJson(responseDetails);
    }

    return responsedata;
  }


}
