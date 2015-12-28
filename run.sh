#!/bin/bash

# Utility function to trim whitespaces (as seen on http://stackoverflow.com/a/3352015)
trim() {
    local var="$*"
    var="${var#"${var%%[![:space:]]*}"}"   # remove leading whitespace characters
    var="${var%"${var##*[![:space:]]}"}"   # remove trailing whitespace characters
    echo -n "$var"
}

CONFIGFILE=config.vars
if [ -r ${CONFIGFILE} ]; then
  # Read the configfile if it's existing and readable
  source ${CONFIGFILE}
fi

banner=1;
while(TRUE)
    do
        echo "---BANNER $banner---"
        echo "Clicking Banner"
        $ADB shell input tap $AD_X $AD_Y
        sleep 2

        echo "Close any error alert"
        $ADB shell input tap $AD_X $AD_Y
        sleep 2

        echo "Click banner again"
        $ADB shell input tap $AD_X $AD_Y

        echo "Watching Ad..."
        sleep 20
        
        orientation=$($ADB shell dumpsys input | grep 'SurfaceOrientation' | awk '{ print $2 }')
        orientation=$(trim $orientation)
        echo "Orientation value is $orientation"
        if [ "$orientation" == "1" ] || [ "$orientation" = "3" ]; then
            echo "Swipe to gift"
            $ADB shell input swipe $SWIPE_GIFT_FROM_X $SWIPE_GIFT_FROM_Y $SWIPE_GIFT_TO_X $SWIPE_GIFT_TO_Y 100
            sleep 4
            echo "Click close (on landscape)"
            $ADB shell input tap $LANDSCAPE_CLOSE_AD_X $LANDSCAPE_CLOSE_AD_Y
        else 
            echo "Click close (on portrait)"
            $ADB shell input tap $PORTRAIT_CLOSE_AD_X $PORTRAIT_CLOSE_AD_Y
        fi
        sleep 4

        echo "Click alert"
        $ADB shell input tap $AD_X $AD_Y
        sleep 2

        ((banner++))
    done