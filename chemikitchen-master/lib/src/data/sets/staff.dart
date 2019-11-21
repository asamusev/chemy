import 'package:chemikitchen/src/data/sets/elemets.dart';
import 'package:chemikitchen/src/models/complex_element.dart';
import 'package:flutter/material.dart';

class SetComplexElements{

  static ComplexChemiElement water() => ComplexChemiElement(
    name: "Water", 
    count: 1, 
    short: "H20", 
    color: Colors.blue, 
    description: "about wather",
    compaund: [SetSingleElements.hydrogen(count: 2), SetSingleElements.oxygen()]
    );

  static ComplexChemiElement azoticAcid() => ComplexChemiElement(
    name: "Azotic Acid", 
    count: 1, 
    short: "HNO3", 
    color: Colors.lightGreen, 
    description: "about azoticAcid",
    compaund: [SetSingleElements.hydrogen(count: 1),SetSingleElements.natrium(count: 1), SetSingleElements.oxygen(count: 3)]
    );
    static ComplexChemiElement carbonAcid() => ComplexChemiElement(
    name: "Carbon Acid", 
    count: 1, 
    short: "H2CO3", 
    color: Colors.green, 
    description: "about azoticAcid",
    compaund: [SetSingleElements.hydrogen(count: 1),SetSingleElements.carbon(count: 1), SetSingleElements.oxygen(count: 3)]
    );

  static ComplexChemiElement lithiumOxide() => ComplexChemiElement(
    name: "Lithium Oxide", 
    count: 1, 
    short: "Li2O", 
    color: Colors.grey, 
    description: "about lithium oxide",
    compaund: [SetSingleElements.lithium(count: 2), SetSingleElements.oxygen()]
  );

  static ComplexChemiElement natriumOxide() => ComplexChemiElement(
    name: "Natrium Oxide", 
    count: 1, 
    short: "Na2O", 
    color: Colors.purple, 
    description: "about natrium oxide",
    compaund: [SetSingleElements.natrium(count: 2), SetSingleElements.oxygen()]
  );

}



    List<ComplexChemiElement> allComplexElements = [
      SetComplexElements.water(),
    ];