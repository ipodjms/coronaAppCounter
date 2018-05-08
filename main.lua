
------------------------------
-- BEGIN SAMPLE CODE
------------------------------

-- Load libraries/plugins
local widget = require( "widget" )

local options = 
{
    text = "",     
    x = display.contentWidth / 2,
    y = display.contentHeight / 2 - 20,
    font = native.systemFont,   
    fontSize = 20,
    align = "right"  -- Alignment parameter
}
 
myCounterText = display.newText( options )
myCounterText:setFillColor( 1,1, 1 )

local options = 
{
    text = "PRESS COMMAND + R ",     
    x = display.contentWidth / 2,
    y = display.contentHeight / 2 + myCounterText.height,
    font = native.systemFont,   
    fontSize = 20,
    align = "right"  -- Alignment parameter
}
 
reloadText = display.newText( options )
reloadText:setFillColor( 1,1, 1 )

print (display.contentWidth)

-- Increments the number of time this app has been launched by 1 and saves to storage
local function incrementAppLaunchCount()
	-- First, read the last stored count from the app's preferences
	-- Will return nil if the preference does not exist, which happens on first launch
	local launchCount = system.getPreference( "app", "appLaunchCount", "number" )
	if ( launchCount == nil ) or ( launchCount < 0 ) then
		launchCount = 0
		myCounterText.text = launchCount
	end

	-- Increment the launch count and save it to storage
	launchCount = launchCount + 1
	system.setPreferences( "app", { appLaunchCount = launchCount } )
	print("your app open " .. launchCount .. " times")
	myCounterText.text = launchCount
end
incrementAppLaunchCount()
