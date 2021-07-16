import 'dart:convert';
import 'package:app_movie_theater/models/models.dart';

class PopularResponse {
    PopularResponse({
        this.page,
        this.results,
        this.totalPages,
        this.totalResults,
    });

    int page;
    List<Movie> results;
    int totalPages;
    int totalResults;

    factory PopularResponse.fromJson(String str) => PopularResponse.fromMap(json.decode(str));

    factory PopularResponse.fromMap(Map<String, dynamic> json) => PopularResponse(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

}