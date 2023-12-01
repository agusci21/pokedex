import 'package:flutter/material.dart';
import 'package:flutter_template/core/entities/summarized_pokemon.dart';
import 'package:flutter_template/core/extensions/string_helpers.dart';

class PokemonCard extends StatefulWidget {
  final SummarizedPokemon pokemon;
  final Duration duration;
  const PokemonCard({
    required this.pokemon,
    this.duration = const Duration(milliseconds: 600),
    super.key,
  });

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    animation = Tween<double>(begin: 150, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
    _controller.forward();
  }

  @override
  void didUpdateWidget(PokemonCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.duration = widget.duration;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(animation.value, 0),
          child: child,
        );
      },
      animation: animation,
      child: Card(
        child: ListTile(
          title: Text(widget.pokemon.url.getIdFromUrl('pokemon') ?? ''),
          subtitle: Text(widget.pokemon.name.capitalizeFirst()),
          onTap: () {},
        ),
      ),
    );
  }
}
