function video_to_x264;
	ffmpeg -i $argv[1] -c:a copy -c:v libx264 -sn $argv[2]
end
