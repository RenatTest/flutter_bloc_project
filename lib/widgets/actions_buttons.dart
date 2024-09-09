import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/user_cubit.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final UserCubit userCubit = context.read<UserCubit>();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {
            userCubit.fetchUsers();
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          child: const Text("Load"),
        ),
        const SizedBox(
          width: 8.0,
        ),
        ElevatedButton(
          onPressed: () {
            userCubit.clearUsers();
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: const Text("Clear"),
        ),
      ],
    );
  }
}
