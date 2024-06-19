#!/bin/bash

CHECKINS_DIR="/Users/swagnikdutta/checkins"

ch() {
	cur_year=$(date +%Y)
	y_dir_path="$CHECKINS_DIR/$cur_year"

	if [ ! -d $y_dir_path ]; then
		mkdir $y_dir_path
	fi

	cur_month=$(date "+%B")
	complete_dir_path="$y_dir_path/$cur_month"

	if [ ! -d $complete_dir_path ]; then
		mkdir $complete_dir_path
	fi

	fp="$complete_dir_path/$(date "+%A, %b %d").md"
	
	# fp contains spaces
	if [ ! -e "$fp" ]; then	
		touch "$fp"
	fi

	tmp_fp="$complete_dir_path/tmp.md"
	touch "$tmp_fp"

	content_inv=$(tail -r "$fp")
	echo "$content_inv" > "$tmp_fp"

	entry_note="- $(date "+%A %b %d, %H:%M") | "

	echo $entry_note >> "$tmp_fp"
	content_inv=$(tail -r "$tmp_fp")

	echo "$content_inv" > "$fp"
	rm "$tmp_fp"

	vi "$fp"
}

