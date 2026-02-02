import 'package:flutter/material.dart';
import '../services/favorites_service.dart';

class FavoriteButton extends StatefulWidget {
  final String pointNumber;

  const FavoriteButton({
    super.key,
    required this.pointNumber,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final fav = await FavoritesService.isFavorite(widget.pointNumber);
    setState(() => _isFavorite = fav);
  }

  Future<void> _toggle() async {
    await FavoritesService.toggle(widget.pointNumber);
    setState(() => _isFavorite = !_isFavorite);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isFavorite ? Icons.favorite : Icons.favorite_border,
        color: _isFavorite ? Colors.red : null,
      ),
      onPressed: _toggle,
      tooltip: 'Favorite',
    );
  }
}
