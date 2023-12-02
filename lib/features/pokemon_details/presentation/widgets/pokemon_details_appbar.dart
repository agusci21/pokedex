import 'package:flutter/material.dart';
import 'package:flutter_template/abstractions/i_navigation.dart';
import 'package:flutter_template/core/extensions/string_helpers.dart';
import 'package:flutter_template/infrastructure/ioc_manager.dart';

class PokemonDetailsAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  final String pokemonName;
  const PokemonDetailsAppbar({
    required this.pokemonName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
        ),
        onPressed: () {
          IocManager.instance.resolve<INavigation>().pop(context);
        },
      ),
      title: Text(
        pokemonName.capitalizeFirst(),
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
