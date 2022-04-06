import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar
({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Center(
        child: TextField(
          style: Theme.of(context).textTheme.titleSmall,
          decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10),),
              borderSide: BorderSide(color: Colors.transparent)
            ),
            prefixIcon: Icon(Icons.search, color: Theme.of(context).primaryColor,),
            hintText: "Pesquisar...",
            filled: true,
            fillColor: Theme.of(context).hoverColor,
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10),),
              borderSide: BorderSide(color: Colors.transparent)
            )
          ),
        ),
      ),
    );
  }
}