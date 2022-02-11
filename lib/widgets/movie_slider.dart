import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';

class MovieSlider extends StatelessWidget {
  final List<Movie> movies;
  final String? title;

  const MovieSlider({Key? key, required this.movies, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) {
      return const SizedBox(
        width: double.infinity,
        height: 290,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return SizedBox(
        width: double.infinity,
        height: 290,
        // color: Colors.red,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          if (title != null)
            Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 15, top: 15),
                child: Text(title!,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold))),
          Expanded(
              child: ListView.builder(
            itemCount: movies.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final image = movies[index].fullPosterImg;
              final title = movies[index].title;
              return _MoviePoster(
                image: image,
                title: title,
              );
            },
          ))
        ]));
  }
}

class _MoviePoster extends StatelessWidget {
  // final int index;
  // final Map<String, dynamic> movie;
  final String image;
  final String title;
  const _MoviePoster({Key? key, required this.image, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      // color: Colors.green,
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: 'movie'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(image),
                  width: 130,
                  height: 190,
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            // style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
          )
        ],
      ),
    );
  }
}
