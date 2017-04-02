local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")
JSON=require("json")
require("GenGraph")
--------------------------------------------------------------------


function scene:create(event)
	local sceneGroup = self.view
	print("Scene #1 : create")
end

function scene:show(event)
	local sceneGroup = self.view
	local phase = event.phase
	if(phase == "will") then
		print("Scene #1 : show (will)")
		mytext=display.newText("อุณหภูมิแต่ละจังหวัดในประเทศไทย",165,0,native.systemFont,22)
		requestWheather()
		display.setDefault("background",0,0,0.2)

	elseif(phase == "did") then
		print("Scene #1 : show (did)")
	
	end
end

function scene:hide(evevt)
	local sceneGroup = self.view
	local phase = evevt.phase
	if(phase == "will") then

		print("Scene #1 : hide (will)")
	elseif(phase == "did") then
		print("Scene #1 : hide (did)")
	end
end

function scene:destroy(evevt)
	local sceneGroup = self.view
	print("Scene #1 : destroy")
end

cw,ch = display.contentWidth, display.contentHeight
cx = display.contentCenterX
cy = display.contentCenterY
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene

