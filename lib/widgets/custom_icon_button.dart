import 'package:culture_explorer_ar/widgets/custom_marker.dart';
import 'package:culture_explorer_ar/widgets/custom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomIconButton extends StatefulWidget {
  final String? _name;
  final String? _nameEn;
  final String type;
  final Icon _icon;
  final Icon _selectedIcon;

  const CustomIconButton(
      {super.key, required this.type, String? name, String? nameEn})
      : _icon = type == 'museum'
            ? const Icon(Icons.museum_outlined)
            : const Icon(Icons.palette_outlined),
        _selectedIcon = type == 'museum'
            ? const Icon(Icons.museum)
            : const Icon(Icons.palette),
        _name = name,
        _nameEn = nameEn;

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<MarkerNotifier>(
      builder: (context, marker, child) => IconButton.filled(
        isSelected: _isSelected,
        onPressed: () {
          final sheet = context.read<SheetNotifier>();

            if (!marker.isSelected) {
              setState(() => _isSelected = true);
              sheet
                  .update(widget._name ?? widget._nameEn ?? "No name provided");
              marker.changeSelection();
            } else if (_isSelected) {
              setState(() => _isSelected = false);
              sheet.update("Nearby Places");
              marker.changeSelection();
            }
      
        },
        icon: widget._icon,
        selectedIcon: widget._selectedIcon,
        tooltip: '${widget.type[0].toUpperCase()}${widget.type.substring(1)}',
      ),
    );
  }
}
