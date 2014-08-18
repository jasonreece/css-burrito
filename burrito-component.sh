#! /bin/bash

if [ $# -ne 2 ]; then
    echo 'Oops, please pass in two arguments - preferably the module name as the first argument,'
    echo ' and descriptive text about the component as the second.'
    echo ''
    echo 'The goal is to output a snippet that looks like this:'
    echo ''
    echo '/ ----- example-component ---- //'
    echo '%example-l-component {'
    echo '  // write layout code here...'
    echo '}'
    echo ''
    echo '%example-s-component {'
    echo '  // write skin code here...'
    echo '}'
    echo ''
    echo '%example-t-component {'
    echo '  // write typography code here...'
    echo '}'
    echo ''
    echo '.example-c-component {'
    echo '  @extend %example-l-component;'
    echo '  @extend %example-s-component;'
    echo '  @extend %example-t-component;'
    echo '}'

    echo ''
    echo 'Then, simply paste your newly created snippet into your text editor.'
    exit 1
fi

echo '/ ----- '$1'-'$2 '---- //' >> snippet.txt
echo '%'$1'-l-'$2' {' >> snippet.txt
echo '  ' >> snippet.txt
echo '}' >> snippet.txt
echo '' >> snippet.txt
echo '%'$1'-s-'$2' {' >> snippet.txt
echo '  ' >> snippet.txt
echo '}' >> snippet.txt
echo '' >> snippet.txt
echo '%'$1'-t-'$2' {' >> snippet.txt
echo '  ' >> snippet.txt
echo '}' >> snippet.txt
echo '' >> snippet.txt
echo '.'$1'-c-'$2' {' >> snippet.txt
echo '  @extend %'$1'-l-'$2';' >> snippet.txt
echo '  @extend %'$1'-s-'$2';' >> snippet.txt
echo '  @extend %'$1'-t-'$2';' >> snippet.txt
echo '}' >> snippet.txt

echo ''
echo 'This is your snippet:'
echo ''
cat snippet.txt
echo ''
echo 'If this looks tasty, switch to your editor, and hit paste.'
cat snippet.txt | pbcopy  && rm snippet.txt