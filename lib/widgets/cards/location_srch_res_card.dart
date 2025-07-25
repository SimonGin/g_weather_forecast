import 'package:flutter/material.dart';
import 'package:g_weather_forecast/models/location_item.dart';
import 'package:g_weather_forecast/providers/location.dart';
import 'package:provider/provider.dart';

class LocationSearchResultCard extends StatefulWidget {
  final LocationItem item;

  const LocationSearchResultCard({super.key, required this.item});

  @override
  State<LocationSearchResultCard> createState() =>
      _LocationSearchResultCardState();
}

class _LocationSearchResultCardState extends State<LocationSearchResultCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () =>
            context.read<LocationProvider>().selectLocation(widget.item.name),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: _isHovered
                ? const Color(0xff6D4E9E)
                : const Color(0xff7E5CAD),
            borderRadius: BorderRadius.circular(10),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ]
                : [],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.location_city_rounded,
                    size: 24,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    widget.item.name,
                    style: const TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              if (widget.item.region.isNotEmpty)
                Row(
                  children: [
                    const Icon(
                      Icons.approval_rounded,
                      size: 24,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      widget.item.region,
                      style: const TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ],
                ),
              if (widget.item.region.isNotEmpty) const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.location_on, size: 24, color: Colors.white),
                  const SizedBox(width: 10),
                  Text(
                    widget.item.country,
                    style: const TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
