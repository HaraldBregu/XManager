import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/presentation/bloc/bloc.dart';

class ServiceList extends StatelessWidget {
  const ServiceList({super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder();
    // return SizedBox(
    //   child: BlocBuilder<BleBloc, BleState>(
    //     builder: (context, state) {
    //       final count = state.services.length;
    //       return ListView.builder(
    //         itemCount: count,
    //         itemBuilder: (_, index) {
    //           final service = state.services[index];
    //           final remoteId = service.remoteId;
    //           final serviceUuid = service.serviceUuid;
    //           return ListTile(
    //             title: Text("RemoteId: $remoteId"),
    //             subtitle: Text("ServiceUuid: $serviceUuid"),
    //             onTap: () =>
    //                 context.read<BleBloc>()..add(SelectService(service)),
    //           );
    //         },
    //       );
    //     },
    //   ),
    // );
  }
}
