import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final  focusNode = FocusNode();

    //final colors = Theme.of(context).colorScheme;
    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));
    final inputDecoration = InputDecoration(
        hintText: 'Deseas enviar un mensage "??"',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon:
            IconButton(onPressed: () {
              final textValue = textController.value.text;
              print(textValue);
              textController.clear();
            }, icon: Icon(Icons.send_outlined)));
    return TextFormField(
      onTapOutside: (event){
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value){
        textController.clear();
        focusNode.requestFocus();
      },
    
    );
  }
}
