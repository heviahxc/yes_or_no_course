import 'package:flutter/material.dart';

import '../../../domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;
  const HerMessageBubble({super.key, required this.message});
 
  

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.primary, borderRadius: BorderRadius.circular(20)),
          child:  Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        _ImageBubble(imageUrl: message.imageUrl!,),
        const SizedBox(height: 10,)
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
   final String imageUrl;
  const _ImageBubble({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(imageUrl,
      width: size.width * 0.7,
      height: 150,
      fit: BoxFit.cover,
      loadingBuilder:  (context, child, loadingProgress) {
        
        if(loadingProgress == null) return child;

        return Container(
          width: size.width * 0.7,
          height: 150,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text('My Love esta enviando una imagen'),
        );
      },
      ));
  }
}
