import 'package:stagexl/stagexl.dart';

class PlayerSprite extends Bitmap {
  SpriteSheet spriteSheet;

  PlayerSprite(this.spriteSheet) : super(new BitmapData(24, 32)) {
    _update(13);
  }

  void _update(frameNo) {
    var src = new Rectangle(0, 0, 24, 32);
    var dest = new Point(0, 0);
    this.bitmapData.copyPixels(spriteSheet.frameAt(frameNo), src, dest);
  }

  void _animateXY({int xDelta, int yDelta}) {
    var tween = new Tween(this, 0.5, TransitionFunction.linear);
    if (xDelta != null) { tween.animate.x.by(xDelta); }
    if (yDelta != null) { tween.animate.y.by(yDelta); }

    this.stage.juggler.add(tween);
  }

  void moveLeft() {
    _update(20);
    _animateXY(xDelta: -32);
  }

  void moveRight() {
    _update(7);
    _animateXY(xDelta: 32);
  }

  void moveUp() {
    _update(1);
    _animateXY(yDelta: -32);
  }

  void moveDown() {
    _update(13);
    _animateXY(yDelta: 32);
  }
}