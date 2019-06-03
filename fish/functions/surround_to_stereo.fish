function surround_to_stereo;
	ffmpeg -i $argv[1] -c:v copy -c:a aac -af "pan=stereo|FL < 1.0*FL + 0.707*FC + 0.707*BL|FR < 1.0*FR + 0.707*FC + 0.707*BR" -sn $argv[2]
end
