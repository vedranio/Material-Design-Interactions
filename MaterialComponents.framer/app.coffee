materialColors = require "colors"
materialInteractions = require "materialInteractions"

# Set up the display
Framer.Device.deviceType = "nexus-5-black"

background = new Layer
	backgroundColor: materialColors.screenBackground
	width: Framer.Device.screen.width
	height: Framer.Device.screen.height


# UI elements for demo --------------------------------------------------------

cardShadowX = -2
cardShadowY = 4
cardShadowBlur = 10
cardShadowSpread = 0

cardBorderRadius = 10
cardBackgroundColor = materialColors.white
cardShadowColor = materialColors.cardShadow


# Set up UI elements we will showcase the interactions on
card1 = new Layer
	backgroundColor: cardBackgroundColor
	width: Framer.Device.screen.width * 0.6
	height: Framer.Device.screen.height * 0.1
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
	width: Framer.Device.screen.width * 0.6
	height: Framer.Device.screen.height * 0.1
	midX: background.midX
	y: card1.maxY + 40
	borderRadius: cardBorderRadius
	shadowX: cardShadowX
	shadowY: cardShadowY
	shadowColor: cardShadowColor
	shadowBlur: cardShadowBlur
	shadowSpread: cardShadowSpread
	superLayer: background

card3 = new Layer
	backgroundColor: cardBackgroundColor
	width: Framer.Device.screen.width * 0.6
	height: Framer.Device.screen.height * 0.1
	midX: background.midX
	y: card2.maxY + 40
	borderRadius: cardBorderRadius
	shadowX: cardShadowX
	shadowY: cardShadowY
	shadowColor: cardShadowColor
	shadowBlur: cardShadowBlur
	shadowSpread: cardShadowSpread
	superLayer: background
	
card4 = new Layer
	backgroundColor: cardBackgroundColor
	width: Framer.Device.screen.width * 0.6
	height: Framer.Device.screen.height * 0.3
	midX: background.midX
	y: card3.maxY + 160
	borderRadius: cardBorderRadius
	shadowX: cardShadowX
	shadowY: cardShadowY
	shadowColor: cardShadowColor
	shadowBlur: cardShadowBlur
	shadowSpread: cardShadowSpread
	superLayer: background
	
fab = new Layer
	backgroundColor: materialColors.seekPink
	width: 200
	height: 200
	borderRadius: "100%"
	x: background.maxX - 232
	y: background.maxY			# I want it off screen initially
	superLayer: background
	
fabLabel = new Layer
	superLayer: fab
	width: fab.width
	height: fab.height
	backgroundColor: "transparent"
	html: "+"
	style:
		"padding" : "75px 0"
		"text-align" : "center"
		"font-weight" : "light"
		"font-size" : "82px"

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
	fab.bringToFront()
	materialInteractions.expandVertically(card4, 0.6)
	materialInteractions.moveLayer(fab, 0, -232, 1)
	
		
fab.on Events.Click, (event)->
	materialInteractions.rotateLayer(fab, 135)
	
	
	
# --------------------------------------------------------------------------


