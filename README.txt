list_intersection.pl
	Get the intersection of two sets with the same keys.
	eg:
	perl list_intersection.pl set1 set2 outset
	
	set1:           set2:
	key1  value1	key2  value2
	key2  value2	key3  value3
	key3  value3	key4  value4
	
	outset:
	key2  value2
	key3  value3
	
cut_wav.py
	Cut wav with start and end.
	eg:
	python cut_wav.py wav.scp
	
	wav.scp:
	/home/raw.wav /home/cut.wav 0.85 1.75