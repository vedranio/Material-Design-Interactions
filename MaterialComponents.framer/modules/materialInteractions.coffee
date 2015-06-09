	# This module defines the Material Design animations which are triggered when you interact with 
# a UI component. For example, when you tap/click a card, you see that ripple effect and the card
# lifts slightly 

raiseLayerShadowMultiplier = 4

# ---------------------------------------------------------------------------------------------
# Raise and lower a layer by animating it's size and shadow properties
# Example use cases: clicking a button or a card
# ---------------------------------------------------------------------------------------------
exports.raiseAndLowerLayer = (layer) ->

	initialShadowBlur = layer.shadowBlur
	inialShadowSpread = layer.shadowSpread

	
	# define the animations 
	raiseLayerAnimation = new Animation
		layer: layer
		properties:
			scale: 1.01
			shadowBlur: initialShadowBlur * raiseLayerShadowMultiplier
			shadowSpread: inialShadowSpread * raiseLayerShadowMultiplier
		time: 0.2
		curve: "ease-in-out"

	lowerlayerAnimation = new Animation
		layer: layer
		properties:
			scale: 1
			shadowBlur: initialShadowBlur
			shadowSpread: inialShadowSpread
		delay: 0.4
		time: 0.4
		curve: "ease-in-out"

	
	raiseLayerAnimation.start()
	
	raiseLayerAnimation.on "end", -> 
		lowerlayerAnimation.start()

# ---------------------------------------------------------------------------------------------
# Raise a layer by animating it's size and shadow properties
# Example use cases: clicking a button or a card
# ---------------------------------------------------------------------------------------------
exports.raiseLayer = (layer) ->

	# define the animations 
	raiseLayerAnimation = new Animation
		layer: layer
		properties:
			scale: 1.01
			shadowBlur: layer.shadowBlur * raiseLayerShadowMultiplier
			shadowSpread: layer.shadowSpread * raiseLayerShadowMultiplier
		time: 0.2
		curve: "ease-in-out"

	
	raiseLayerAnimation.start()

# ---------------------------------------------------------------------------------------------
# Expand the layer horizontally to the borders of it's container
# Example use case: clicking a card causes it to raise, then expand horizontally and vertically
# ---------------------------------------------------------------------------------------------
exports.expandHorizontally = (layer, animationDelay) ->
	
	# define the animations 
	exandHorizontallyAnimation = new Animation
		layer: layer
		properties:
			width: layer.superLayer.width
			x: layer.superLayer.x
		delay: animationDelay
		time: 0.2
		curve: "ease-in-out"

	
	exandHorizontallyAnimation.start()

# ---------------------------------------------------------------------------------------------
# Shrink the layer horizontally to it's original size
# Example use case: collapsing a card previously opened
# ---------------------------------------------------------------------------------------------
exports.shrinkHorizontally = (layer, animationDelay) ->
	

	layer.states.animationOptions = 
		delay: animationDelay
		time: 0.2
		curve: "ease-in-out"

	layer.states.switch("initialWidth")
		
	
		
	


# ---------------------------------------------------------------------------------------------
# Expand the layer vertically to the borders of it's container
# Example use case: clicking a card causes it to raise, then expand horizontally and vertically
# ---------------------------------------------------------------------------------------------
exports.expandVertically = (layer, animationDelay) ->
	
	# define the animations 
	expandVerticallyAnimation = new Animation
		layer: layer
		properties:
			height: layer.superLayer.height
			y: layer.superLayer.y
		delay: animationDelay
		time: 0.2
		curve: "ease-in-out"

	
	expandVerticallyAnimation.start()


# ---------------------------------------------------------------------------------------------
# Shrink the layer vertically to it's original size
# Example use case: collapsing a card previously opened
# ---------------------------------------------------------------------------------------------
exports.shrinkVertically = (layer, animationDelay) ->
	
	layer.states.animationOptions = 
		delay: animationDelay
		time: 0.2
		curve: "ease-in-out"

	layer.states.switch("initialHeight")


# ---------------------------------------------------------------------------------------------
# Rotate layer
# ---------------------------------------------------------------------------------------------
exports.rotateLayer = (layer, rotationAngle) ->
	
	# define the animations 
	rotateAnimation = new Animation
		layer: layer
		properties:
			rotation: rotationAngle
		time: 0.2
		curve: "ease-in-out"

	
	rotateAnimation.start()

# ---------------------------------------------------------------------------------------------
# Move layer
# ---------------------------------------------------------------------------------------------
exports.moveLayer = (layer, moveByX, moveByY, moveDelay) ->
	
	# define the animations 
	moveAnimation = new Animation
		layer: layer
		properties:
			x: layer.x + moveByX
			y: layer.y + moveByY
		delay: moveDelay
		time: 0.2
		curve: "ease-in-out"	
		# curve: "spring(600,40,10,0)"

	
	moveAnimation.start()

# ---------------------------------------------------------------------------------------------
# Simulate the material design surface ripple effect
# ---------------------------------------------------------------------------------------------
exports.rippleEffect = (touchX, touchY, layer) ->
	
	layer.clip = true

	ripple = new Layer
		borderRadius: "50%"
		scale: 0
		opacity: .5
		superLayer: layer
		backgroundColor: layer.backgroundColor
		brightness: 75
		midX: touchX
		midY: touchY
		index: 0
		force2d: true	
		
	rippleAnimation = ripple.animate
		properties: 
			scale: layer.width / 50
			clip: true
			opacity: 0
		curve: "ease-out"
		time: .3
	
	rippleAnimation.on Events.AnimationEnd, -> 
		ripple.destroy()

# ---------------------------------------------------------------------------------------------
# Simulate the material design animation when an icon is tapped
# ---------------------------------------------------------------------------------------------
exports.animateIconBounds = (icon, iconBoundsColor) ->

	iconTapBounds = new Layer
		backgroundColor: iconBoundsColor
		opacity: 0.5
		brightness: 75
		width:45
		height:45
		borderRadius:45
		midX: icon.midX
		midY: icon.midY
		
	iconTapBounds.animate
		properties:
			opacity: 0
		curve: "ease-out"
		time: 0.5

	iconTapBounds.on Events.AnimationEnd, ->
		iconTapBounds.animate
			properties:
				opacity: 0
			curve: "ease-in-out"
		iconTapBounds.destroy()


# ---------------------------------------------------------------------------------------------
# animate the layer in from it's centre
# ---------------------------------------------------------------------------------------------
exports.appearFromCentre = (layer, animationDelay) ->

	layer.bringToFront()

	animation = new Animation
		layer: layer
		properties:
			opacity: 1
			scale: 1
		delay: animationDelay
		curve: "spring(100,20,25)"

	animation.start()


# ---------------------------------------------------------------------------------------------
# show layer with a delay
# ---------------------------------------------------------------------------------------------
exports.showWithDelay = (layer, animationDelay) ->

	layer.bringToFront()

	animation = new Animation
		layer: layer
		properties:
			opacity: 1
			scale: 1
		delay: animationDelay
		time: 0.2
		curve: "ease-in-out"

	animation.start()




