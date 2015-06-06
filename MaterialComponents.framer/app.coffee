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
	
card4 = new Layer
	backgroundColor: cardBackgroundColor
	width: background.width * 0.6
	height: background.height * 0.3
	midX: background.midX
	y: card3.maxY + (cardSpacer*3)
	borderRadius: cardBorderRadius
	shadowX: cardShadowX
	shadowY: cardShadowY
	shadowColor: cardShadowColor
	shadowBlur: cardShadowBlur
	shadowSpread: cardShadowSpread
	superLayer: background


# the fab with a Plus sign is added to the bottom card and hidden initially
fab = materialComponents.fab(background, materialColors.seekPink, "+", 0, 0)


# favoriteIcon = resources['favorite']
# favoriteIcon.superLayer = card4
# favoriteIcon.maxX = background.maxX - favoriteIcon.width
# favoriteIcon.minY = background.minY + favoriteIcon.height





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


card4.on Events.Click, (event)->
	card4.bringToFront()
	materialInteractions.rippleEffect(event.offsetX, event.offsetY, card4)
	materialInteractions.raiseLayer(card4)
	materialInteractions.expandHorizontally(card4, 0.2)
	materialInteractions.expandVertically(card4, 0.6)
	fab.bringToFront()
	materialInteractions.appearFromCentre(fab, 1)

fab.on Events.Click, (event)->
	materialInteractions.rotateLayer(fab, 135)


# --------------------------------------------------------------------------


