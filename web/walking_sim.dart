import 'dart:html';
import 'package:stagexl/stagexl.dart';


void main() {
  var p = querySelector('.test');
  p.text = 'Dart is working OK!';

  var canvas = querySelector('#stage');

  var stage = new Stage(canvas);
  var renderLoop = new RenderLoop();
  renderLoop.addStage(stage);

  var shape = new Shape();
  shape.graphics
    ..circle(100, 100, 60)
    ..fillColor(Color.Yellow);

  stage.addChild(shape);

}