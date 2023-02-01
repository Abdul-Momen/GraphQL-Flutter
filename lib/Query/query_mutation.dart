import 'package:gql/language.dart';

class PostQuery {
 static final getAllPost = parseString('''
query ( \$options: PageQueryOptions) {
  posts(options: \$options) {
    data {
      id
      title
    }
    meta {
      totalCount
    }
  }
}
  ''');

 static final createPost = parseString('''
mutation (\$input: CreatePostInput!) {
  createPost(input: \$input) {
    id
    title
    body
  }
}
  ''');

 static final login = parseString('''
mutation customerAccessTokenCreate(\$input: CustomerAccessTokenCreateInput!) {
  customerAccessTokenCreate(input: \$input) {
    customerUserErrors {
      code
      field
      message
    }
    customerAccessToken {
      accessToken
      expiresAt
    }
  }
}
  ''');



}
