# plextunerfix
Restarts the plex tuner service if it crashes

## The issue
At the time that this repo has been created there appears to be an issue with Hauppage TV Tuners (and possibly others) in Plex. After changing TV chanels for an undetermined amount of times a message appears stating 'Could not tune channel. Please check your tuner or antenna'.

You can read more on the Plex forums on the following links;
https://forums.plex.tv/t/could-not-tune-channel-please-check-your-tuner-or-antenna/627995
https://forums.plex.tv/t/playback-error-and-tuner-service-hang-when-changing-to-new-channel-in-live-tv-dvr-tuner-segmentation-violation/737623


## Workaround
A couple of users in the forums mentioned a workaround for this issue by using a script that will automatically restart the Plex TV Tuner when it hangs.

https://forums.plex.tv/t/playback-error-and-tuner-service-hang-when-changing-to-new-channel-in-live-tv-dvr-tuner-segmentation-violation/737623/34

https://forums.plex.tv/t/could-not-tune-channel-please-check-your-tuner-or-antenna/627995/244


## The script
I have made a minor change to the script disaplyed on the Forum in order to make this work with Docker configured Plex servers but this change can be easily reverted. 
You can remove 'docker exec -it -d plex' from the script and it should work on a locally installed version of the Plex server.

## How to use it
Just copy the script to somewhere on the Plex server. If it is a docker based installation do not copy it to the container, this is not required. 
Make the script executable
````
chmod +x plextunerfix.sh
````
Then add the script to crontab to allow it to start up with the server
````
sudo crontab -e
````
Add 
````
@reboot bash /path/to/script/plextunerfix.sh &
````
to your cron configuration.

No just reboot your Plex server and if the Tuner Service hangs it should restart after a few seconds.




