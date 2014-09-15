function buildznc
	for d in wheezy sid;
		for a in amd64 i386;
			screen -d -m sbuild $d-$a-sbuild -d $d -a $a
			mv znc_*$a.* $a
		end
	end
end
