function remove_subtitles;
	ffmpeg -i $argv[1] -c copy -sn $argv[2]
end
