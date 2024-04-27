import 'package:flutter/material.dart';

class CustomIconButton extends StatefulWidget {
  final String type;
  final IconData _icon;
  final IconData _selectedIcon;

  const CustomIconButton({super.key, required this.type})
      : _icon =
            type == 'museum' ? Icons.museum_outlined : Icons.palette_outlined,
        _selectedIcon = type == 'museum' ? Icons.museum : Icons.palette;

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      isSelected: _isSelected,
      onPressed: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      icon: Icon(widget._icon),
      selectedIcon: Icon(widget._selectedIcon),
      tooltip: '${widget.type[0].toUpperCase()}${widget.type.substring(1)}',
    );
  }
}
