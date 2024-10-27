import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xmanager/src/core/theme_extension.dart';

class DevicesScanScreen extends StatelessWidget {
  const DevicesScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void showAlertRadioDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          String selectedOption = "";

          return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                title: const Text('Device location'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                        'Select the location where the device will be used.'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Left Foot'),
                        Radio<String>(
                          value: "LEFT_FOOT",
                          groupValue: selectedOption,
                          onChanged: (String? value) {
                            setState(() {
                              selectedOption = "LEFT_FOOT";
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Right Foot'),
                        Radio<String>(
                          value: "RIGHT_FOOT",
                          groupValue: selectedOption,
                          onChanged: (String? value) {
                            setState(() {
                              selectedOption = "RIGHT_FOOT";
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      context.pop();
                    },
                  ),
                  FilledButton(
                    onPressed: selectedOption != ''
                        ? () {
                            context.pop();
                          }
                        : null,
                    child: const Text('Save'),
                  ),
                ],
              );
            },
          );
        },
      );
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Devices'),
            pinned: true,
          ),

          // Spacer
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),

          SliverList(
            delegate: SliverChildListDelegate(
              List.generate(
                5,
                (idx) {
                  return ListTile(
                    title: Text(
                      "Dinamo",
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    subtitle: Text(
                      "ER:WS:DF:GH:YU",
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: Text(
                      "connected",
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onTap: () {
                      //context.pushNamed('device screen');
                      showAlertRadioDialog();
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
