import 'dart:html';
import 'package:stagexl/stagexl.dart';
import 'package:walking_sim/game/sprites/player_sprite.dart';

PlayerSprite playerSprite;
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

  stage.focus = stage;

  stage.addChild(shape);

  var rm = new ResourceManager();
  rm.addBitmapData('mage_f', 'packages/walking_sim/assets/people/Heroes/Mage-F-01.png');
  rm.load().then((_) {
    var bitmapData = rm.getBitmapData('mage_f');
    var ss = new SpriteSheet(bitmapData, 24, 32);
    playerSprite = new PlayerSprite(ss);

    stage.addChild(playerSprite);
    _handleEvents(stage);
  });



}

_handleEvents(Stage stage) {
  stage.onKeyDown.listen((KeyboardEvent ke) {
    switch(ke.keyCode) {
      case 37:
        print('left');
        playerSprite.moveLeft();
      break;
      case 38:
        print('up');
        playerSprite.moveUp();
      break;
      case 39:
        print('right');
        playerSprite.moveRight();
      break;
      case 40:
        print('down');
        playerSprite.moveDown();
      break;
    }
  });
}