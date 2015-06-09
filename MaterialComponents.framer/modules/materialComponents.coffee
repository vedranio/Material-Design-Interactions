# This module defines the Material Design components, such as cards, buttons etc
# These components may alternatively be defined in Sketch and imported into your project,
# but sometimes it is better to create them programatically (e.g. when you want to parametrise 
# some of the objects properties)

# Aim to define the geometry, but not behaviour of components in this module
# Hard and fast rules (like the size of the FAB) should be defined here, while transient and 
# variable properties such as opacilty and color, should be passed in


# ---------------------------------------------------------------------------------------------
# The Material Design Floating Action Button (FAB) 
# ---------------------------------------------------------------------------------------------

exports.fab = (superLayer, color, icon, initialOpacity, initialScale) ->

	diameter = 56
	fabExternalPadding = 16

	newFab = new Layer
		backgroundColor: color
		opacity: initialOpacity
		width: diameter
		height: diameter
		scale: initialScale
		borderRadius: diameter
		superLayer: superLayer
		html: icon
		style:
			"padding" : "10px 0"
			"text-align" : "center"
			"font-weight" : "light"
			"font-size" : "36px"
		x: superLayer.maxX - (diameter + fabExternalPadding)
		y: superLayer.maxY - (diameter + fabExternalPadding)

	return newFab

# ---------------------------------------------------------------------------------------------
# A simple card, that allows you to specify it's initial geometry (position and size)
# This is useful, because you can then expand this card AND return it to it's original size
# by accessing it's initial geometry 
#
# TODO: investigate if there is a better way to store the different states of the card object
#		e.g. using states to store the initial state, instead of having it as properties
#
# ---------------------------------------------------------------------------------------------
exports.card = (superLayer, initialColor, initialX, initialY, initialWidth, initialHeight, initialBorderRadius, initialOpacity, initialScale, shadowX, shadowY, shadowColor, shadowBlur, shadowSpread) ->
	
	# create a layer representing the card
	cardLayer = new Layer
		backgroundColor: initialColor
		x: initialX
		y: initialY
		width: initialWidth
		height: initialHeight
		borderRadius: initialBorderRadius
		opacity: initialOpacity
		scale: initialScale
		superLayer: superLayer
		shadowX: shadowX
		shadowY: shadowY
		shadowColor: shadowColor
		shadowBlur: shadowBlur
		shadowSpread: shadowSpread
		

	# The cardObject consists of the layer (the graphical representation of the card), and also stores it's initial geometry
	# We want to always remember the initial geometry, in case we need to change it during execution 
	cardObject =
		initialX: initialX
		initialY: initialY
		initialWidth: initialWidth
		initialHeight: initialHeight
		initialBorderRadius: initialBorderRadius
		initialOpacity: initialOpacity
		initialScale: initialScale
		cardLayer: cardLayer

	
	return cardObject
