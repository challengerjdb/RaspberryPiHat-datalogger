#!/bin/sh

#suppresses automatic printout errors
export QT_LOGGING_RULES="qt5ct.debug=false"
#export XDG_RUNTIME_DIR=/tmp/runtime-root

#running the two programs simultaneously 
echo ""
echo "running data logging and live plotting"
sudo python3 -c 'import main; main.run_main()' &
python3 -c 'import plotter; plotter.live_plotter()' &
