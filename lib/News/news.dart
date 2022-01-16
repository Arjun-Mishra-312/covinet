import 'package:flutter/material.dart';
import 'package:covinet/News/model.dart';
import 'package:covinet/News/news_api.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<NewsApiModel>? newsList;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews().then((value) {
      setState(() {
        if (value.isNotEmpty) {
          newsList = value;
          isLoading = false;
        } else {
          print("List is Empty");
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Container(
                height: size.height / 12,
                width: size.width / 1.1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Covid-19 Related NEWS",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        //color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              isLoading
                  ? Container(
                      height: size.height / 20,
                      width: size.width / 20,
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: Container(
                        child: ListView.builder(
                          itemCount: newsList!.length,
                          itemBuilder: (context, index) {
                            return listItems(size, newsList![index]);
                          },
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget listItems(Size size, NewsApiModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
      child: GestureDetector(
        onTap: () async {
          var url = model.url;
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
        },
        child: Container(
          padding: EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              Container(
                // height: size.height / 2.8,
                width: size.width / 1.2,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1, color: Colors.black),
                  ),
                ),
                child: model.imageUrl != ""
                    ? Image.network(
                        model.imageUrl,
                        fit: BoxFit.contain,
                      )
                    : Text("Cant Load image"),
              ),
              Container(
                width: size.width / 1.2,
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  model.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                width: size.width / 1.2,
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  model.description,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
