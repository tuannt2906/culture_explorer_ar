import 'package:culture_explorer_ar/widgets/custom_marker.dart';
import 'package:culture_explorer_ar/widgets/custom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomIconButton extends StatefulWidget {
  final String? _name;
  final String? _nameEn;
  final String type;
  final IconData _icon;
  final IconData _selectedIcon;

  const CustomIconButton(
      {super.key, required this.type, String? name, String? nameEn})
      : _icon =
            type == 'museum' ? Icons.museum_outlined : Icons.palette_outlined,
        _selectedIcon = type == 'museum' ? Icons.museum : Icons.palette,
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

          setState(() {
            if (!marker.isSelected) {
              _isSelected = true;
              sheet.update(widget._name ?? widget._nameEn ?? "No name provided");
              marker.updateSelection();
            } else if (_isSelected) {
              _isSelected = false;
              marker.updateSelection();
            }
          });
        },
        icon: Icon(widget._icon),
        selectedIcon: Icon(widget._selectedIcon),
        tooltip: '${widget.type[0].toUpperCase()}${widget.type.substring(1)}',
      ),
    );
  }
}
