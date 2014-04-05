(function() {
  var Main;

  Main = (function() {
    function Main() {
      this.vars();
      this.initScroll();
      this.describeSequence();
    }

    Main.prototype.vars = function() {
      this.maxScroll = -8000;
      this.frameDurationTime = 1000;
      this.$treePath = $('#js-tree-path');
      this.$riverPath = $('#js-river-path');
      this.$skullPath = $('#js-skull-path');
      this.$skull1 = $('#js-skull1');
      this.$skull2 = $('#js-skull2');
      this.$skull3 = $('#js-skull3');
      this.$skull4 = $('#js-skull4');
      this.$skull5 = $('#js-skull5');
      this.$fish1 = $('#js-fish1');
      this.$fish2 = $('#js-fish2');
      this.$fish3 = $('#js-fish3');
      this.$fish4 = $('#js-fish4');
      this.$fish5 = $('#js-fish5');
      this.$plate = $('#js-plate');
      this.$fork = $('#js-fork');
      this.$knife = $('#js-knife');
      this.$logo = $('#js-logo');
      this.$eatenPath = $('#js-eaten-path');
      this.$tree = $('#js-tree');
      return this.$river = $('#js-river');
    };

    Main.prototype.initScroll = function() {
      var it;
      this.scroller = new IScroll('#js-main', {
        probeType: 3,
        mouseWheel: true,
        deceleration: 0.001
      });
      document.addEventListener('touchmove', (function(e) {
        return e.preventDefault();
      }), false);
      this.controller = $.superscrollorama({
        triggerAtCenter: false,
        playoutAnimations: true
      });
      it = this;
      this.scroller.on('scroll', function() {
        return it.updateScrollPos(this, it);
      });
      return this.scroller.on('scrollEnd', function() {
        return it.updateScrollPos(this, it);
      });
    };

    Main.prototype.updateScrollPos = function(that, it) {
      (that.y < it.maxScroll) && (that.y = it.maxScroll);
      return it.controller.setScrollContainerOffset(0, -(that.y >> 0)).triggerCheckAnim(true);
    };

    Main.prototype.describeSequence = function() {
      var dur, start;
      start = 1;
      dur = 2 * this.frameDurationTime;
      this.treePath = TweenMax.to({
        startOffset: 2800
      }, 1, {
        startOffset: 200,
        onUpdate: (function(_this) {
          return function() {
            var offset;
            offset = _this.treePath.target.startOffset;
            return _this.$treePath[0].setAttribute('startOffset', offset);
          };
        })(this)
      });
      this.controller.addTween(start, this.treePath, dur);
      start += this.frameDurationTime / 4;
      dur = this.frameDurationTime;
      this.tree = TweenMax.to(this.$tree, 1, {
        opacity: 0,
        ease: "Expo.easeIn"
      });
      this.controller.addTween(start, this.tree, dur);
      start += this.frameDurationTime / 4;
      dur = this.frameDurationTime;
      this.grass = TweenMax.to($(document.body), 1, {
        backgroundColor: '#f5cf43',
        ease: "Expo.easeIn"
      });
      this.controller.addTween(start, this.grass, dur);
      start += dur;
      dur = 2 * this.frameDurationTime;
      this.river1 = TweenMax.to({
        startOffset: 2400
      }, 1, {
        startOffset: 200,
        onUpdate: (function(_this) {
          return function() {
            var offset;
            offset = _this.river1.target.startOffset;
            return _this.$riverPath[0].setAttribute('startOffset', offset);
          };
        })(this)
      });
      this.controller.addTween(start, this.river1, dur);
      start += dur / 4;
      dur = this.frameDurationTime;
      this.river = TweenMax.to(this.$river, 1, {
        fill: '#333'
      });
      this.controller.addTween(start, this.river, dur);
      this.grass2 = TweenMax.to($(document.body), 1, {
        backgroundColor: '#774F38',
        ease: "Expo.easeIn"
      });
      this.controller.addTween(start, this.grass2, dur);
      start += dur;
      dur = 2 * this.frameDurationTime;
      this.skull = TweenMax.to({
        startOffset: 2600
      }, 1, {
        startOffset: 100,
        onUpdate: (function(_this) {
          return function() {
            var offset;
            offset = _this.skull.target.startOffset;
            return _this.$skullPath[0].setAttribute('startOffset', offset);
          };
        })(this)
      });
      this.controller.addTween(start, this.skull, dur);
      start += dur / 8;
      dur = this.frameDurationTime / 2;
      this.skull3 = TweenMax.to(this.$skull3, 1, {
        opacity: .15
      });
      this.controller.addTween(start, this.skull3, dur);
      this.fish5 = TweenMax.to(this.$fish5, 1, {
        opacity: 0
      });
      this.controller.addTween(start, this.fish5, dur);
      start += dur / 4;
      dur = this.frameDurationTime / 2;
      this.skull2 = TweenMax.to(this.$skull2, 1, {
        opacity: .15
      });
      this.controller.addTween(start, this.skull2, dur);
      this.fish4 = TweenMax.to(this.$fish4, 1, {
        opacity: 0
      });
      this.controller.addTween(start, this.fish4, dur);
      start += dur / 6;
      dur = this.frameDurationTime / 2;
      this.skull1 = TweenMax.to(this.$skull1, 1, {
        opacity: .15
      });
      this.controller.addTween(start, this.skull1, dur);
      this.fish3 = TweenMax.to(this.$fish3, 1, {
        opacity: 0
      });
      this.controller.addTween(start, this.fish3, dur);
      start += dur / 6;
      dur = this.frameDurationTime / 2;
      this.skull5 = TweenMax.to(this.$skull5, 1, {
        opacity: .15
      });
      this.controller.addTween(start, this.skull5, dur);
      this.fish2 = TweenMax.to(this.$fish2, 1, {
        opacity: 0
      });
      this.controller.addTween(start, this.fish2, dur);
      start += dur / 6;
      dur = this.frameDurationTime / 2;
      this.skull4 = TweenMax.to(this.$skull4, 1, {
        opacity: .15
      });
      this.controller.addTween(start, this.skull4, dur);
      this.fish1 = TweenMax.to(this.$fish1, 1, {
        opacity: 0
      });
      this.controller.addTween(start, this.fish1, dur);
      start += dur;
      dur = this.frameDurationTime;
      this.plate = TweenMax.to({
        startOffset: 1000
      }, 1, {
        startOffset: 0,
        onUpdate: (function(_this) {
          return function() {
            var offset;
            offset = _this.plate.target.startOffset;
            return _this.$plate[0].setAttribute('y', offset);
          };
        })(this)
      });
      this.controller.addTween(start, this.plate, dur);
      start += dur / 2;
      dur = 2 * this.frameDurationTime;
      this.eaten = TweenMax.to({
        startOffset: 2600
      }, 1, {
        startOffset: 880,
        onUpdate: (function(_this) {
          return function() {
            var offset;
            offset = _this.eaten.target.startOffset;
            return _this.$eatenPath[0].setAttribute('startOffset', offset);
          };
        })(this)
      });
      this.controller.addTween(start, this.eaten, dur);
      start += dur / 2;
      dur = this.frameDurationTime;
      this.forkTween = TweenMax.to({
        startOffset: 1000
      }, 1, {
        startOffset: 50,
        onUpdate: (function(_this) {
          return function() {
            var offset;
            offset = _this.forkTween.target.startOffset;
            _this.$fork[0].setAttribute('transform', "translate(0," + offset + ")");
            return _this.$knife[0].setAttribute('transform', "translate(0," + offset + ")");
          };
        })(this)
      });
      this.controller.addTween(start, this.forkTween, dur);
      start += dur;
      dur = this.frameDurationTime / 2;
      this.logo = TweenMax.to(this.$logo, 1, {
        opacity: 1
      });
      return this.controller.addTween(start, this.logo, dur);
    };

    Main.prototype.bind = function(func, context) {
      var bindArgs, wrapper;
      wrapper = function() {
        var args, unshiftArgs;
        args = Array.prototype.slice.call(arguments);
        unshiftArgs = bindArgs.concat(args);
        return func.apply(context, unshiftArgs);
      };
      bindArgs = Array.prototype.slice.call(arguments, 2);
      return wrapper;
    };

    Main.prototype.convertToAbsolute = function(path) {
      var c, i, len, seg, segs, x, x0, x1, x2, y, y0, y1, y2;
      x0 = void 0;
      y0 = void 0;
      x1 = void 0;
      y1 = void 0;
      x2 = void 0;
      y2 = void 0;
      segs = path.pathSegList;
      x = 0;
      y = 0;
      i = 0;
      len = segs.numberOfItems;
      while (i < len) {
        seg = segs.getItem(i);
        c = seg.pathSegTypeAsLetter;
        if (/[MLHVCSQTA]/.test(c)) {
          if ("x" in seg) {
            x = seg.x;
          }
          if ("y" in seg) {
            y = seg.y;
          }
        } else {
          if ("x1" in seg) {
            x1 = x + seg.x1;
          }
          if ("x2" in seg) {
            x2 = x + seg.x2;
          }
          if ("y1" in seg) {
            y1 = y + seg.y1;
          }
          if ("y2" in seg) {
            y2 = y + seg.y2;
          }
          if ("x" in seg) {
            x += seg.x;
          }
          if ("y" in seg) {
            y += seg.y;
          }
          switch (c) {
            case "m":
              segs.replaceItem(path.createSVGPathSegMovetoAbs(x, y), i);
              break;
            case "l":
              segs.replaceItem(path.createSVGPathSegLinetoAbs(x, y), i);
              break;
            case "h":
              segs.replaceItem(path.createSVGPathSegLinetoHorizontalAbs(x), i);
              break;
            case "v":
              segs.replaceItem(path.createSVGPathSegLinetoVerticalAbs(y), i);
              break;
            case "c":
              segs.replaceItem(path.createSVGPathSegCurvetoCubicAbs(x, y, x1, y1, x2, y2), i);
              break;
            case "s":
              segs.replaceItem(path.createSVGPathSegCurvetoCubicSmoothAbs(x, y, x2, y2), i);
              break;
            case "q":
              segs.replaceItem(path.createSVGPathSegCurvetoQuadraticAbs(x, y, x1, y1), i);
              break;
            case "t":
              segs.replaceItem(path.createSVGPathSegCurvetoQuadraticSmoothAbs(x, y), i);
              break;
            case "a":
              segs.replaceItem(path.createSVGPathSegArcAbs(x, y, seg.r1, seg.r2, seg.angle, seg.largeArcFlag, seg.sweepFlag), i);
              break;
            case "z":
            case "Z":
              x = x0;
              y = y0;
          }
        }
        if (c === "M" || c === "m") {
          x0 = x;
          y0 = y;
        }
        ++i;
      }
    };

    return Main;

  })();

  new Main;

}).call(this);
