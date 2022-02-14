import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:provider/provider.dart';
// import 'package:peliculas/providers/movies_provider.dart';

class CastingCard extends StatelessWidget {
  final int movieId;

  const CastingCard(
    this.movieId, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.getMoviesCast(movieId),
      builder: (_, AsyncSnapshot<List<Cast>> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox(
            height: 180,
            child: Center(
              child: FittedBox(
                  fit: BoxFit.contain, child: CircularProgressIndicator()),
            ),
          );
        }

        final List<Cast> cast = snapshot.data!;
        return Container(
            margin: const EdgeInsets.only(bottom: 40, top: 20),
            width: double.infinity,
            height: 180,
            child: ListView.builder(
                itemCount: cast.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) => _CastCard(
                      actor: cast[index],
                    )));
      },
    );

    // return Container(
    //     margin: const EdgeInsets.only(bottom: 40, top: 20),
    //     width: double.infinity,
    //     height: 180,
    //     // color: Colors.red,
    //     child: ListView.builder(
    //         itemCount: 10,
    //         scrollDirection: Axis.horizontal,
    //         itemBuilder: (context, index) => const _CastCard()));
  }
}

class _CastCard extends StatelessWidget {
  final Cast actor;
  const _CastCard({Key? key, required this.actor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: 110,
        height: 100,
        // color: Colors.green,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(actor.fullProfilePath),
                  width: 100,
                  height: 140,
                  fit: BoxFit.cover),
            ),
            const SizedBox(height: 5),
            Text(
              actor.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            )
          ],
        ));
  }
}
