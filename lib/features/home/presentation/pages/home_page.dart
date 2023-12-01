import 'package:flutter/material.dart';
import 'package:flutter_template/features/home/presentation/components/home_layout/cubit/home_layout_cubit.dart';
import 'package:flutter_template/features/home/presentation/components/home_layout/presentation/home_layout.dart';
import 'package:flutter_template/features/home/presentation/widgets/home_appbar.dart';
import 'package:flutter_template/infrastructure/ioc_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppbar(),
      body: HomeLayout(
        cubit: IocManager.instance.resolve<HomeLayoutCubit>(),
      ),
    );
  }
}
