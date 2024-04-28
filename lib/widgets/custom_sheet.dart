import 'package:culture_explorer_ar/widgets/custom_grid.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SheetNotifier with ChangeNotifier {
  String _title = "Nearby Places";
  String get title => _title;

  void update(String title) {
    _title = title;
    notifyListeners();
  }
}

class CustomSheet extends StatefulWidget {
  const CustomSheet({super.key});

  @override
  State<CustomSheet> createState() => _CustomSheetState();
}

class _CustomSheetState extends State<CustomSheet> {
  final _controller = DraggableScrollableController();
  final _initialChildSize = 0.25;
  final _maxChildSize = 1.0;
  final _minChildSize = 0.1;
  final _snapSizes = [0.25];

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: _initialChildSize,
      maxChildSize: _maxChildSize,
      minChildSize: _minChildSize,
      snap: true,
      snapSizes: _snapSizes,
      controller: _controller,
      builder: (BuildContext context, scrollController) =>
          SheetBody(scrollController: scrollController),
    );
  }
}

class SheetBody extends StatelessWidget {
  final ScrollController scrollController;

  const SheetBody({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final List<String> dataList = List.generate(20, (index) => 'Item $index');

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Consumer<SheetNotifier>(
        builder: (context, sheet, child) => CustomScrollView(
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
            SliverAppBar(
              title: Text(sheet.title),
              primary: false,
              pinned: true,
              centerTitle: false,
            ),
            SliverGrid.builder(
                gridDelegate: CustomGridDelegate(dimension: 240),
                itemCount: dataList.length,
                itemBuilder: (BuildContext context, int index) {
                  // final math.Random random = math.Random(index);
                  return GridTile(
                    header: GridTileBar(
                      title: Text(dataList[index],
                          style: const TextStyle(color: Colors.black)),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(12.0),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        gradient: const RadialGradient(
                          colors: <Color>[Color(0x0F88EEFF), Color(0x2F0099BB)],
                        ),
                      ),
                      child: FlutterLogo(
                        style: FlutterLogoStyle.values[1],
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
