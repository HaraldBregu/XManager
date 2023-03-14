import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_cubit.dart';
import 'counter_state.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state){
              return Text(
                  state.counterValue.toString()
              );
            },
          )
      ),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state){
          if (state.wasIncremented) {
            print("was incremented");
          }
        },
        child: Container(
          child: Text("page example"),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          BlocProvider.of<CounterCubit>(context).increment();
        },
        backgroundColor: Colors.green,
        icon: const Icon(Icons.play_circle),
        label: const Text('AVVIA PROGRAMMA'),
      ),
    );
  }
}
