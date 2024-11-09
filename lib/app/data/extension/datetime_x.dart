import 'package:shadcn_ui/shadcn_ui.dart';

extension DatetimeX on DateTime {
  String get simpleDateFormat {
    // Friday, March 22, 2024
    return DateFormat("E, MMM d, y", 'ko_kr').format(this);
  }
}
