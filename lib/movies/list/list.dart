import 'dart:convert';

import 'package:ffmovie/movies/detail/detail.dart';
import 'package:ffmovie/movies/movie.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  bool isLoading = true;

  Future<List<Movie>> getMovies() async {
    String data = await DefaultAssetBundle.of(context).loadString('assets/json/movies.json');
    List m = jsonDecode(data);
    List<Movie> jsonResult = m.map((item) => Movie.fromJson(item)).toList();
    return jsonResult;
  }
  
  @override
  void initState() {
    getMovies().then((data){
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Movie>>(
        future: getMovies(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            List<Movie>? movie = snapshot.data;
            return ListView.builder(
              itemCount: movie!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap:() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Detail(movie: movie[index], allMovie:movie)));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: 180,
                        margin: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12),
                          image: isLoading ? null : DecorationImage(
                            image: NetworkImage(movie[index].poster!),
                            fit: BoxFit.cover,
                          ),

                        ),
                        child: isLoading
                        ? Center(
                            child: CircularProgressIndicator(), // 显示加载中的图标
                          )
                        : null,
                      ),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(movie[index].name!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                              ],
                            ),
                            SizedBox(height: 20,),
                            
                            Row(
                              children: [
                                Text(movie[index].actors![0], style: TextStyle(color: Colors.grey, fontSize: 14),),
                                SizedBox(width: 8,),
                                Text(movie[index].actors![1], style: TextStyle(color: Colors.grey, fontSize: 14),)
                              ],
                            ),
                            SizedBox(height: 8,),
                            Wrap(
                              children: [
                                Text(movie[index].genre!, style: TextStyle(color: Colors.grey, fontSize: 14),),
                              ],
                            ),

                            SizedBox(height: 8,),
                            Row(
                              children: [
                                Text(movie[index].country!, style: TextStyle(color: Colors.grey, fontSize: 14),),
                              ],
                            ),
                            SizedBox(height: 8,),
                            Row(
                              children: [
                                Icon(Icons.local_fire_department_rounded, color: Colors.red[400],),
                                Text(movie[index].doubanVotes!.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
                              ],
                            ),
                                            
                          ],
                         
                        ),
                      ),
                      // Divider(color: Colors.grey,)
                    ],
                  ),
                );
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}