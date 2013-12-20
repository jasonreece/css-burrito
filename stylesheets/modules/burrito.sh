#! /bin/bash

MINPARAMS=1

touch _$1.scss

cap="$(tr '[:lower:]' '[:upper:]' <<< ${1:0:1})${1:1}"

echo '// -------------------------------------' >> _$1.scss
echo '// - '$cap 'Module' >> _$1.scss
echo '// -------------------------------------' >> _$1.scss
echo '// ----- Styles for the '$cap 'Module' >> _$1.scss
echo '// -------------------------------------' >> _$1.scss
echo '' >> _$1.scss
echo '// -------------------------------------' >> _$1.scss
echo '//   Header' >> _$1.scss
echo '// -------------------------------------' >> _$1.scss
echo '' >> _$1.scss
echo '' >> _$1.scss
echo '// -------------------------------------' >> _$1.scss
echo '//   Main-Content' >> _$1.scss
echo '// -------------------------------------' >> _$1.scss
echo '' >> _$1.scss
echo '' >> _$1.scss
echo '// -------------------------------------' >> _$1.scss
echo '//   Footer' >> _$1.scss
echo '// -------------------------------------' >> _$1.scss
echo '' >> _$1.scss
echo '' >> _$1.scss
echo '// -------------------------------------' >> _$1.scss
echo '//   States' >> _$1.scss
echo '// -------------------------------------' >> _$1.scss

echo '// Modules' > _modules.scss 
 
for file in *.scss
do  
  echo '@import "'$file'";' | sed s/_// | sed s/.scss// | grep -v 'modules' | sort >> _modules.scss
done

