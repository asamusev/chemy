import 'package:chemikitchen/src/data/sets/elemets.dart';
import 'package:chemikitchen/src/data/sets/staff.dart';
import 'package:chemikitchen/src/models/complex_element.dart';
import 'package:chemikitchen/src/models/single_element.dart';
import 'package:chemikitchen/src/utils/equals.dart';
import 'package:chemikitchen/src/utils/rand_int.dart';
import 'package:flutter/material.dart';

import 'package:uuid/uuid.dart';

import 'sets/staff.dart';


class ChemiData with ChangeNotifier {
  var uuid = new Uuid();

  SingleChemiElement _curentElement = SetSingleElements.hydrogen();
  List<SingleChemiElement> _singleElements = [
    SetSingleElements.hydrogen(), 
    SetSingleElements.oxygen(), 
    SetSingleElements.carbon(), 
    SetSingleElements.hydrogen(), 
    SetSingleElements.lithium(),
    SetSingleElements.natrium(),
    SetSingleElements.kalium(),
    SetSingleElements.argentum(),
    SetSingleElements.flourin(),

  ];
  List<ComplexChemiElement> _complexElement = [
    SetComplexElements.water(),
  ];
  

  List<Oxide> _oxideElement = [
    SetOxide.lithiumOxide(),
    SetOxide.natriumOxide(),
  ];


  
  SingleChemiElement get current => _curentElement;
  List<SingleChemiElement> get singleElements => _singleElements;
  List<ComplexChemiElement> get complexElement => _complexElement;
  List<Oxide> get oxideElement => _oxideElement;

  nextElement(){
    _curentElement = getRandomElement();
   
    notifyListeners();
  }

  static SingleChemiElement getRandomElement(){
    int r = getRandomInt(1, 8);
     switch (r) {
      case 1:
        return SetSingleElements.hydrogen();
        break;
      case 2:
        return SetSingleElements.oxygen();
        break;
      case 3:
        return SetSingleElements.lithium();
        break;
      case 4:
        return SetSingleElements.carbon();
        break;
      case 5:
        return SetSingleElements.natrium();
        break;
       case 6:
        return SetSingleElements.kalium();
        break;
      case 7:
        return SetSingleElements.argentum();
        break;
      case 8:
        return SetSingleElements.flourin();
        break;
      default:
        return SetSingleElements.hydrogen();
    }
  }

  addSingleElement(SingleChemiElement element, int index){
    _singleElements.insert(index, element);
    notifyListeners();
    summSingleElement();
    findComplexElement();
  }

  summSingleElement(){
    SingleChemiElement lastElement;
    List<SingleChemiElement> tempList = [];

    _singleElements.forEach((SingleChemiElement element){
      if (lastElement == null){
        lastElement = element;
      } else{
        if(lastElement.name == element.name){ 
          lastElement.count += element.count;
        } else {
          tempList.add(lastElement);
          lastElement = element;
        }
      }
    });
    tempList.add(lastElement);

    _singleElements.clear();
    _singleElements.addAll(tempList);
    notifyListeners();
  }

  findComplexElement(){
    SingleChemiElement lastElement;
    List<String> deletedElement = [];

    _singleElements.forEach((SingleChemiElement element){
      if (lastElement == null){
        lastElement = element;
      } else{
        allComplexElements.forEach((ComplexChemiElement e){
          if (equalsListElements(e.compaund, [lastElement, element])){
     
            deletedElement.add(element.uuid);
            deletedElement.add(lastElement.uuid);
            _complexElement.add(SetComplexElements.water());
          } else {
          }
        });  
      }
    });

    
    

    deletedElement.forEach((uuid){
      _singleElements.removeWhere((e){
          return e.uuid == uuid;
      });
    });


    //_singleElements.removeAt(0);
    //_singleElements.removeAt(0);
    print("______");
    notifyListeners();
  }
}