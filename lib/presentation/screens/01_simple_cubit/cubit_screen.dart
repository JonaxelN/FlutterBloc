import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitScreen extends StatelessWidget {
  const CubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userNameCubit = context.watch<UsernameCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit'),
      ),
      body: Center(
        child: BlocBuilder<UsernameCubit, String>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            print('Cambió');
            return Text(state);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context
              .read<UsernameCubit>()
              .setUsername(RandomGenerator.getRandomName());
        },
        child: const Icon(Icons.refresh),
      ),
      //* Esto es una manera de hacerlo, sólo que se redibujaría todo
      // body: Center(
      //   child: Text(userNameCubit.state),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     userNameCubit.setUsername(RandomGenerator.getRandomName());
      //   },
      //   child: Icon(Icons.refresh),
      // ),
    );
  }
}
