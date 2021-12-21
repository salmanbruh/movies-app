import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movies_app/ui/launcher/app_config.dart';
import 'package:movies_list/domain/domain.dart';

class HomePageMovieCard extends StatelessWidget {
  final MovieEntity movie;
  const HomePageMovieCard({
    required this.movie,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 154,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPosterImage(context, movie),
          const SizedBox(height: 8),
          _buildMovieTitle(context, movie),
          const SizedBox(height: 8),
          _buildMovieRating(context, movie),
        ],
      ),
    );
  }

  Widget _buildPosterImage(BuildContext context, MovieEntity movie) =>
      CachedNetworkImage(
        imageUrl: AppConfig.of(context).baseImageUrl +
            ImageSizeUrlConstants.baseHomePosterSizeUrl +
            movie.posterPath,
        imageBuilder: (context, imageProvider) => Container(
          width: double.parse(
              ImageSizeUrlConstants.baseHomePosterSizeUrl.substring(2)),
          height: 232,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        ),
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      );

  Widget _buildMovieTitle(BuildContext context, MovieEntity movie) => Flexible(
        child: Text(
          movie.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      );

  Widget _buildMovieRating(BuildContext context, MovieEntity movie) =>
      RatingBar.builder(
        initialRating: movie.voteAverage / 2,
        itemBuilder: (context, index) => const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (_) => {},
        itemSize: 18,
        ignoreGestures: true,
        allowHalfRating: true,
      );
}
