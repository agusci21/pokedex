import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/features/home/presentation/components/home_layout/cubit/home_layout_cubit.dart';
import 'package:flutter_template/features/home/presentation/components/order_button/cubit/order_button_cubit.dart';
import 'package:flutter_template/features/home/presentation/widgets/pokemon_grid.dart';
import 'package:flutter_template/features/home/presentation/widgets/pokemon_search_bar.dart';
import 'package:flutter_template/features/home/presentation/components/order_button/presentation/settings_button.dart';
import 'package:flutter_template/infrastructure/ioc_manager.dart';

class HomeLayout extends StatelessWidget {
  final HomeLayoutCubit _cubit;
  const HomeLayout({
    required HomeLayoutCubit cubit,
    super.key,
  }) : _cubit = cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
      bloc: _cubit..getInitialsPokemons(),
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                PokemonSearchBar(
                  onChanged: (value) {
                    _cubit.onSearch(value);
                  },
                ),
                SettingsButton(
                  cubit: IocManager.instance.resolve<OrderButtonCubit>(),
                  onChanged: (optionSelected) {
                    _cubit.orderBy(optionSelected);
                  },
                ),
              ],
            ),
            _buildByState(context, state)
          ],
        );
      },
    );
  }

  Widget _buildByState(BuildContext context, HomeLayoutState state) {
    if (state is Loaded) {
      return PokemonGrid(
        pokemons: state.pokemons,
        isLoading: state.isLoadingMore,
        shouldLoadMore: () async {
          await _cubit.loadMore();
        },
      );
    }
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
