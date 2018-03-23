#!/usr/bin/env fish

set conv_table (cat conversion.txt)

function convert --argument input
  set -l kana
  while test -n "$input"
    for nchar in 3 2 1
      set -l tok (string sub --length=$nchar "$input")
      # echo "tok: $tok"
      # echo "looking for: 	$tok"'$'
      set -l matches (cat ./conversion.txt | grep "	$tok"'$')
      # echo "matches: $matches"
      if test -n "$matches"
        set kana (string sub --length=1 "$matches")
        set input (string sub --start=(math 1 + $nchar) "$input")
        # echo "new input: $input"
        break
      else
        # echo "didn't find: $tok (matches: $matches)"
      end
    end

    if test -n "$kana"
      echo -n "$kana"
      set -e kana
    else
      echo "Error translating."
    end
  end
  echo
end

function convert_read_lines
  while read line
    convert "$line"
  end
end

convert_read_lines