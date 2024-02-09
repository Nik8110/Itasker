import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itasker/presentation/screens/my_task_screen/my_task_widget.dart';

import '../../../application/constants.dart';
import '../../router/routes.dart';

class MyTaskScreen extends StatefulWidget {
  const MyTaskScreen({super.key});

  @override
  State<MyTaskScreen> createState() => _MyTaskScreenState();
}

class _MyTaskScreenState extends State<MyTaskScreen>
    with TickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    filter = Const().listTask;
  }

  int tabIndex = 0;
  List tabData = [
    'Todos',
    'Pendiente',
    'En curso',
    'Finalizadas',
    "Canceladas"
  ];
  int selectedIndex = 0;
  List filter = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.kScaffoldBackground,
      appBar: AppBar(
        backgroundColor: Const.kWhite,
        elevation: 0,
        leading: null,
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 0),
          child: TabBar(
            controller: tabController,
            indicatorColor: Const.kBackground,
            padding: EdgeInsets.zero,
            labelPadding: EdgeInsets.only(bottom: 14.h),
            indicatorWeight: 3,
            onTap: (value) {
              setState(() {
                tabIndex = value;
              });
            },
            overlayColor: MaterialStateProperty.resolveWith((states) {
              return Colors.transparent;
            }),
            tabs: [
              Text(
                'Aplicadas',
                style: tabIndex == 0
                    ? Const.medium.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: Const.kBackground)
                    : Const.medium.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: Const.kBlackShade6),
              ),
              Text(
                'Creadas',
                style: tabIndex == 1
                    ? Const.medium.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: Const.kBackground)
                    : Const.medium.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: Const.kBlackShade6),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 62.h,
                color: Const.kWhite,
                child: Row(
                  children: [
                    Flexible(
                      child: ListView.builder(
                        itemCount: tabData.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                              if (filter.isNotEmpty) {
                                filter.clear();
                              }
                              if (tabData[index] == "Todos") {
                                filter = Const().listTask;
                              } else {
                                for (var i in Const().listTask) {
                                  if (tabData[index] == i['type']) {
                                    filter.add(i);
                                  }
                                }
                              }
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: selectedIndex == index
                                    ? Const.kBackground
                                    : Const.kWhite,
                                borderRadius: BorderRadius.circular(21.r),
                                border:
                                    Border.all(color: Const.kBorderContainer)),
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 13.w, vertical: 9.h),
                            margin: EdgeInsets.symmetric(
                                horizontal: 3.5.w, vertical: 7.h),
                            child: Text(tabData[index],
                                style: Const.medium.copyWith(
                                    fontSize: 15.sp,
                                    color: selectedIndex == index
                                        ? Const.kWhite
                                        : Const.kBlack)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                      children: List.generate(
                          filter.length,
                          (index) => DetailCard(
                                cardOnTap: () =>
                                    Navigator.pushNamed(arguments: {
                                  'text': 'Preguntar',
                                  'isShow': filter[index]['type'] ==
                                              "En curso" ||
                                          filter[index]['type'] == "Finalizadas"
                                      ? false
                                      : true
                                }, context, AppRouter.taskerChatBudgetScreen),
                                title: filter[index]['title'],
                                taskColor: filter[index]['color'],
                                isPanding: true,
                                taskTitle: filter[index]['type'],
                                onTap: () {
                                  showBottomSheetWidget(
                                    context,
                                    height: filter[index]['type'] == "Pendiente"
                                        ? 210.h
                                        : filter[index]['type'] == "En curso" ||
                                                filter[index]['type'] ==
                                                    "Finalizadas"
                                            ? 320.h
                                            : 210.h,
                                    children: filter[index]['type'] ==
                                            "Pendiente"
                                        ? buildPendiente(context)
                                        : filter[index]['type'] == "En curso"
                                            ? buildEncurso(context)
                                            : filter[index]['type'] ==
                                                    "Finalizadas"
                                                ? buildFinalizada(context)
                                                : buildCencelada(context),
                                  );
                                },
                              ))
                      // [
                      //   DetailCard(
                      //     cardOnTap: () => Navigator.pushNamed(
                      //         arguments: {'text': 'Preguntar', 'isShow': false},
                      //         context,
                      //         AppRouter.taskerChatBudgetScreen),
                      //     title: 'Pasear a mi mascota',
                      //     taskColor: Const.kYellowShade1,
                      //     isPanding: true,
                      //     taskTitle: 'Pendiente',
                      //     onTap: () {
                      //       showBottomSheetWidget(
                      //         context,
                      //         height: 210.h,
                      //         children: [
                      //           listTileWidget(
                      //             context,
                      //             title: 'Detalles de tarea',
                      //             onTap: () {
                      //               Navigator.pop(context);
                      //               Navigator.pushNamed(arguments: {
                      //                 'text': 'Preguntar',
                      //                 'isShow': true
                      //               }, context, AppRouter.taskerChatBudgetScreen);
                      //             },
                      //           ),
                      //           listTileWidget(
                      //             context,
                      //             title: 'Retirar oferta',
                      //             onTap: () {
                      //               Navigator.pop(context);
                      //               Navigator.pushNamed(
                      //                   context, AppRouter.withDrawOfferScreen);
                      //             },
                      //           ),
                      //         ],
                      //       );
                      //     },
                      //   ),
                      //   DetailCard(
                      //     taskColor: Const.kBlueShad2,
                      //     taskTitle: 'En Curso',
                      //     onTap: () {
                      //       showBottomSheetWidget(
                      //         context,
                      //         height: 320.h,
                      //         children: [
                      //           listTileWidget(
                      //             context,
                      //             title: 'Detalles de tarea',
                      //             onTap: () {
                      //               Navigator.pop(context);
                      //               Navigator.pushNamed(arguments: {
                      //                 'text': 'Preguntar',
                      //                 'isShow': false
                      //               }, context, AppRouter.taskerChatBudgetScreen);
                      //             },
                      //           ),
                      //           listTileWidget(
                      //             context,
                      //             title: 'Chat con ofertante',
                      //             onTap: () {
                      //               Navigator.pop(context);
                      //               Navigator.pushNamed(
                      //                   arguments: 'Preguntar',
                      //                   context,
                      //                   AppRouter.taskerChatScreen);
                      //             },
                      //           ),
                      //           listTileWidget(
                      //             context,
                      //             title: 'Finalicé la Tarea',
                      //             onTap: () {
                      //               Navigator.pop(context);
                      //               Navigator.pushNamed(
                      //                   context, AppRouter.finishTaskScreen);
                      //             },
                      //           ),
                      //           listTileWidget(
                      //             context,
                      //             title: 'Necesito ayuda',
                      //             onTap: () => Navigator.pop(context),
                      //           ),
                      //         ],
                      //       );
                      //     },
                      //   ),
                      //   DetailCard(
                      //     taskColor: Const.kRedShade1,
                      //     taskTitle: 'Rechazada',
                      //   ),
                      //   DetailCard(
                      //     taskColor: Const.kGreenShade1,
                      //     taskTitle: 'Finalizada',
                      //     onTap: () {
                      //       showBottomSheetWidget(
                      //         context,
                      //         height: 320.h,
                      //         children: [
                      //           listTileWidget(
                      //             context,
                      //             title: 'Detalles de tarea',
                      //             onTap: () {
                      //               Navigator.pop(context);
                      //               Navigator.pushNamed(arguments: {
                      //                 'text': 'Preguntar',
                      //                 'isShow': false
                      //               }, context, AppRouter.taskerChatBudgetScreen);
                      //             },
                      //           ),
                      //           listTileWidget(
                      //             context,
                      //             title: 'Chat con ofertante',
                      //             onTap: () {
                      //               Navigator.pop(context);
                      //               Navigator.pushNamed(
                      //                   arguments: 'Preguntar',
                      //                   context,
                      //                   AppRouter.taskerChatScreen);
                      //             },
                      //           ),
                      //           listTileWidget(
                      //             context,
                      //             title: 'Calificar al ofertante',
                      //             onTap: () {
                      //               Navigator.pop(context);
                      //               Navigator.pushNamed(
                      //                   context,
                      //                   arguments: false,
                      //                   AppRouter.qualifyScreen);
                      //             },
                      //           ),
                      //           listTileWidget(
                      //             context,
                      //             title: 'Necesito ayuda',
                      //             onTap: () => Navigator.pop(context),
                      //           ),
                      //         ],
                      //       );
                      //     },
                      //   ),
                      //   DetailCard(
                      //     taskColor: Const.kBlackShade10,
                      //     taskTitle: 'Cancelada',
                      //     onTap: () {
                      //       showBottomSheetWidget(
                      //         context,
                      //         height: 210.h,
                      //         children: [
                      //           listTileWidget(
                      //             context,
                      //             title: 'Detalles de tarea',
                      //             onTap: () {
                      //               Navigator.pop(context);
                      //               Navigator.pushNamed(arguments: {
                      //                 'text': 'Preguntar',
                      //                 'isShow': true
                      //               }, context, AppRouter.taskerChatBudgetScreen);
                      //             },
                      //           ),
                      //           listTileWidget(
                      //             context,
                      //             title: 'Chat con ofertante',
                      //             onTap: () {
                      //               Navigator.pop(context);
                      //             },
                      //           ),
                      //         ],
                      //       );
                      //     },
                      //   ),
                      // ],
                      ),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                DetailCard(
                  title: 'Pasear a mi mascota',
                  taskColor: Const.kOrangeShade1,
                  isPanding: true,
                  taskTitle: 'Pendiente',
                  onTap: () {
                    showBottomSheetWidget(
                      context,
                      height: 210.h,
                      children: [
                        listTileWidget(
                          context,
                          title: 'Detalles de tarea',
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(
                                context, AppRouter.taskDetailScreen);
                          },
                        ),
                        listTileWidget(
                          context,
                          title: 'Cancelar tarea',
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(
                                context, AppRouter.cancleTaskScreen);
                          },
                        ),
                      ],
                    );
                  },
                ),
                DetailCard(
                  taskColor: Const.kBLueShade1,
                  taskTitle: 'En Curso',
                  onTap: () {
                    showBottomSheetWidget(
                      context,
                      height: 210.h,
                      children: [
                        listTileWidget(
                          context,
                          title: 'Detalles de tarea',
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(
                                context, AppRouter.taskDetailScreen);
                          },
                        ),
                        listTileWidget(
                          context,
                          title: 'Ir a chat',
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(
                                context, AppRouter.taskerChatScreen);
                          },
                        ),
                      ],
                    );
                  },
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(
                      context, arguments: false, AppRouter.finishedScreen),
                  child: DetailCard(
                    taskColor: Const.kGreenShade1,
                    taskTitle: 'Finalizada',
                    onTap: () {
                      showBottomSheetWidget(
                        context,
                        height: 210.h,
                        children: [
                          listTileWidget(
                            context,
                            title: 'Detalles de tarea',
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.pushNamed(
                                  context, AppRouter.taskDetailScreen);
                            },
                          ),
                          listTileWidget(
                            context,
                            title: 'Cancelar tarea',
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.pushNamed(
                                  context, AppRouter.cancleTaskScreen);
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, AppRouter.cancelledScreen),
                  child: DetailCard(
                    taskColor: Const.kBlackShade10,
                    taskTitle: 'Cancelada',
                    onTap: () {
                      showBottomSheetWidget(
                        context,
                        height: 210.h,
                        children: [
                          listTileWidget(
                            context,
                            title: 'Detalles de tarea',
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.pushNamed(
                                  context, AppRouter.taskDetailScreen);
                            },
                          ),
                          listTileWidget(
                            context,
                            title: 'Cancelar tarea',
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.pushNamed(
                                  context, AppRouter.cancleTaskScreen);
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildPendiente(BuildContext context) {
    return [
      listTileWidget(
        context,
        title: 'Detalles de tarea',
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(
              arguments: {'text': 'Preguntar', 'isShow': true},
              context,
              AppRouter.taskerChatBudgetScreen);
        },
      ),
      listTileWidget(
        context,
        title: 'Retirar oferta',
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, AppRouter.withDrawOfferScreen);
        },
      ),
    ];
  }

  List<Widget> buildEncurso(BuildContext context) {
    return [
      listTileWidget(
        context,
        title: 'Detalles de tarea',
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(
              arguments: {'text': 'Preguntar', 'isShow': false},
              context,
              AppRouter.taskerChatBudgetScreen);
        },
      ),
      listTileWidget(
        context,
        title: 'Chat con ofertante',
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(
              arguments: 'Preguntar', context, AppRouter.taskerChatScreen);
        },
      ),
      listTileWidget(
        context,
        title: 'Calificar al ofertante',
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(
              context, arguments: false, AppRouter.qualifyScreen);
        },
      ),
      listTileWidget(
        context,
        title: 'Necesito ayuda',
        onTap: () => Navigator.pop(context),
      ),
    ];
  }

  List<Widget> buildFinalizada(BuildContext context) {
    return [
      listTileWidget(
        context,
        title: 'Detalles de tarea',
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(
              arguments: {'text': 'Preguntar', 'isShow': false},
              context,
              AppRouter.taskerChatBudgetScreen);
        },
      ),
      listTileWidget(
        context,
        title: 'Chat con ofertante',
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(
              arguments: 'Preguntar', context, AppRouter.taskerChatScreen);
        },
      ),
      listTileWidget(
        context,
        title: 'Calificar al ofertante',
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(
              context, arguments: false, AppRouter.qualifyScreen);
        },
      ),
      listTileWidget(
        context,
        title: 'Necesito ayuda',
        onTap: () => Navigator.pop(context),
      ),
    ];
  }

  List<Widget> buildCencelada(BuildContext context) {
    return [
      listTileWidget(
        context,
        title: 'Detalles de tarea',
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(
              arguments: {'text': 'Preguntar', 'isShow': true},
              context,
              AppRouter.taskerChatBudgetScreen);
        },
      ),
      listTileWidget(
        context,
        title: 'Chat con ofertante',
        onTap: () {
          Navigator.pop(context);
        },
      ),
    ];
  }
}
