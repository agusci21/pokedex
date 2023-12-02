import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/application/localizations/i18n.dart';
import 'package:flutter_template/features/home/presentation/components/order_button/cubit/order_button_cubit.dart';

class SettingsButton extends StatelessWidget {
  final OrderButtonCubit cubit;
  final void Function(SettingsOptions optionSelected) onChanged;

  const SettingsButton({
    required this.cubit,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .12,
      height: MediaQuery.of(context).size.width * .12,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () async {
          final result = await _showAlertDialog(context);
          if (result != null) {
            onChanged(result);
          }
        },
        icon: const Icon(
          Icons.settings,
          size: 30,
        ),
        color: Colors.grey,
      ),
    );
  }

  Future<SettingsOptions?> _showAlertDialog(BuildContext context) async {
    return await showDialog<SettingsOptions?>(
      context: context,
      builder: (context) => BlocConsumer<OrderButtonCubit, OrderButtonState>(
        listener: (context, state) {
          Navigator.pop(context, state.selectedSettings);
        },
        bloc: cubit,
        builder: (context, state) {
          return AlertDialog(
            title: Text(
              I18n.of(context).translate('change_order'),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RadioListTile<SettingsOptions>(
                  title: Text(I18n.of(context).translate('order_by_id')),
                  value: SettingsOptions.orderById,
                  groupValue: state.selectedSettings,
                  onChanged: (value) {
                    if (value != null) {
                      cubit.onChanged(value);
                    }
                  },
                ),
                RadioListTile<SettingsOptions>(
                  title: Text(I18n.of(context).translate('order_by_name')),
                  value: SettingsOptions.orderByName,
                  groupValue: state.selectedSettings,
                  onChanged: (value) {
                    if (value != null) {
                      cubit.onChanged(value);
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

enum SettingsOptions {
  orderByName,
  orderById,
}
