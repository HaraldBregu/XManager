/*
 SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 5, 16, 0),
              child: Card(
                elevation: 6,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 8,
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text("Dinamo"),
                        titleTextStyle: TextStyle(
                          fontSize: context.textTheme.titleLarge?.fontSize,
                          fontFamily: context.textTheme.titleLarge?.fontFamily,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const AlertCard(
                        state: AlertState.warningAlertState,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        text: "Registra tutti i dispositivi!",
                        icon: Icons.error,
                      ),
                      GestureDetector(
                        onTap: () {
                          context
                              .read<AppBloc>()
                              .add(AppPermissionsStatusEvent());
                          context.read<BleBloc>().add(
                                const ListenConnectionStateEvent(
                                    "E7:C8:DF:65:5B:4B"),
                              );
                          const deviceEvent =
                              DeviceSelectEvent("E7:C8:DF:65:5B:4B");
                          context.read<DeviceBloc>().add(deviceEvent);

                          context.pushNamed("Device screen");
                        },
                        child: Container(
                          color: Colors.transparent,
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                const Card(
                                  elevation: 0,
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: RotatedBox(
                                      quarterTurns: 2,
                                      child: Icon(
                                        Icons.double_arrow_outlined,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "PIEDE SINISTRO",
                                  style: context.textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<AppBloc>().add(AppStartEvent());
                          context.read<BleBloc>().add(
                                const ListenConnectionStateEvent(
                                    "E7:C8:DF:65:5B:4B"),
                              );
                          final deviceEvent = DeviceStartEvent();
                          context.read<DeviceBloc>().add(deviceEvent);

                          context.pushNamed("Device screen");
                        },
                        child: Container(
                          color: Colors.transparent,
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                const Card(
                                  elevation: 0,
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Icon(
                                      //Icons.change_history_outlined,
                                      Icons.double_arrow_outlined,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "PIEDE DESTRO",
                                  style: context.textTheme.titleMedium,
                                ),
                                // const Icon(Icons.arrow_forward),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          
        */
