import 'dart:math';


int getRandomInt(int min, int max){
  Random rnd = new Random(DateTime.now().millisecondsSinceEpoch);
  return min + rnd.nextInt(max - min);
}