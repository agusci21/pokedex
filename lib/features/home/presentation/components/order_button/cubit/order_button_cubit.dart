import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/features/home/presentation/components/order_button/presentation/settings_button.dart';

part 'order_button_state.dart';

class OrderButtonCubit extends Cubit<OrderButtonState> {
  OrderButtonCubit() : super(OrderButtonState(SettingsOptions.orderById));

  void onChanged(SettingsOptions newSetting) {
    emit(
      OrderButtonState(newSetting),
    );
  }
}
