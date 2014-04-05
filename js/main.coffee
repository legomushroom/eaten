class Main
  constructor:->
    # path = document.getElementById 'river-path'
    # console.log @convertToAbsolute path
    
    @vars()
    @initScroll()
    @describeSequence()
  vars:->
    @maxScroll = -8000
    @frameDurationTime = 1000
    @$treePath = $('#js-tree-path')
    @$riverPath = $('#js-river-path')
    @$skullPath = $('#js-skull-path')
    @$skull1 = $('#js-skull1')
    @$skull2 = $('#js-skull2')
    @$skull3 = $('#js-skull3')
    @$skull4 = $('#js-skull4')
    @$skull5 = $('#js-skull5')
    @$fish1 = $('#js-fish1')
    @$fish2 = $('#js-fish2')
    @$fish3 = $('#js-fish3')
    @$fish4 = $('#js-fish4')
    @$fish5 = $('#js-fish5')
    @$plate = $('#js-plate')
    @$fork = $('#js-fork')
    @$knife = $('#js-knife')
    @$logo = $('#js-logo')
    @$eatenPath = $('#js-eaten-path')
    @$tree = $('#js-tree')
    @$river = $('#js-river')
  initScroll:->
    @scroller = new IScroll '#js-main',
      probeType: 3
      mouseWheel: true
      deceleration: 0.001
    document.addEventListener 'touchmove', ((e)-> e.preventDefault()), false
    @controller = $.superscrollorama
      triggerAtCenter: false
      playoutAnimations: true
    it = @
    @scroller.on 'scroll',    -> it.updateScrollPos this, it
    @scroller.on 'scrollEnd', -> it.updateScrollPos this, it

  updateScrollPos:(that, it)->
    (that.y < it.maxScroll) and (that.y = it.maxScroll)
    it.controller.setScrollContainerOffset(0, -(that.y>>0))
      .triggerCheckAnim(true)

  describeSequence:->
    start = 1
    dur = 2*@frameDurationTime
    @treePath  = TweenMax.to { startOffset: 2800 }, 1,
      startOffset: 200
      onUpdate:=>
        offset = @treePath.target.startOffset
        @$treePath[0].setAttribute 'startOffset', offset

    @controller.addTween start, @treePath, dur

    start += @frameDurationTime/4
    dur = @frameDurationTime
    @tree  = TweenMax.to @$tree, 1, { opacity: 0, ease:"Expo.easeIn"}
    @controller.addTween start, @tree, dur

    start += @frameDurationTime/4
    dur = @frameDurationTime
    @grass  = TweenMax.to $(document.body), 1,
      backgroundColor: '#f5cf43'
      ease:"Expo.easeIn"

    @controller.addTween start, @grass, dur
    

    start += dur
    dur = 2*@frameDurationTime
    @river1  = TweenMax.to { startOffset: 2400 }, 1,
      startOffset: 200
      onUpdate:=>
        offset = @river1.target.startOffset
        @$riverPath[0].setAttribute 'startOffset', offset

    @controller.addTween start, @river1, dur

    start += dur/4
    dur = @frameDurationTime
    @river  = TweenMax.to @$river, 1, { fill: '#333'  }
    @controller.addTween start, @river, dur

    @grass2  = TweenMax.to $(document.body), 1,
      backgroundColor: '#774F38'
      ease:"Expo.easeIn"

    @controller.addTween start, @grass2, dur

    start += dur
    dur = 2*@frameDurationTime
    @skull  = TweenMax.to { startOffset: 2600 }, 1,
      startOffset: 100
      onUpdate:=>
        offset = @skull.target.startOffset
        @$skullPath[0].setAttribute 'startOffset', offset
    @controller.addTween start, @skull, dur

    start += dur/8
    dur = @frameDurationTime/2
    @skull3  = TweenMax.to @$skull3, 1, { opacity: .15  }
    @controller.addTween start, @skull3, dur
    @fish5  = TweenMax.to @$fish5, 1, { opacity: 0 }
    @controller.addTween start, @fish5, dur

    start += dur/4
    dur = @frameDurationTime/2
    @skull2  = TweenMax.to @$skull2, 1, { opacity: .15  }
    @controller.addTween start, @skull2, dur
    @fish4  = TweenMax.to @$fish4, 1, { opacity: 0 }
    @controller.addTween start, @fish4, dur

    start += dur/6
    dur = @frameDurationTime/2
    @skull1  = TweenMax.to @$skull1, 1, { opacity: .15  }
    @controller.addTween start, @skull1, dur
    @fish3  = TweenMax.to @$fish3, 1, { opacity: 0 }
    @controller.addTween start, @fish3, dur

    start += dur/6
    dur = @frameDurationTime/2
    @skull5  = TweenMax.to @$skull5, 1, { opacity: .15  }
    @controller.addTween start, @skull5, dur
    @fish2  = TweenMax.to @$fish2, 1, { opacity: 0 }
    @controller.addTween start, @fish2, dur

    start += dur/6
    dur = @frameDurationTime/2
    @skull4  = TweenMax.to @$skull4, 1, { opacity: .15  }
    @controller.addTween start, @skull4, dur
    @fish1  = TweenMax.to @$fish1, 1, { opacity: 0 }
    @controller.addTween start, @fish1, dur

    start += dur
    dur = @frameDurationTime
    @plate  = TweenMax.to { startOffset: 1000 }, 1,
      startOffset: 0
      onUpdate:=>
        offset = @plate.target.startOffset
        @$plate[0].setAttribute 'y', offset
    @controller.addTween start, @plate, dur

    start += dur/2
    dur = 2*@frameDurationTime
    @eaten  = TweenMax.to { startOffset: 2600 }, 1,
      startOffset: 880
      onUpdate:=>
        offset = @eaten.target.startOffset
        @$eatenPath[0].setAttribute 'startOffset', offset

    @controller.addTween start, @eaten, dur

    start += dur/2
    dur = @frameDurationTime
    @forkTween  = TweenMax.to { startOffset: 1000 }, 1,
      startOffset: 50
      onUpdate:=>
        offset = @forkTween.target.startOffset
        @$fork[0].setAttribute 'transform', "translate(0,#{offset})"
        @$knife[0].setAttribute 'transform', "translate(0,#{offset})"
    @controller.addTween start, @forkTween, dur

    start += dur
    dur = @frameDurationTime/2
    @logo  = TweenMax.to @$logo, 1, { opacity: 1 }
    @controller.addTween start, @logo, dur

  bind:(func, context) ->
    wrapper = ->
      args = Array::slice.call(arguments)
      unshiftArgs = bindArgs.concat(args)
      func.apply context, unshiftArgs
    bindArgs = Array::slice.call(arguments, 2)
    wrapper

  convertToAbsolute:(path) ->
    x0 = undefined
    y0 = undefined
    x1 = undefined
    y1 = undefined
    x2 = undefined
    y2 = undefined
    segs = path.pathSegList
    x = 0
    y = 0
    i = 0
    len = segs.numberOfItems

    while i < len
      seg = segs.getItem(i)
      c = seg.pathSegTypeAsLetter
      if /[MLHVCSQTA]/.test(c)
        x = seg.x  if "x" of seg
        y = seg.y  if "y" of seg
      else
        x1 = x + seg.x1  if "x1" of seg
        x2 = x + seg.x2  if "x2" of seg
        y1 = y + seg.y1  if "y1" of seg
        y2 = y + seg.y2  if "y2" of seg
        x += seg.x  if "x" of seg
        y += seg.y  if "y" of seg
        switch c
          when "m"
            segs.replaceItem path.createSVGPathSegMovetoAbs(x, y), i
          when "l"
            segs.replaceItem path.createSVGPathSegLinetoAbs(x, y), i
          when "h"
            segs.replaceItem path.createSVGPathSegLinetoHorizontalAbs(x), i
          when "v"
            segs.replaceItem path.createSVGPathSegLinetoVerticalAbs(y), i
          when "c"
            segs.replaceItem path.createSVGPathSegCurvetoCubicAbs(x, y, x1, y1, x2, y2), i
          when "s"
            segs.replaceItem path.createSVGPathSegCurvetoCubicSmoothAbs(x, y, x2, y2), i
          when "q"
            segs.replaceItem path.createSVGPathSegCurvetoQuadraticAbs(x, y, x1, y1), i
          when "t"
            segs.replaceItem path.createSVGPathSegCurvetoQuadraticSmoothAbs(x, y), i
          when "a"
            segs.replaceItem path.createSVGPathSegArcAbs(x, y, seg.r1, seg.r2, seg.angle, seg.largeArcFlag, seg.sweepFlag), i
          when "z", "Z"
            x = x0
            y = y0
      
      # Record the start of a subpath
      if c is "M" or c is "m"
        x0 = x
        y0 = y
      ++i
    return

new Main