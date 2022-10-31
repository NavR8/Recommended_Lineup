import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:recommended_lineup/players.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String position = "";
  Future<List<Players>> showPlayers() async {
    var data = await http.get(Uri.parse("https://api.spitch.live/contestants"));

    //print("Player: $data");
    print("Statuscode: ${data.statusCode}");
    //print("Club Name: ${data.body}");

    var dataDecoded = jsonDecode(data.body);
    print("Name of club: ${dataDecoded['clubs'][0]['short_name']}");
    print("Player_Last Name: ${dataDecoded['players'][0]['last_name']}");
    print("Player_Position: ${dataDecoded['players'][0]['position']}");
    print("Player_Avg Score: ${dataDecoded['players'][0]['avg_score']}");
    print("Player_Total Score: ${dataDecoded['players'][0]['total_score']}");
    print("Player_Image: ${dataDecoded['players'][0]['avatar_urls']['small']}");

    List<Players> playerData = [];
    dataDecoded.forEach((playerData) {
      playerData.add(Players(
          playerData["short_name"],
          playerData["avg_score"],
          playerData["position"],
          playerData["total_score"],
          playerData["small"],
          playerData["last_name"]));
    });
     return playerData;


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recommended Lineup"),
      ),
      body: FutureBuilder(
        future: showPlayers(),
        builder: (BuildContext context, AsyncSnapshot<List<Players>> snapshot) {
          //print("hasData:  + $snapshot.hasData");
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListView(
                    reverse: true,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: <Widget>[
                              Spacer(),
                              SizedBox(
                                width: 100,
                                child: Card(
                                    color: Colors.white54,
                                    child: Column(
                                      children: [
                                        Image(
                                          image: NetworkImage(
                                              snapshot.data![index].webImage),
                                        ),
                                        ListTile(
                                          title: Center(
                                            //child: Text(snapshot.data![index].short_name),
                                            child: Text(
                                                snapshot.data![index].lastName),
                                          ),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(snapshot
                                                  .data![index].position),
                                              Text(snapshot
                                                  .data![index].avgScore
                                                  .toString()),
                                              Text(snapshot
                                                  .data![index].totalScore
                                                  .toString())
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                              SizedBox(
                                width: 100,
                                child: Card(
                                    color: Colors.white54,
                                    child: Column(
                                      children: [
                                        const FlutterLogo(),
                                        ListTile(
                                          title: Center(
                                            child: Text("Name"),
                                          ),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text("Position"),
                                              Text("Avg-Score"),
                                              Text("Total-Score"),
                                            ],
                                          ),
                                        )
                                      ],
                                    )),
                              ),
                              SizedBox(
                                width: 100,
                                child: Card(
                                    color: Colors.white54,
                                    child: Column(
                                      children: [
                                        const FlutterLogo(),
                                        ListTile(
                                          title: const Center(
                                            child: Text("title"),
                                          ),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: const [
                                              Text("Subt1"),
                                              Text("Subt2"),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                              Spacer(),
                            ],
                          ),
                          //Row 2:
                          Row(
                            children: <Widget>[
                              Spacer(),
                              SizedBox(
                                width: 100,
                                child: Card(
                                    color: Colors.white54,
                                    child: Column(
                                      children: [
                                        const FlutterLogo(),
                                        ListTile(
                                          title: const Center(
                                            child: Text("title"),
                                          ),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: const [
                                              Text("Subt1"),
                                              Text("Subt2"),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                              SizedBox(
                                width: 100,
                                child: Card(
                                    color: Colors.white54,
                                    child: Column(
                                      children: [
                                        const FlutterLogo(),
                                        ListTile(
                                          title: const Center(
                                            child: Text("title"),
                                          ),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: const [
                                              Text("Subt1"),
                                              Text("Subt2"),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                              SizedBox(
                                width: 100,
                                child: Card(
                                    color: Colors.white54,
                                    child: Column(
                                      children: [
                                        const FlutterLogo(),
                                        ListTile(
                                          title: const Center(
                                            child: Text("title"),
                                          ),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: const [
                                              Text("Subt1"),
                                              Text("Subt2"),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                              SizedBox(
                                width: 100,
                                child: Card(
                                    color: Colors.white54,
                                    child: Column(
                                      children: [
                                        const FlutterLogo(),
                                        ListTile(
                                          title: const Center(
                                            child: Text("title"),
                                          ),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: const [
                                              Text("Subt1"),
                                              Text("Subt2"),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                              Spacer(),
                            ],
                          ),
                          //Row 3:
                          Row(
                            children: <Widget>[
                              Spacer(),
                              SizedBox(
                                width: 100,
                                child: Card(
                                    color: Colors.white54,
                                    child: Column(
                                      children: [
                                        const FlutterLogo(),
                                        ListTile(
                                          title: const Center(
                                            child: Text("title"),
                                          ),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: const [
                                              Text("Subt1"),
                                              Text("Subt2"),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                              SizedBox(
                                width: 100,
                                child: Card(
                                    color: Colors.white54,
                                    child: Column(
                                      children: [
                                        const FlutterLogo(),
                                        ListTile(
                                          title: const Center(
                                            child: Text("title"),
                                          ),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: const [
                                              Text("Subt1"),
                                              Text("Subt2"),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                              SizedBox(
                                width: 100,
                                child: Card(
                                    color: Colors.white54,
                                    child: Column(
                                      children: [
                                        const FlutterLogo(),
                                        ListTile(
                                          title: const Center(
                                            child: Text("title"),
                                          ),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: const [
                                              Text("Subt1"),
                                              Text("Subt2"),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                              Spacer(),
                            ],
                          ),
                          //Row4-Goalkeeper:
                          Row(
                            children: <Widget>[
                              Spacer(),
                              SizedBox(
                                width: 100,
                                child: Card(
                                    color: Colors.white54,
                                    child: Column(
                                      children: [
                                        const FlutterLogo(),
                                        ListTile(
                                          title: const Center(
                                            child: Text("title"),
                                          ),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: const [
                                              Text("Subt1"),
                                              Text("Subt2"),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                              Spacer(),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
