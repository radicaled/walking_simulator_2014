import 'package:stagexl/stagexl.dart';
import 'dart:collection';

class PlayerSprite extends Bitmap implements Animatable {
  SpriteSheet spriteSheet;


  static List upFrames = [0, 1, 2];
  static List leftFrames = [18, 19, 20];
  static List rightFrames = [6, 7, 8];
  static List downFrames = [12, 13, 14];

  Queue animationFrames;

  PlayerSprite(this.spriteSheet) : super(new BitmapData(24, 32)) {
    _update(13);
    onAddedToStage.first.then((_) {
      _animate(downFrames);
    });
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

  _animate(List frames) {
    animationFrames = new Queue.from(frames);
    stage.juggler.add(this);
  }

  void moveLeft() {
    _update(20);
    _animateXY(xDelta: -32);
    _animate(leftFrames);
  }

  void moveRight() {
    _update(7);
    _animateXY(xDelta: 32);
    _animate(rightFrames);
  }

  void moveUp() {
    _update(1);
    _animateXY(yDelta: -32);
    _animate(upFrames);
  }

  void moveDown() {
    _update(13);
    _animateXY(yDelta: 32);
    _animate(downFrames);
  }

  num _totalTime = 0.0;
  bool advanceTime(num delta) {
    _totalTime += delta;
    if (_totalTime > 0.5) {
      _totalTime = 0.0;
      var nextFrame = animationFrames.removeFirst();
      _update(nextFrame);
      animationFrames.add(nextFrame);
    }
    return animationFrames.isNotEmpty;
  }
}