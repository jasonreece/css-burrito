#! /bin/bash

MINPARAMS=1

cd stylesheets/modules

touch _$1.scss

cap="$(tr '[:lower:]' '[:upper:]' <<< ${1:0:1})${1:1}"

echo '// -------------------------------------' >> _$1.scss
echo '// - '$cap 'Module' >> _$1.scss
echo '// -------------------------------------' >> _$1.scss
echo '// ----- Styles for the '$cap 'Module' >> _$1.scss
echo '// -------------------------------------' >> _$1.scss
echo '' >> _$1.scss
echo '// -------------------------------------' >> _$1.scss
echo '//   Layout' >> _$1.scss
echo '// -------------------------------------' >> _$1.scss
echo '' >> _$1.scss
echo '' >> _$1.scss
echo '// -------------------------------------' >> _$1.scss
echo '//   Skin' >> _$1.scss
echo '// -------------------------------------' >> _$1.scss
echo '' >> _$1.scss
echo '' >> _$1.scss
echo '// -------------------------------------' >> _$1.scss
echo '//   Typography' >> _$1.scss
echo '// -------------------------------------' >> _$1.scss
echo '' >> _$1.scss
echo '' >> _$1.scss
echo '// -------------------------------------' >> _$1.scss
echo '//   States' >> _$1.scss
echo '// -------------------------------------' >> _$1.scss



cd ../core/

echo '// Modules' > _modules.scss 
 
for file in ../modules/*.scss
do
  echo '@import "'$file'";' | sed s/_// | sed s/.scss// | sort >> _modules.scss
done

cd ../../
