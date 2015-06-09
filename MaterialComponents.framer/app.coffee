# Import the required resources
resources = Framer.Importer.load "imported/resources"
materialColors = require "colors"
materialInteractions = require "materialInteractions"
materialComponents = require "materialComponents"

# Set up the display
Framer.Device.deviceType = "nexus-5-black"

# By default, Framer device width is 1080px
# The screen with in Sketch is 360px and I'm generally designing at 1x
# So, I need to set the device content scale to 3, to fill the screen 
Framer.Device.contentScale = 3


# This will be the superlayer for everything we add to the screen
# It takes up the full screen, so needs to be scalled the same way
# we scale the rest of the content
background = new Layer
	backgroundColor: materialColors.screenBackground
	width: Framer.Device.screen.width / Framer.Device.contentScale
	height: Framer.Device.screen.height / Framer.Device.contentScale
	
# screen edge margin
screenEdgeMaring = 16






# UI elements for demo --------------------------------------------------------

cardShadowX = -2
cardShadowY = 2
cardShadowBlur = 2
cardShadowSpread = 0

cardBorderRadius = 2
cardBackgroundColor = materialColors.white
cardShadowColor = materialColors.cardShadow

cardSpacer = 20


# Set up UI elements we will showcase the interactions on
card1 = new Layer
	backgroundColor: cardBackgroundColor
	width: background.width * 0.6
	height: background.height * 0.1
	midX: background.midX
	y: background.midY/5
	borderRadius: cardBorderRadius
	shadowX: cardShadowX
	shadowY: cardShadowY
	shadowColor: cardShadowColor
	shadowBlur: cardShadowBlur
	shadowSpread: cardShadowSpread
	superLayer: background
	
card2 = new Layer
	backgroundColor: cardBackgroundColor
	width: background.width * 0.6
	height: background.height * 0.1
	midX: background.midX
	y: card1.maxY + cardSpacer
	borderRadius: cardBorderRadius
	shadowX: cardShadowX
	shadowY: cardShadowY
	shadowColor: cardShadowColor
	shadowBlur: cardShadowBlur
	shadowSpread: cardShadowSpread
	superLayer: background

card3 = new Layer
	backgroundColor: cardBackgroundColor
	width: background.width * 0.6
	height: background.height * 0.1
	midX: background.midX
	y: card2.maxY + cardSpacer
	borderRadius: cardBorderRadius
	shadowX: cardShadowX
	shadowY: cardShadowY
	shadowColor: cardShadowColor
	shadowBlur: cardShadowBlur
	shadowSpread: cardShadowSpread
	superLayer: background
	
# the fab with a Plus sign is added to the bottom card and hidden initially
fab = materialComponents.fab(background, materialColors.seekPink, "+", 0, 0)

# This is a card whose size we want to change, but also want to be able to revert back 
# to it's original dimensions
card4 = materialComponents.card(
	background,						# superLayer 
	cardBackgroundColor, 			# card color
	card3.x,						# x
	card3.maxY + (cardSpacer*3),	# y
	background.width * 0.6,			# width
	background.height * 0.3,		# height
	cardBorderRadius,				# borderRadius
	1,								# opacity
	1,								# scale
	cardShadowX,
	cardShadowY,
	cardShadowColor,
	cardShadowBlur,
	cardShadowSpread
)


# favoriteIcon = resources['favorite']
# favoriteIcon.superLayer = card4
# favoriteIcon.maxX = background.maxX - favoriteIcon.width
# favoriteIcon.minY = background.minY + favoriteIcon.height

closeIcon = resources['close']
closeIcon.superLayer = background
closeIcon.maxX = background.maxX - screenEdgeMaring
closeIcon.minY = background.minY + screenEdgeMaring
closeIcon.opacity = 0






# Event handlers ------------------------------------------------------------

card1.on Events.Click, (event)->
	materialInteractions.rippleEffect(event.offsetX, event.offsetY, card1)
	materialInteractions.raiseAndLowerLayer(card1)


card2.on Events.Click, (event)->
	materialInteractions.rippleEffect(event.offsetX, event.offsetY, card2)
	materialInteractions.raiseAndLowerLayer(card2)


card3.on Events.Click, (event)->
	materialInteractions.rippleEffect(event.offsetX, event.offsetY, card3)
	materialInteractions.raiseAndLowerLayer(card3)


card4.cardLayer.on Events.Click, (event)->
	card4.cardLayer.bringToFront()
	materialInteractions.rippleEffect(event.offsetX, event.offsetY, card4.cardLayer)
	materialInteractions.raiseLayer(card4.cardLayer)
	materialInteractions.expandHorizontally(card4.cardLayer, 0.2)
	materialInteractions.expandVertically(card4.cardLayer, 0.6)
	materialInteractions.appearFromCentre(fab, 1)
	materialInteractions.showWithDelay(closeIcon,1)

fab.on Events.Click, (event)->
	materialInteractions.rotateLayer(fab, 135)

closeIcon.on Events.Click, (event)->
	materialInteractions.animateIconBounds(closeIcon, materialColors.white)
	materialInteractions.shrinkVertically(
		card4.cardLayer,
		card4.initialY, 
		card4.initialHeight, 
		0.2)
	materialInteractions.shrinkHorizontally(
		card4.cardLayer,
		card4.initialX, 
		card4.initialWidth, 
		0.6)


# --------------------------------------------------------------------------

# TODO before the hackathon

# get ripple effect working on device
# shrink/close card
# slide in/out side drawer
# sequentially load items down the page (e.g. search results on SERP page)
# bring up menu options from FAB
# animate from one icon into another (pass two sketch resources icons in)
# radial expansion of a layer (e.g. skrid from FAB)
# animate seek logo


