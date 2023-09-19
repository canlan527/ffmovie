import 'package:ffmovie/movies/movie.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final Movie? movie;
  final List<Movie>? allMovie;

  Detail({
    required this.movie,
    required this.allMovie,
  });

  @override
  Widget build(BuildContext context) {
    final closeButton = MaterialButton(
      onPressed: () {
        Navigator.maybePop(context);
      },
      color: Colors.black26,
      padding: EdgeInsets.all(4),
      shape: CircleBorder(),
      elevation: 0,
      child: const Icon(
        Icons.close,
        size: 24,
        color: Colors.white60,
      ),
    );

    final posterShow = Stack(
      children: [
        Image.network(
          movie!.poster!,
          fit:BoxFit.cover,
        ),
        Positioned(
          right: 0,
          top: 32,
          child: closeButton
        ),
      ]
    );

    final movieTags = Container(
      padding: EdgeInsets.all(16),
      // child: MovieTag(tags: movie!.actors!),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('类型: ${movie!.genre!}', style: TextStyle(fontSize: 16),),
          SizedBox(height: 16,),
          Text('语言: ${movie!.language!}', style: TextStyle(fontSize: 16),),
          SizedBox(height: 16,),
          Text('上映时间: ${movie!.dateReleased!}', style: TextStyle(fontSize: 16),),
          SizedBox(height: 16,),
          Text('国家/地区: ${movie!.country!}', style: TextStyle(fontSize: 16),),
          SizedBox(height: 16,),
          Text('导演:', style: TextStyle(fontSize: 16),),
          Chip(label: Text(movie!.director!)),
          Text('编剧:', style: TextStyle(fontSize: 16),),
          Chip(label: Text(movie!.writer!)),
          SizedBox(height: 16,),
          Text('演员表:', style: TextStyle(fontSize: 16),),
          Wrap(
            spacing: 6,
            runSpacing: 5,
            children: movie!.actors!.map((actor) {
              return Chip(label: Text(actor));
            }).toList(), 
          ),
        ],
      )
    );

    final movieInfo = Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(movie!.name!, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 8,),
          Text(movie!.description!, style: TextStyle(color: Colors.grey, fontSize: 13)),
        ],
      )
    );

    final movieInfoAdd = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Icon(Icons.star_rate_rounded, color: Colors.amberAccent[400],size: 56,),
              SizedBox(height: 8,),
              Text('评分：${movie!.doubanRating!}', style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),)
            ],
          ),
          Column(
            children: [
              Icon(Icons.local_fire_department_rounded, color: Colors.red[400], size: 56,),
              SizedBox(height: 8,),
              Text('热度：${movie!.doubanVotes!.toString()}' , style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),)
            ],
          )
        ],
      ),
    );
    
    final divider = Divider(
      height: 16,
      thickness: 1,
      indent: 16,
      endIndent: 16,
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              posterShow,
              movieInfo,
              divider,
              movieInfoAdd,
              movieTags,
            ],
          ),
        ),
      )
    );
  }
}