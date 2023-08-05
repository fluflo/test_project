import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final currentTimeStreamProvider = StreamProvider<String>((ref) {
  return Stream.periodic(const Duration(seconds: 1), (count) {
    final currentTime = DateFormat('HH:mm:ss').format(DateTime.now());
    return currentTime;
  });
});


class CurrentTimeComponent extends ConsumerWidget {
  const CurrentTimeComponent({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTimeStream = ref.watch(currentTimeStreamProvider);

    return Container(
      color: Colors.black,
      child: currentTimeStream.when(
          data: (currentTime) {
            return Text(
              currentTime,
              style: const TextStyle(color: Colors.white, fontFamily: 'UtilityOT', fontSize: 9.0),
            );
          },
          loading: () {
            return const CircularProgressIndicator();
          },
          error: (error, stackTrace) {
            return Text('Error fetching time: $error');
          },
        ),


    );
  }
}

extension TimeOfDayConverter on TimeOfDay {
  String to24hours() {
    final hour = this.hour.toString().padLeft(2, "0");
    final min = this.minute.toString().padLeft(2, "0");
    return "$hour:$min";
  }
}