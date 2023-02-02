import 'package:flutter/material.dart';



class VersesPage extends StatefulWidget {
  const VersesPage({Key? key}) : super(key: key);

  @override
  State<VersesPage> createState() => _VersesPageState();
}

class _VersesPageState extends State<VersesPage> {
  @override
  Widget build(BuildContext context) {

    Map<String , dynamic> versesnum = ModalRoute.of(context)!.settings.arguments as Map<String , dynamic>;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("Chapter  ${versesnum['chapter_number']}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ...versesnum['all']
                .map(
                  (e) => Padding(
                padding: const EdgeInsets.only(
                    right: 15, left: 15, top: 10, bottom: 10),
                child: GestureDetector(
                  onTap: () {
                   setState(() {
                     Navigator.pushNamed(context, 'DetailPage',
                         arguments: e);
                   });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width,
                    decoration:  BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Verse ${e['verse_number']}",
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
                .toList(),
          ],
        ),
      ),
    );
  }
}
