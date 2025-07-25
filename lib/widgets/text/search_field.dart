import 'package:flutter/material.dart';
import 'package:g_weather_forecast/providers/location.dart';
import 'package:provider/provider.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late TextEditingController searchCtrler;

  @override
  void initState() {
    super.initState();
    searchCtrler = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final provider = context.watch<LocationProvider>();
    // Only update if the controller text and provider.query are different
    if (searchCtrler.text != provider.query) {
      searchCtrler.text = provider.query;
      searchCtrler.selection = TextSelection.fromPosition(
        TextPosition(offset: searchCtrler.text.length),
      );
    }
  }

  @override
  void dispose() {
    searchCtrler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchCtrler,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "E.g., New York, London, Tokyo",
        hintStyle: TextStyle(color: Colors.grey),
        suffixIcon: searchCtrler.text.isEmpty
            ? null
            : IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  searchCtrler.clear();
                  context.read<LocationProvider>().changeQuery("");
                },
              ),
      ),
      style: TextStyle(fontSize: 24),
      onChanged: (value) => context.read<LocationProvider>().changeQuery(value),
    );
  }
}
