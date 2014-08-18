#! /bin/bash

if [ $# -ne 1 ]; then
    echo ''
    echo 'Oops, please pass in one argument - the name of your module.'
    echo ''
    echo 'The goal is to create a new module file, with default comments,'
    echo 'and to @import the new file to the main _module.scss file.'
    echo ''
    exit 1
fi

if [ ! -f _modules.scss ]; then
    echo ''
    echo "Oops, looks like you don't have a _modules.scss file!"
    echo 'Are you in the correct directory?'
    echo ''
    echo 'If you really want to add new files here,'
    echo 'make sure to create a _modules.scss file first.'
    echo ''
    exit 1
fi

echo ''
echo '////////////////////////////////////////////////////////////'
echo '////////////////////////////////////////////////////////////'
echo '////////////////////////////////////////////////////////////'
echo '//////////////////////////////////........./////////////////'
echo '///////////////////////////////.....mmmmm....///////////////'
echo '/////////////////////////////.....mmmmmmmmmm.../////////////'
echo '//////////////////////////.....mmmmmmmmmmmmmmmm...//////////'
echo '////////////////////////.....mmmmmmmmmmmmmmmmmmmm...////////'
echo '//////////////////////.....mmmmmmmmmmmmmmmmmmmmmm...////////'
echo '////////////////////....mmmmmmmmmmmmmmmmmmmmmmmmm...////////'
echo '///////////////////...mmmmmmmmmmmmmmmmmmmmmmmmmmm...////////'
echo '/////////////////....mmmmmmmmmmmmmmmmmmmmmmmmmm..../////////'
echo '///////////////....mmmmmmmmmmmmmmmmmmmmmmmmmmm....//////////'
echo '////////////.....mmmmmmmmmmmmmmmmmmmmmmmmmmm....////////////'
echo '/////////....mmmmmmmmmmmmmmmmmmmmmmmmmmmmmm..../////////////'
echo '///////....mmmmmmmmm css-burrito mmmmmmmm....///////////////'
echo '//////...........mmmmmmmmmmmmmmmmmmmmmmm....////////////////'
echo '//////.....mmmm....mmmmmmmmmmmmmmmmmmm....//////////////////'
echo '//////....mmmmmmm....mmmmmmmmmmmmmmm....////////////////////'
echo '////////...mmmmmmmm......mmmmmmmmm....//////////////////////'
echo '/////////.....mmmmm........mmmmm....////////////////////////'
echo '///////////....mmmmmm......mmm....//////////////////////////'
echo '/////////////....mmmmmm...mm....////////////////////////////'
echo '///////////////....mmmm.......//////////////////////////////'
echo '/////////////////........../////////////////////////////////'
echo '/////////////////////....///////////////////////////////////'
echo '////////////////////////////////////////////////////////////'
echo '////////////////////////////////////////////////////////////'
echo '////////////////////////////////////////////////////////////'
echo ''
echo 'Yum! You have created a new file named _'$1'.scss,'
echo 'and it has been imported into the _modules.scss file.'
echo ''

touch _$1.scss

cap="$(tr '[:lower:]' '[:upper:]' <<< ${1:0:1})${1:1}"

echo '// -------------------------------------' >> _$1.scss
echo '// - '$cap 'Module'                       >> _$1.scss
echo '// -------------------------------------' >> _$1.scss
echo '// ----- Styles for the '$cap 'Module'    >> _$1.scss
echo '// -------------------------------------' >> _$1.scss
echo ''                                         >> _$1.scss
echo '// -------------------------------------' >> _$1.scss
echo '//   Layout'                              >> _$1.scss
echo ''                                         >> _$1.scss
echo '//    LLLLLLLLLLL'                        >> _$1.scss
echo '//    L:::::::::L'                        >> _$1.scss
echo '//    L:::::::::L'                        >> _$1.scss
echo '//    LL:::::::LL'                        >> _$1.scss
echo '//      L:::::L'                          >> _$1.scss
echo '//      L:::::L'                          >> _$1.scss
echo '//      L:::::L'                          >> _$1.scss
echo '//      L:::::L'                          >> _$1.scss
echo '//      L:::::L'                          >> _$1.scss
echo '//      L:::::L'                          >> _$1.scss
echo '//      L:::::L'                          >> _$1.scss
echo '//      L:::::L         LLLLLL'           >> _$1.scss
echo '//    LL:::::::LLLLLLLLL:::::L'           >> _$1.scss
echo '//    L::::::::::::::::::::::L'           >> _$1.scss
echo '//    L::::::::::::::::::::::L'           >> _$1.scss
echo '//    LLLLLLLLLLLLLLLLLLLLLLLL'           >> _$1.scss
echo '//'                                       >> _$1.scss
echo '// -------------------------------------' >> _$1.scss
echo ''                                         >> _$1.scss
echo ''                                         >> _$1.scss
echo '// -------------------------------------' >> _$1.scss
echo '//   Skin'                                >> _$1.scss
echo ''                                         >> _$1.scss
echo '//'                                       >> _$1.scss
echo '//      SSSSSSSSSSSSSSS'                  >> _$1.scss
echo '//    SS:::::::::::::::S'                 >> _$1.scss
echo '//   S:::::SSSSSS::::::S'                 >> _$1.scss
echo '//   S:::::S     SSSSSSS'                 >> _$1.scss
echo '//   S:::::S'                             >> _$1.scss
echo '//   S:::::S'                             >> _$1.scss
echo '//    S::::SSSS'                          >> _$1.scss
echo '//     SS::::::SSSSS'                     >> _$1.scss
echo '//       SSS::::::::SS'                   >> _$1.scss
echo '//          SSSSSS::::S'                  >> _$1.scss
echo '//               S:::::S'                 >> _$1.scss
echo '//               S:::::S'                 >> _$1.scss
echo '//   SSSSSSS     S:::::S'                 >> _$1.scss
echo '//   S::::::SSSSSS:::::S'                 >> _$1.scss
echo '//   S:::::::::::::::SS'                  >> _$1.scss
echo '//    SSSSSSSSSSSSSSS'                    >> _$1.scss
echo '//'                                       >> _$1.scss
echo '// -------------------------------------' >> _$1.scss
echo ''                                         >> _$1.scss
echo ''                                         >> _$1.scss
echo '// -------------------------------------' >> _$1.scss
echo '//   Typography'                          >> _$1.scss
echo ''                                         >> _$1.scss
echo '//   TTTTTTTTTTTTTTTTTTTTTTT'             >> _$1.scss
echo '//   T:::::::::::::::::::::T'             >> _$1.scss
echo '//   T:::::::::::::::::::::T'             >> _$1.scss
echo '//   T:::::TT:::::::TT:::::T'             >> _$1.scss
echo '//   TTTTTT  T:::::T  TTTTTT'             >> _$1.scss
echo '//           T:::::T'                     >> _$1.scss
echo '//           T:::::T'                     >> _$1.scss
echo '//           T:::::T'                     >> _$1.scss
echo '//           T:::::T'                     >> _$1.scss
echo '//           T:::::T'                     >> _$1.scss
echo '//           T:::::T'                     >> _$1.scss
echo '//           T:::::T'                     >> _$1.scss
echo '//         TT:::::::TT'                   >> _$1.scss
echo '//         T:::::::::T'                   >> _$1.scss
echo '//         T:::::::::T'                   >> _$1.scss
echo '//         TTTTTTTTTTT'                   >> _$1.scss
echo '//'                                       >> _$1.scss
echo '// -------------------------------------' >> _$1.scss
echo ''                                         >> _$1.scss
echo ''                                         >> _$1.scss
echo '// -------------------------------------' >> _$1.scss
echo '//   Components'                          >> _$1.scss
echo ''                                         >> _$1.scss
echo '//'                                       >> _$1.scss
echo '//'                                       >> _$1.scss
echo '//           CCCCCCCCCCCCC'               >> _$1.scss
echo '//        CCC::::::::::::C'               >> _$1.scss
echo '//      CC:::::::::::::::C'               >> _$1.scss
echo '//     C:::::CCCCCCCC::::C'               >> _$1.scss
echo '//    C:::::C       CCCCCC'               >> _$1.scss
echo '//   C:::::C'                             >> _$1.scss
echo '//   C:::::C'                             >> _$1.scss
echo '//   C:::::C'                             >> _$1.scss
echo '//   C:::::C'                             >> _$1.scss
echo '//   C:::::C'                             >> _$1.scss
echo '//   C:::::C'                             >> _$1.scss
echo '//    C:::::C       CCCCCC'               >> _$1.scss
echo '//     C:::::CCCCCCCC::::C'               >> _$1.scss
echo '//      CC:::::::::::::::C'               >> _$1.scss
echo '//        CCC::::::::::::C'               >> _$1.scss
echo '//           CCCCCCCCCCCCC'               >> _$1.scss
echo '//'                                       >> _$1.scss
echo '// -------------------------------------' >> _$1.scss
echo ''                                         >> _$1.scss
echo ''                                         >> _$1.scss
echo '// -------------------------------------' >> _$1.scss
echo '//   States'                              >> _$1.scss
echo ''                                         >> _$1.scss
echo '//'                                       >> _$1.scss
echo '//      SSSSSSSSSSSSSSS'                  >> _$1.scss
echo '//    SS:::::::::::::::S'                 >> _$1.scss
echo '//   S:::::SSSSSS::::::S'                 >> _$1.scss
echo '//   S:::::S     SSSSSSS'                 >> _$1.scss
echo '//   S:::::S'                             >> _$1.scss
echo '//   S:::::S'                             >> _$1.scss
echo '//    S::::SSSS'                          >> _$1.scss
echo '//     SS::::::SSSSS'                     >> _$1.scss
echo '//       SSS::::::::SS'                   >> _$1.scss
echo '//          SSSSSS::::S'                  >> _$1.scss
echo '//               S:::::S'                 >> _$1.scss
echo '//               S:::::S'                 >> _$1.scss
echo '//   SSSSSSS     S:::::S'                 >> _$1.scss
echo '//   S::::::SSSSSS:::::S'                 >> _$1.scss
echo '//   S:::::::::::::::SS'                  >> _$1.scss
echo '//    SSSSSSSSSSSSSSS'                    >> _$1.scss
echo '//'                                       >> _$1.scss
echo '// -------------------------------------' >> _$1.scss
echo ''                                         >> _$1.scss

echo '// Modules' > _modules.scss

for file in *.scss
do
  echo '@import "'$file'";' | sed s/_// | sed s/.scss// | grep -v 'modules' | sort >> _modules.scss
done
