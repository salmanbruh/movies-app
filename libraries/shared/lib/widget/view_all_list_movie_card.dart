import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movies_app/ui/launcher/app_config.dart';
import 'package:movies_list/domain/domain.dart';

class ViewAllListMovieCard extends StatelessWidget {
  final MovieEntity movie;
  const ViewAllListMovieCard({
    required this.movie,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: ImageSizeConstants.viewAllPosterHeight,
      child: Row(
        children: [
          _buildPoster(context),
          _buildMovieDetails(context),
        ],
      ),
    );
  }

  Widget _buildPoster(BuildContext context) => SizedBox(
        width: ImageSizeConstants.viewAllPosterWidth,
        height: ImageSizeConstants.viewAllPosterHeight,
        child: CachedNetworkImage(
          imageUrl: AppConfig.of(context).baseImageUrl +
              ImageSizeUrlConstants.baseViewAllPosterSizeUrl +
              movie.posterPath,
          imageBuilder: (context, imageProvider) => Container(
            width: ImageSizeConstants.viewAllPosterWidth,
            height: ImageSizeConstants.viewAllPosterHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      );

  Widget _buildMovieDetails(BuildContext context) => Expanded(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                style: Theme.of(context).textTheme.headline6,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(height: 8),
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
              ),
              const SizedBox(height: 8),
              Text(
                DateFormat("MMM dd, yyyy").format(
                  DateTime.parse(movie.releaseDate),
                ),
              ),
            ],
          ),
        ),
      );
}
