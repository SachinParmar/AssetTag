#!/bin/sh
#osascript -e 'tell application "System Events" to set visible of process "Self Service" to false'

asset=$(/usr/bin/osascript <<-'__EOF__'
tell application "System Events"
  activate
  set input to display dialog "Enter [YOUR COMPANY NAME HERE] Asset Tag: " default answer "" buttons {"OK"} default button 1
  return text returned of input as string
end tell
__EOF__
)

jamf recon -assetTag $asset

exit
