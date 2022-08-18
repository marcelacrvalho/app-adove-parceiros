import 'package:app_adove/app/global/helpers/cities.dart';
import 'package:app_adove/app/global/helpers/constraints.dart';
import 'package:app_adove/app/modules/home/controllers/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class TextSuggestionCityWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TypeAheadFormField<String>(
      textFieldConfiguration: TextFieldConfiguration(
        controller: ProfileController.to.controllerLocation,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(7.0)),
          labelStyle: TextStyle(
            fontSize: kH2,
          ),
          hintText: 'Exemplo: São Paulo, São Paulo',
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: kH2,
          ),
        ),
      ),
      onSuggestionSelected: (String suggestionSelected) {
        ProfileController.to.controllerLocation!.text = suggestionSelected;
      },
      itemBuilder: (context, suggestions) {
        return ListTile(
          title: Text(suggestions),
        );
      },
      suggestionsCallback: (String city) => Cities.getSuggestions(city),
    );
  }
}
