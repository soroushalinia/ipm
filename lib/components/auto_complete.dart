import 'package:flutter/material.dart';

class CustomAutoComplete extends StatelessWidget {
  final TextEditingController textEditingController;
  final List<String> options;
  final String label;
  const CustomAutoComplete(
      {super.key,
      required this.textEditingController,
      required this.options,
      required this.label});

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();
    return RawAutocomplete(
      focusNode: focusNode,
      textEditingController: textEditingController,
      optionsViewBuilder: (
        BuildContext context,
        AutocompleteOnSelected<String> onSelected,
        Iterable<String> options,
      ) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Align(
            alignment: Alignment.topLeft,
            child: Material(
              elevation: 4.0,
              child: SizedBox(
                height: 200.0,
                width: 650,
                child: ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: options.length,
                  itemBuilder: (BuildContext context, int index) {
                    final String option = options.elementAt(index);
                    return GestureDetector(
                      onTap: () {
                        onSelected(option);
                      },
                      child: ListTile(
                        title: Text(option),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
      optionsBuilder: (TextEditingValue textEditingValue) {
        return options.where((String option) {
          return option.contains(textEditingValue.text);
        });
      },
      fieldViewBuilder: (
        BuildContext context,
        TextEditingController textEditingController,
        FocusNode focusNode,
        VoidCallback onFieldSubmitted,
      ) {
        return Container(
          width: 650,
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              label: Text(label),
            ),
            controller: textEditingController,
            focusNode: focusNode,
            onFieldSubmitted: (String value) {
              onFieldSubmitted();
            },
          ),
        );
      },
    );
  }
}
