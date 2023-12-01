import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey.shade200, blurRadius: 3, offset: const Offset(0, 5)),
        ],
      ),
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .12,
                width: double.infinity,
                child: Image.network('https://picsum.photos/200', fit: BoxFit.cover),
              ),
              const Text('Nombre'),
            ],
          ),
          const Positioned(
            right: 5,
            top: 5,
            child: Text('1'),
          )
        ],
      ),
    );
  }
}
