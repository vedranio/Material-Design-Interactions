# Raise and lower a layer by animating it's size and shadow properties
exports.raiseAndLowerLayer = (layer) ->
	
	# define the animations 
	raiseLayerAnimation = new Animation
		layer: layer
		properties:
			scale: 1.01
			shadowBlur:20
			shadowSpread:4
		time: 0.2
		curve: "ease-in-out"

	lowerlayerAnimation = new Animation
		layer: layer
		properties:
			scale: 1
			shadowBlur:10
			shadowSpread:0
		delay: 0.4
		time: 0.4
		curve: "ease-in-out"

	
	raiseLayerAnimation.start()
	
	raiseLayerAnimation.on "end", -> 
		lowerlayerAnimation.start()

# Raise a layer by animating it's size and shadow properties
exports.raiseLayer = (layer) ->
	
	# define the animations 
	raiseLayerAnimation = new Animation
		layer: layer
		properties:
			scale: 1.01
			shadowBlur:20
			shadowSpread:4
		time: 0.2
		curve: "ease-in-out"

	
	raiseLayerAnimation.start()

# Expand the layer horizontally to the borders of it's container
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

# Expand the layer vertically to the borders of it's container
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

# Rotate layer
exports.rotateLayer = (layer, rotationAngle) ->
	
	# define the animations 
	rotateAnimation = new Animation
		layer: layer
		properties:
			rotation: rotationAngle
		time: 0.2
		curve: "ease-in-out"

	
	rotateAnimation.start()


# Move layer
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


# Simulate the material design surface ripple effect
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
	
	rippleAnimation.on "end", -> 
		ripple.destroy()
