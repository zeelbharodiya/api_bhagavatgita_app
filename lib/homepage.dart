import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List finalResult = [];

  fetchData() async {
    // String baseUrl = "https://github.com/gita";
    // String endpoint = "/gita/data/chapters.json";
    //
    // String api = baseUrl + endpoint;

    // http.Response res = await http.get(Uri.parse(api));

    // if(res.statusCode == 200){
    //   List decodedData = jsonDecode(res.body);

    String jsonData = await rootBundle.loadString("assets/json/data.json");

    List decodedData = jsonDecode(jsonData);

    setState(() {
      finalResult = decodedData;
    });
    // print(decodedData['id']);
    // print(decodedData['userId']);
    // print(decodedData['title']);
    // print(decodedData['body']);

    log("$decodedData");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: finalResult.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            // SizedBox(height: 50,),
            GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.pushNamed(context, 'VersesPage' , arguments: finalResult[index]);
                });
              },
              child: Card(
                elevation: 3,
                shadowColor: Colors.pink,
                child: ListTile(
                  // title: Text("${finalResult[index]['chapter_summary']}"),
                  subtitle: Container(
                    height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        // color: Colors.green,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(2, 2),
                            blurRadius: 12,
                            color: Color.fromRGBO(0, 10, 0, 0.16),
                          )
                        ],
                      ),
                      child: Text("Chapter  ${finalResult[index]['chapter_number']}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.pink),)),
                ),
              ),
            ),
          ],
        );
      },
    ));
  }
}
