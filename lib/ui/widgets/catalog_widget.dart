import 'package:flutter/material.dart';
import 'package:flutter_course/domain/entities/catalog_anime.dart';

class CatalogWidget extends StatelessWidget {
  final Anime anime;
  final bool isLiked;
  final VoidCallback onLikeTap;

  const CatalogWidget({
    super.key,
    required this.anime,
    required this.isLiked,
    required this.onLikeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            spacing: 10,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 130,
                    height: 170,
                    child: Image.asset(anime.picture, fit: BoxFit.fill),
                  ),
                  Positioned(
                    right: 7,
                    top: 7,
                    child: SizedBox(
                      height: 30,
                      width: 30,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: CircleBorder(),
                          backgroundColor: Colors.white,
                          elevation: 0,
                        ),
                        onPressed: onLikeTap,
                        child: Icon(
                          isLiked ? Icons.favorite : Icons.favorite_border,
                          size: 18,
                          color: isLiked ? Colors.red : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      anime.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Text(
                      anime.episode,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 156, 154, 154),
                      ),
                    ),
                    Wrap(
                      runSpacing: 4,
                      spacing: 5,
                      children: [
                        for (final title in anime.collection)
                          Container(
                            height: 25,
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 82, 238, 162),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color.fromARGB(255, 8, 157, 73),
                                width: 2,
                              ),
                            ),
                            child: Text(title),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
