#!/bin/bash


while [ 1 = 1 ]
LOG=~/plextuner.log
do
        PID=$(pidof "Plex Tuner Service")

        if [ -z "$PID" ]
        then
              date >> $LOG ; echo "---- Plex Tuner Not Running - Starting Up" >> $LOG

# You can remove 'docker exec -it -d plex' if not using a docker container

              docker exec -it -d  plex /usr/lib/plexmediaserver/Plex\ Tuner\ Service /usr/lib/plexmediaserver/Resources/Tuner/Private /usr/lib/plexmediaserver/Resources/Tuner/Shared 1.25.3.5385-f05b712b6 32600

              echo "Started - Sleeping for 5 seconds"
        else
              echo "Running - Checking if Listening"

              LISTENING=$(netstat -tnlp 2>/dev/null| grep :32600)

              if [ -z "$LISTENING" ]
                then
                        date >> $LOG ; echo "---- Plex Tuner Running But Not Listening - Killing Process" >> $LOG
                        killall -9 "Plex Tuner Service"

                else
                        echo "All Good - Sleeping for 5 seconds"
                fi
        fi

sleep 5
done
