function convert_flac_album;
	mkdir m4a
	for file in *.flac
		ffmpeg -i $file -vn -c:a alac m4a/(basename $file .flac).m4a
	end
	open m4a
end
