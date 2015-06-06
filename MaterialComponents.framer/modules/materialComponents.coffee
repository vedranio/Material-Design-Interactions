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
