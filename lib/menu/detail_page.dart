import 'package:flutter/material.dart';
import 'package:projek/menu/review.dart';
import 'package:projek/model/filmModel.dart';


class DetailPage extends StatefulWidget {
  final Data? filmModel;
  const DetailPage({Key? key, required this.filmModel}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    String splice = "${widget.filmModel?.title}";
    String result = splice.substring(0, 4);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          (widget.filmModel?.title != null)
              ? "${widget.filmModel?.title} (${result})"
              : "${widget.filmModel?.title}",
          style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontWeight: FontWeight.w700),
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 6,
                            color: Colors.white12,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.network(
                            "${widget.filmModel?.images?.webp?.imageUrl}",
                            height: 132,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            (widget.filmModel?.type != null)
                                ? "Type: ${widget.filmModel?.type}"
                                : "",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.access_alarm_rounded,
                            color: Colors.black,
                            size: 20,
                          ),
                          Text(
                            (widget.filmModel?.duration) != null
                                ? "Duration: ${widget.filmModel?.duration}"
                                : "",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Poppins',
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star_half_sharp,
                            color: Colors.yellow,
                            size: 20,
                          ),
                          Text(
                            (widget.filmModel?.rating) != null
                                ? "Rating: ${widget.filmModel?.rating}"
                                : "",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Poppins',
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(width: 5),
                        ],
                      ),
                      SizedBox(height: 15),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.purple[200],
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              (widget.filmModel?.synopsis) != null
                                  ? "Synopsis:\n ${widget.filmModel?.synopsis}"
                                  : "",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => ReviewPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple[200],
                          onPrimary: Colors.white,
                        ),
                        child: Text('Review'),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
