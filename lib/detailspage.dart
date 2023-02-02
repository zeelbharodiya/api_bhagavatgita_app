import 'package:flutter/material.dart';



class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {

    Map<String , dynamic> detail = ModalRoute.of(context)!.settings.arguments as Map<String , dynamic>;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("Verse ${detail['verse_number']}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
      ),
      body: Column(
        children: [
          SizedBox(height: 200,),
          Padding(
            padding: const EdgeInsets.only(left: 50,right: 50),
            child: Container(
              height: 115,
              width: 300,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${detail['text']}"),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(left: 50,right: 50),
            child: Container(
              height: 150,
              width: 300,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${detail['transliteration']}"),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
