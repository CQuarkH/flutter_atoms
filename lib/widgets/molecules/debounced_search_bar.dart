import 'package:flutter/material.dart';
import 'package:flutter_atoms/hooks/use_search.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DebouncedSearchBar extends HookWidget {
  final TextStyle? textStyle;
  final InputDecoration? decoration;
  final String? placeholder;
  final Function(String) onSearchChanged;
  const DebouncedSearchBar(
      {super.key,
      required this.onSearchChanged,
      this.textStyle,
      this.decoration,
      this.placeholder = 'Search...'});

  @override
  Widget build(BuildContext context) {
    // custom search controller hook
    // this hook will debounce the search input (300ms by default)
    final searchController = useSearch(onSearch: onSearchChanged);

    return TextField(
        controller: searchController,
        style: textStyle ?? Theme.of(context).textTheme.bodyLarge,
        decoration: decoration ??
            InputDecoration(
              contentPadding: const EdgeInsets.all(4),
              hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.6)),
              hintText: placeholder,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8),
              ),
            ));
  }
}
