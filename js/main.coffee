class Main
  constructor:->
    @vars()
    @initScroll()
    @describeSequence()
  vars:->
    @maxScroll = -10000
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
      backgroundColor: '#c78743'
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
    @skull3  = TweenMax.to @$skull3, 1, { opacity: .25  }
    @controller.addTween start, @skull3, dur
    @fish5  = TweenMax.to @$fish5, 1, { opacity: 0 }
    @controller.addTween start, @fish5, dur

    start += dur/4
    dur = @frameDurationTime/2
    @skull2  = TweenMax.to @$skull2, 1, { opacity: .25  }
    @controller.addTween start, @skull2, dur
    @fish4  = TweenMax.to @$fish4, 1, { opacity: 0 }
    @controller.addTween start, @fish4, dur

    start += dur/6
    dur = @frameDurationTime/2
    @skull1  = TweenMax.to @$skull1, 1, { opacity: .25  }
    @controller.addTween start, @skull1, dur
    @fish3  = TweenMax.to @$fish3, 1, { opacity: 0 }
    @controller.addTween start, @fish3, dur

    start += dur/6
    dur = @frameDurationTime/2
    @skull5  = TweenMax.to @$skull5, 1, { opacity: .25  }
    @controller.addTween start, @skull5, dur
    @fish2  = TweenMax.to @$fish2, 1, { opacity: 0 }
    @controller.addTween start, @fish2, dur

    start += dur/6
    dur = @frameDurationTime/2
    @skull4  = TweenMax.to @$skull4, 1, { opacity: .25  }
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
      startOffset: 800
      onUpdate:=>
        offset = @eaten.target.startOffset
        @$eatenPath[0].setAttribute 'startOffset', offset
    @controller.addTween start, @eaten, dur

    start += dur/2
    dur = @frameDurationTime
    @forkTween  = TweenMax.to { startOffset: 1000 }, 1,
      startOffset: -150
      onUpdate:=>
        offset = @forkTween.target.startOffset
        @$fork[0].setAttribute 'y', offset
    @controller.addTween start, @forkTween, dur

    start += dur/6
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

new Main