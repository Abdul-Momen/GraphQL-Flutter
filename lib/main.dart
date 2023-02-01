import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'GraphqlConfig/graphql_provider.dart';
import 'Response/create_post.dart';
import 'Widget/create_post.dart';
import 'Widget/myhomepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  GraphqlClass graphqlClass = new GraphqlClass();

   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
        client: graphqlClass.client,
        child: GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
                  theme: ThemeData(
                    primarySwatch: Colors.red,
                  ),
                  home: MyHomePage()
              )

        );

  }

}




