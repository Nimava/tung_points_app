import 'package:shared_preferences/shared_preferences.dart';

class FavoritesService {
  static const _key = 'favorite_points';

  /// Get all favorite point numbers
  static Future<Set<String>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key)?.toSet() ?? {};
  }

  /// Check if a point is favorite
  static Future<bool> isFavorite(String pointNumber) async {
    final favorites = await getFavorites();
    return favorites.contains(pointNumber);
  }

  /// Add a point to favorites
  static Future<void> addFavorite(String pointNumber) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavorites();
    favorites.add(pointNumber);
    await prefs.setStringList(_key, favorites.toList());
  }

  /// Remove a point from favorites
  static Future<void> removeFavorite(String pointNumber) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavorites();
    favorites.remove(pointNumber);
    await prefs.setStringList(_key, favorites.toList());
  }

  /// Toggle favorite state
  static Future<void> toggle(String pointNumber) async {
    final isFav = await isFavorite(pointNumber);
    if (isFav) {
      await removeFavorite(pointNumber);
    } else {
      await addFavorite(pointNumber);
    }
  }
}
