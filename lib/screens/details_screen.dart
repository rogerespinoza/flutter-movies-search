import 'package:flutter/material.dart';
import 'package:peliculas/theme/app_theme.dart';
import 'package:peliculas/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const _CustomAppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            const _PosterAndTitle(),
            const _Overview(),
            const _Overview(),
            const _Overview(),
            const CastingCard()
          ]))
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppTheme.primary,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
            padding: const EdgeInsets.only(bottom: 12),
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            color: Colors.black12,
            child: const Text(
              'movie.title',
              style: TextStyle(fontSize: 20),
            )),
        background: const FadeInImage(
          image: NetworkImage('https://via.placeholder.com/500x300'),
          placeholder: AssetImage('assets/loading.gif'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      // color: Colors.red,
      height: 170,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              image: NetworkImage('https://via.placeholder.com/200x300'),
              placeholder: AssetImage('assets/no-image.jpg'),
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'movie.title',
                    style: textTheme.headline5,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(
                    'movie.originalTitle',
                    style: textTheme.subtitle1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star_outline,
                        size: 15,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text('movie.voteAverage', style: textTheme.caption),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        'Fugiat et laboris voluptate aliqua id sunt aliquip eu culpa. Eu do quis magna eu minim aliquip laborum. Duis exercitation excepteur eiusmod exercitation culpa reprehenderit sunt consequat adipisicing ipsum amet fugiat. Pariatur irure cupidatat ex ullamco qui reprehenderit elit nulla proident est duis velit aliqua irure. Esse dolore labore dolor qui ea nulla officia adipisicing ut aute fugiat.',
        textAlign: TextAlign.left,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
