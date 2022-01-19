import 'package:flutter/material.dart';
import 'package:news_apps_19710061/splashscreen.dart';
import 'package:news_apps_19710061/components/customListTile.dart';
import 'package:news_apps_19710061/model/article_model.dart';
import 'package:news_apps_19710061/services/api_service.dart';
import 'package:news_apps_19710061/services/navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        'HalamanPertama': (BuildContext context) => new HalamanPertama(),
        'otomotif': (BuildContext context) => new berita_otomotif(),
        'olahraga': (BuildContext context) => new berita_olahraga(),
        'profile': (BuildContext context) => new profile(),
      },
    );
  }
}

class berita_otomotif extends StatelessWidget {
  ApiService_Otomotif client = ApiService_Otomotif();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Berita Otomotif", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.lightBlueAccent),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article> articles = snapshot.data;
            return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) =>
                    customListTile(articles[index], context));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class berita_olahraga extends StatelessWidget {
  ApiService_Sports client = ApiService_Sports();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Berita Olahraga", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.lightBlueAccent),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article> articles = snapshot.data;
            return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) =>
                    customListTile(articles[index], context));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Profile", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.lightBlueAccent),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 55.0,
            backgroundImage: AssetImage('assets/profile.jpg'),
          ),
          SizedBox(
            height: 30.0,
            width: 150.0,
            child: Divider(
              color: Colors.blue[300],
            ),
          ),
          Text(
            "HIZKIA AJIDAN",
            style: TextStyle(
              fontFamily: 'BebasNeue',
              color: Colors.blue[300],
              fontSize: 25,
            ),
          ),
          Text(
            "FLUTTER DEVELOVER",
            style: TextStyle(
              color: Colors.blue[200],
              fontSize: 20,
              letterSpacing: 2.5,
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            color: Colors.white,
            child: ListTile(
              leading: Icon(
                Icons.insert_drive_file_outlined,
                color: Colors.blue,
              ),
              title: Text(
                "NPM : 19710061",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
            color: Colors.white,
            child: ListTile(
              leading: Icon(
                Icons.home_filled,
                color: Colors.blue,
              ),
              title: Text(
                "5A SI REG PAGI BJB",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
            color: Colors.white,
            child: ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.blue,
              ),
              title: Text(
                "Alamat :Jl. Mistar Cokrokusumo Rt. 37 Rw. 001",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
            color: Colors.white,
            child: ListTile(
              leading: Icon(
                Icons.date_range_sharp,
                color: Colors.blue,
              ),
              title: Text(
                "TTL : Cempaka, 04 - 10 - 2000",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
            color: Colors.white,
            child: ListTile(
              leading: Icon(
                Icons.contact_page,
                color: Colors.blue,
              ),
              title: Text(
                "CONTACT :+62 822-6244-8722",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
