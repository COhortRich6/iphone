// req.query({
// 	"limit": "24",
// 	"start": "0"
// });

// req.headers({
// 	"X-RapidAPI-Key": "34ebea3060msh709fc1f411b9fd7p16f469jsne6c3f4b1bb56",
// 	"X-RapidAPI-Host": "yummly2.p.rapidapi.com",
// 	"useQueryString": true
//  });

import 'dart:convert';

import '../widegets/recipe.dart';
import 'package:http/http.dart' as http;
class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https(
      "yummly2.p.rapidapi.com", '/feeds/list', {
      "limit": "24", "start": "0", "tag": "list.recipe.popular"}
      );

      final response = await http.get(uri, headers: {
        "X-RapidAPI-Key": "34ebea3060msh709fc1f411b9fd7p16f469jsne6c3f4b1bb56",
 	      "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
        	"useQueryString": "true",
      });
  
    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapshot(_temp); 
  }
}