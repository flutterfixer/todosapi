import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todosapi/data_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  DataModel ? mTodos;

  @override
  void initState() {

    super.initState();
    getTodos();
  }


  @override
  Widget build(BuildContext context) {
    print(mTodos);
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
      ),
      body: mTodos!= null?
      mTodos!.todos!.isNotEmpty ? ListView.builder(
        itemCount: mTodos!.todos!.length,
          itemBuilder: (_, index){

          return  ListTile(
            title: Text('${mTodos!.todos![index].completed}'),
            subtitle: Text('${mTodos!.todos![index].todo}'),
          );
        }): Center(child: Text("No quotes find "),)
         : Center(child: CircularProgressIndicator(),),
    );
  }

  void getTodos() async{

    String url ="https://dummyjson.com/todos";
    var response = await http.get(Uri.parse(url));


    if(response.statusCode == 200){

    var mData =  response.body;
    var rawData = jsonDecode(mData);

     mTodos = DataModel.fromJson(rawData);


     setState(() {

     });

    }


  }
}

