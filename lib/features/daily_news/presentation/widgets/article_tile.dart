import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_bloc_news/features/daily_news/domain/entities/article_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleTile extends StatelessWidget {
  final ArticleEntity articleEntity;

  const ArticleTile({super.key, required this.articleEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 2.2,
      padding: const EdgeInsetsDirectional.only(start: 14, end: 14, bottom: 7, top: 7),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: articleEntity.urlToImage!,
            imageBuilder: (context, imageProvider) {
              return Padding(
                padding: const EdgeInsetsDirectional.only(end: 14),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.08),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                ),
              );
            },
            progressIndicatorBuilder: (context, url, progress) {
              return Padding(
                padding: const EdgeInsetsDirectional.only(end: 14),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.08),
                    ),
                    child: const CupertinoActivityIndicator(),
                  ),
                ),
              );
            },
            errorWidget: (context, url, error) {
              return Padding(
                padding: const EdgeInsetsDirectional.only(end: 14),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.08),
                    ),
                    child: const Icon(Icons.error),
                  ),
                ),
              );
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    articleEntity.title ?? '',
                    maxLines : 3,
                    overflow : TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: 'Butler',
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),

                  // Description
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        articleEntity.desc ?? '',
                        maxLines : 2,
                      ),
                    ),
                  ),

                  // Datetime
                  Row(
                    children: [
                      const Icon(Icons.timeline_outlined, size: 16),
                      const SizedBox(width: 4),
                        Text(
                          articleEntity.publishedAt!,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}