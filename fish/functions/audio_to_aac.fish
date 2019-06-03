function audio_to_aac;
	ffmpeg -i $argv[1] -c:v copy -c:a aac -sn $argv[2]
end
