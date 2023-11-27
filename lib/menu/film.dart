import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projek/helper/baseNetwork.dart';
import 'package:projek/menu/detail_page.dart';
import 'package:projek/model/filmModel.dart';

class FilmPage extends StatefulWidget {
  const FilmPage({super.key});

  @override
  State<FilmPage> createState() => _FilmPageState();
}

class _FilmPageState extends State<FilmPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Detective Conan",
            style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.purple[200],
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.all(8),
          child: FutureBuilder(
            future: BaseNetwork.get("film"),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasError) {
                return _buildErrorSection();
              }
              if (snapshot.hasData) {
                FilmModel filmModel = FilmModel.fromJson(snapshot.data);
                return _buildSuccessSection(filmModel);
              }
              return _buildLoadingSection();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildSuccessSection(FilmModel data) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: data.data?.length,
        itemBuilder: (BuildContext context, int index) {
          final Data? filmModel = data.data?[index];
          String splice = "${data.data?[index].title}";
          String result = splice.substring(0, 4);
          return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => DetailPage(filmModel: filmModel)));
              },
              child:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(padding: const EdgeInsets.only(top: 5)),
                      Container(
                        width: 100,
                        height: 132,
                        decoration: BoxDecoration(
                          border: Border.all( //<-- SEE HERE
                            width: 3,
                            color: Colors.black87,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.purple.withOpacity(0.25),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.network("${data.data?[index].images?.webp?.imageUrl}",height: 200,)
                        ),
                      ),

                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text((data.data?[index].title != null) ?
                        "${data.data?[index].title} (${result})"
                            : "${data.data?[index].title} (TBA)",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, color: Colors.black,fontFamily: 'Poppins'),textAlign: TextAlign.center,
                        ),
                      ),

                      SizedBox(
                        height: 2,
                      ),
                      Text("Rating : ${data.data?[index].rating}",
                        style: TextStyle(fontFamily: 'Poppins',fontSize: 12,color: Colors.black),
                        textAlign: TextAlign.center,),
                    ],
                  ),
                ),
              )
          );
        }
    );
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

}
