import 'package:flutter/material.dart';

enum MenuButtonEnum { CHARACTERS, SHIPS, FILMS, PLANETS, VEHICLES, SPECIES }

extension MenuButtonExt on MenuButtonEnum {
  String get text {
    switch (this) {
      case MenuButtonEnum.CHARACTERS:
        return "personagens";
      case MenuButtonEnum.FILMS:
        return "filmes";
      case MenuButtonEnum.PLANETS:
        return "planetas";
      case MenuButtonEnum.SHIPS:
        return "naves";
      case MenuButtonEnum.VEHICLES:
        return "veiculos";
      case MenuButtonEnum.SPECIES:
        return "especies";
    }
  }

  String get route {
    switch (this) {
      case MenuButtonEnum.CHARACTERS:
        return "/characters";
      case MenuButtonEnum.FILMS:
        return "/films";
      case MenuButtonEnum.PLANETS:
        return "/planets";
      case MenuButtonEnum.SHIPS:
        return "/ships";
      case MenuButtonEnum.VEHICLES:
        return "/vehicles";
      case MenuButtonEnum.SPECIES:
        return "/species";
    }
  }

  Image get image {
    switch (this) {
      case MenuButtonEnum.CHARACTERS:
        return Image.asset("images/icons/catalog/personagens.png");
      case MenuButtonEnum.FILMS:
        return Image.asset("images/icons/catalog/filmes.png");
      case MenuButtonEnum.PLANETS:
        return Image.asset("images/icons/catalog/planetas.png");
      case MenuButtonEnum.SHIPS:
        return Image.asset("images/icons/catalog/nave.png");
      case MenuButtonEnum.VEHICLES:
        return Image.asset("images/icons/catalog/veiculos.png");
      case MenuButtonEnum.SPECIES:
        return Image.asset("images/icons/catalog/especies.png");
    }
  }
}
