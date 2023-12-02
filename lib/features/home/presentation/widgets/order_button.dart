import 'package:flutter/material.dart';
import 'package:flutter_template/abstractions/i_navigation.dart';
import 'package:flutter_template/application/localizations/i18n.dart';
import 'package:flutter_template/infrastructure/ioc_manager.dart';

class OrderButton extends StatelessWidget {
  final void Function(OrderOption optionSelected) onChanged;

  const OrderButton({
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

  Future<OrderOption?> _showAlertDialog(BuildContext context) async {
    return await showDialog<OrderOption?>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          I18n.of(context).translate('change_order'),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              child: Text(
                I18n.of(context).translate('order_by_id'),
              ),
              onPressed: () {
                onChanged(OrderOption.orderById);
                IocManager.instance.resolve<INavigation>().pop(context);
              },
            ),
            TextButton(
              child: Text(
                I18n.of(context).translate('order_by_name'),
              ),
              onPressed: () {
                onChanged(OrderOption.orderByName);
                IocManager.instance.resolve<INavigation>().pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

enum OrderOption {
  orderByName,
  orderById,
}
