#!/bin/sh

tex_destination="code.tex"

reduce_path_to_test_name () {
    local fullpath=$1
    local filename="${fullpath##*/}" # strip the preceding path
    test_name="${filename%.*}"       # strip the file type & set a global variable
}

# GENERATED FORMAT
#
# {filename}
# \begin{verbatim
#   {CODE}
# \end{verbatim

list_files () { # pass in a pattern
    for file in $(find rapid/ -name *\.$1)
    do
        reduce_path_to_test_name "$file"
        echo "$test_name" >> "$tex_destination"
        echo "" >> $tex_destination
        echo "\begin{verbatim}" >> $tex_destination
        cat "$file" >> "$tex_destination"
        echo "\end{verbatim}" >> $tex_destination
        echo "" >> $tex_destination
    done
}

# clear the file
echo "" > "$tex_destination"

# add all the code
list_files mly
list_files mll
list_files ml
list_files rapid

