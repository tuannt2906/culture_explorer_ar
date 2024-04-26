import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyDraggableSheet extends StatefulWidget {
  const MyDraggableSheet({super.key});

  @override
  State<MyDraggableSheet> createState() => _MyDraggableSheetState();
}

class _MyDraggableSheetState extends State<MyDraggableSheet> {
  final controller = DraggableScrollableController();
  final initialChildSize = 0.25;
  final maxChildSize = 1.0;
  final minChildSize = 0.1;
  final snapSizes = [0.25];

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: initialChildSize,
      maxChildSize: maxChildSize,
      minChildSize: minChildSize,
      snap: true,
      snapSizes: snapSizes,
      controller: controller,
      builder: (BuildContext context, scrollController) {
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: CustomScrollView(
            controller: scrollController,
            scrollBehavior: const ScrollBehavior().copyWith(dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
            }),
            slivers: [
              SliverToBoxAdapter(
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).hintColor,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    height: 4,
                    width: 40,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
              const SliverAppBar(
                title: Text('My App'),
                primary: false,
                pinned: true,
                centerTitle: false,
              ),
              SliverList.list(children: const [
                ListTile(title: Text('Jane Doe')),
                ListTile(title: Text('Jack Reacher')),
              ])
            ],
          ),
        );
      },
    );
  }
}
