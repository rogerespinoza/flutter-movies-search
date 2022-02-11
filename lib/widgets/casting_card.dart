import 'package:flutter/material.dart';

class CastingCard extends StatelessWidget {
  const CastingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 40, top: 20),
        width: double.infinity,
        height: 180,
        // color: Colors.red,
        child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => const _CastCard()));
  }
}

class _CastCard extends StatelessWidget {
  const _CastCard({Key? key}) : super(key: key);

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
              child: const FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'),
                  image: NetworkImage('https://via.placeholder.com/150x300'),
                  width: 100,
                  height: 140,
                  fit: BoxFit.cover),
            ),
            const SizedBox(height: 5),
            const Text(
              'actor.name asdfsd sfssdffsfsd',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            )
          ],
        ));
  }
}
