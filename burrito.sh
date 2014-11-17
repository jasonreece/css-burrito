#! /bin/bash

if [ $# -eq 0 ]; then
    echo ''
    echo '  ____     ____    _____     _____   _ '
    echo ' / __ \   / __ \  |  __ \   / ____| | |'
    echo '| |  | | | |  | | | |__) | | (___   | |'
    echo '| |  | | | |  | | |  ___/   \___ \  | |'
    echo '| |__| | | |__| | | |       ____) | |_|'
    echo ' \____/   \____/  |_|      |_____/  (_)'
    echo '                                       '
    echo ''
    echo 'Please pass in one argument - the name of your module.'
    echo ''
    echo 'The goal is to create a new module file, with default comments,'
    echo 'and to @import the new file to the main _module.scss file.'
    echo ''
    exit 1
fi

if [ ! -f _modules.scss ]; then
    echo ''
    echo '  ____     ____    _____     _____   _ '
    echo ' / __ \   / __ \  |  __ \   / ____| | |'
    echo '| |  | | | |  | | | |__) | | (___   | |'
    echo '| |  | | | |  | | |  ___/   \___ \  | |'
    echo '| |__| | | |__| | | |       ____) | |_|'
    echo ' \____/   \____/  |_|      |_____/  (_)'
    echo '                                       '
    echo ''
    echo "Looks like you don't have a _modules.scss file!"
    echo 'Are you in the correct directory?'
    echo ''
    echo 'If you really want to add new files here,'
    echo 'make sure to create a _modules.scss file first.'
    echo ''
    exit 1
fi

if [ $# -eq 1 ]; then
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
    echo '//////....mmmmm....mmmmmmmmmmmmmmmmmmm....//////////////////'
    echo '//////....mmmmmmm....mmmmmmmmmmmmmmm....////////////////////'
    echo '////////...mmmmmmmm....mmmmmmmmmmm....//////////////////////'
    echo '/////////.....mmmmmmm....mmmmmmm....////////////////////////'
    echo '///////////....mmmmmmm....mmmm....//////////////////////////'
    echo '/////////////....mmmmmm...mm....////////////////////////////'
    echo '///////////////....mmmmm......//////////////////////////////'
    echo '/////////////////........../////////////////////////////////'
    echo '/////////////////////....///////////////////////////////////'
    echo '////////////////////////////////////////////////////////////'
    echo '////////////////////////////////////////////////////////////'
    echo '////////////////////////////////////////////////////////////'
    echo ''
    echo 'Mmmmmmm! You have created a new file named _'$1'.scss,'
    echo 'and it has been imported into the _modules.scss file.'
    echo ''

    touch _$1.scss

    echo '// -------------------------------------' >> _$1.scss
    echo '// - styles for the' $1 'module'          >> _$1.scss
    echo '// -------------------------------------' >> _$1.scss
fi

while getopts ":s:m:l:" opt; do
    case $opt in
        s)
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
            echo '//////....mmmmm....mmmmmmmmmmmmmmmmmmm....//////////////////'
            echo '//////....mmmmmmm....mmmmmmmmmmmmmmm....////////////////////'
            echo '////////...mmmmmmmm....mmmmmmmmmmm....//////////////////////'
            echo '/////////.....mmmmmmm....mmmmmmm....////////////////////////'
            echo '///////////....mmmmmmm....mmmm....//////////////////////////'
            echo '/////////////....mmmmmm...mm....////////////////////////////'
            echo '///////////////....mmmmm......//////////////////////////////'
            echo '/////////////////........../////////////////////////////////'
            echo '/////////////////////....///////////////////////////////////'
            echo '////////////////////////////////////////////////////////////'
            echo '////////////////////////////////////////////////////////////'
            echo '////////////////////////////////////////////////////////////'
            echo ''
            echo 'Mmmmmmm! You have created a new file named _'$2'.scss,'
            echo 'and it has been imported into the _modules.scss file.'
            echo ''

            touch _$2.scss

            echo '// -------------------------------------' >> _$2.scss
            echo '// - styles for the' $2 'module'          >> _$2.scss
            echo '// -------------------------------------' >> _$2.scss
            echo ''                                         >> _$2.scss
            echo ''                                         >> _$2.scss
            echo '// -------------------------------------' >> _$2.scss
            echo '//  layout'                               >> _$2.scss
            echo '//   _'                                   >> _$2.scss
            echo '//  | |'                                  >> _$2.scss
            echo '//  | |__'                                >> _$2.scss
            echo '//  |____|'                               >> _$2.scss
            echo ''                                         >> _$2.scss
            echo ''                                         >> _$2.scss
            echo '// -------------------------------------' >> _$2.scss
            echo '//  skin'                                 >> _$2.scss
            echo '//   ___   '                              >> _$2.scss
            echo '//  / __|  '                              >> _$2.scss
            echo '//  \__ \  '                              >> _$2.scss
            echo '//  |___/  '                              >> _$2.scss
            echo ''                                         >> _$2.scss
            echo ''                                         >> _$2.scss
            echo '// -------------------------------------' >> _$2.scss
            echo '//  typography'                           >> _$2.scss
            echo '//   _____  '                             >> _$2.scss
            echo '//  |_   _| '                             >> _$2.scss
            echo '//    | |   '                             >> _$2.scss
            echo '//    |_|   '                             >> _$2.scss
            echo ''                                         >> _$2.scss
            echo ''                                         >> _$2.scss
            echo '// -------------------------------------' >> _$2.scss
            echo '//   components'                          >> _$2.scss
            echo '//    ___  '                              >> _$2.scss
            echo '//   / __| '                              >> _$2.scss
            echo '//  | (__  '                              >> _$2.scss
            echo '//   \___| '                              >> _$2.scss
            echo ''                                         >> _$2.scss
            echo ''                                         >> _$2.scss
            echo '// -------------------------------------' >> _$2.scss
            echo '//  states'                               >> _$2.scss
            echo '//   ___   '                              >> _$2.scss
            echo '//  / __|  '                              >> _$2.scss
            echo '//  \__ \  '                              >> _$2.scss
            echo '//  |___/  '                              >> _$2.scss
            echo ''                                         >> _$2.scss
            ;;
        \?)
            echo ''
            echo '  ____     ____    _____     _____   _ '
            echo ' / __ \   / __ \  |  __ \   / ____| | |'
            echo '| |  | | | |  | | | |__) | | (___   | |'
            echo '| |  | | | |  | | |  ___/   \___ \  | |'
            echo '| |__| | | |__| | | |       ____) | |_|'
            echo ' \____/   \____/  |_|      |_____/  (_)'
            echo '                                       '
            echo ''
            echo '-'$OPTARG 'is not a valid option.'
            echo ''
            echo 'Please pass in -s, -m, or -l to generate small, medium, or large ascii comments.'
            exit 1
            ;;
        :)
            echo ''
            echo '  ____     ____    _____     _____   _ '
            echo ' / __ \   / __ \  |  __ \   / ____| | |'
            echo '| |  | | | |  | | | |__) | | (___   | |'
            echo '| |  | | | |  | | |  ___/   \___ \  | |'
            echo '| |__| | | |__| | | |       ____) | |_|'
            echo ' \____/   \____/  |_|      |_____/  (_)'
            echo '                                       '
            echo ''
            echo 'Please pass in an additional argument - the name of your module.'
            echo ''
            echo 'The goal is to create a new module file, with default comments,'
            echo 'and to @import the new file to the main _module.scss file.'
            echo ''
            exit 1
            exit 1
            ;;
    esac

    case $opt in
        m)
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
            echo '//////....mmmmm....mmmmmmmmmmmmmmmmmmm....//////////////////'
            echo '//////....mmmmmmm....mmmmmmmmmmmmmmm....////////////////////'
            echo '////////...mmmmmmmm....mmmmmmmmmmm....//////////////////////'
            echo '/////////.....mmmmmmm....mmmmmmm....////////////////////////'
            echo '///////////....mmmmmmm....mmmm....//////////////////////////'
            echo '/////////////....mmmmmm...mm....////////////////////////////'
            echo '///////////////....mmmmm......//////////////////////////////'
            echo '/////////////////........../////////////////////////////////'
            echo '/////////////////////....///////////////////////////////////'
            echo '////////////////////////////////////////////////////////////'
            echo '////////////////////////////////////////////////////////////'
            echo '////////////////////////////////////////////////////////////'
            echo ''
            echo 'Mmmmmmm! You have created a new file named _'$2'.scss,'
            echo 'and it has been imported into the _modules.scss file.'
            echo ''

            touch _$2.scss

            echo '// -------------------------------------' >> _$2.scss
            echo '// - styles for the' $2 'module'          >> _$2.scss
            echo '// -------------------------------------' >> _$2.scss
            echo ''                                         >> _$2.scss
            echo ''                                         >> _$2.scss
            echo '// -------------------------------------' >> _$2.scss
            echo '//  layout'                               >> _$2.scss
            echo '//   _      '                             >> _$2.scss
            echo '//  | |     '                             >> _$2.scss
            echo '//  | |     '                             >> _$2.scss
            echo '//  | |     '                             >> _$2.scss
            echo '//  | |____ '                             >> _$2.scss
            echo '//  |______|'                             >> _$2.scss
            echo ''                                         >> _$2.scss
            echo ''                                         >> _$2.scss
            echo '// -------------------------------------' >> _$2.scss
            echo '//  skin'                                 >> _$2.scss
            echo '//    _____  '                            >> _$2.scss
            echo '//   / ____| '                            >> _$2.scss
            echo '//  | (___   '                            >> _$2.scss
            echo '//   \___ \  '                            >> _$2.scss
            echo '//   ____) | '                            >> _$2.scss
            echo '//  |_____/  '                            >> _$2.scss
            echo ''                                         >> _$2.scss
            echo ''                                         >> _$2.scss
            echo '// -------------------------------------' >> _$2.scss
            echo '//  typography'                           >> _$2.scss
            echo '//   _______ '                            >> _$2.scss
            echo '//  |__   __|'                            >> _$2.scss
            echo '//     | |   '                            >> _$2.scss
            echo '//     | |   '                            >> _$2.scss
            echo '//     | |   '                            >> _$2.scss
            echo '//     |_|   '                            >> _$2.scss
            echo ''                                         >> _$2.scss
            echo ''                                         >> _$2.scss
            echo '// -------------------------------------' >> _$2.scss
            echo '//  components'                           >> _$2.scss
            echo '//    _____  '                            >> _$2.scss
            echo '//   / ____| '                            >> _$2.scss
            echo '//  | |      '                            >> _$2.scss
            echo '//  | |      '                            >> _$2.scss
            echo '//  | |____  '                            >> _$2.scss
            echo '//   \_____| '                            >> _$2.scss
            echo ''                                         >> _$2.scss
            echo ''                                         >> _$2.scss
            echo '// -------------------------------------' >> _$2.scss
            echo '//  states'                               >> _$2.scss
            echo '//    _____  '                            >> _$2.scss
            echo '//   / ____| '                            >> _$2.scss
            echo '//  | (___   '                            >> _$2.scss
            echo '//   \___ \  '                            >> _$2.scss
            echo '//   ____) | '                            >> _$2.scss
            echo '//  |_____/  '                            >> _$2.scss
            echo ''                                         >> _$2.scss
            ;;
        \?)
            echo ''
            echo '  ____     ____    _____     _____   _ '
            echo ' / __ \   / __ \  |  __ \   / ____| | |'
            echo '| |  | | | |  | | | |__) | | (___   | |'
            echo '| |  | | | |  | | |  ___/   \___ \  | |'
            echo '| |__| | | |__| | | |       ____) | |_|'
            echo ' \____/   \____/  |_|      |_____/  (_)'
            echo '                                       '
            echo ''
            echo '-'$OPTARG 'is not a valid option.'
            echo ''
            echo 'Please pass in -s, -m, or -l to generate small, medium, or large ascii comments.'
            exit 1
            ;;
        :)
            echo ''
            echo '  ____     ____    _____     _____   _ '
            echo ' / __ \   / __ \  |  __ \   / ____| | |'
            echo '| |  | | | |  | | | |__) | | (___   | |'
            echo '| |  | | | |  | | |  ___/   \___ \  | |'
            echo '| |__| | | |__| | | |       ____) | |_|'
            echo ' \____/   \____/  |_|      |_____/  (_)'
            echo '                                       '
            echo ''
            echo 'Please pass in an additional argument - the name of your module.'
            echo ''
            echo 'The goal is to create a new module file, with default comments,'
            echo 'and to @import the new file to the main _module.scss file.'
            echo ''
            exit 1
            exit 1
            ;;
    esac

    case $opt in
        l)
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
            echo '//////....mmmmm....mmmmmmmmmmmmmmmmmmm....//////////////////'
            echo '//////....mmmmmmm....mmmmmmmmmmmmmmm....////////////////////'
            echo '////////...mmmmmmmm....mmmmmmmmmmm....//////////////////////'
            echo '/////////.....mmmmmmm....mmmmmmm....////////////////////////'
            echo '///////////....mmmmmmm....mmmm....//////////////////////////'
            echo '/////////////....mmmmmm...mm....////////////////////////////'
            echo '///////////////....mmmmm......//////////////////////////////'
            echo '/////////////////........../////////////////////////////////'
            echo '/////////////////////....///////////////////////////////////'
            echo '////////////////////////////////////////////////////////////'
            echo '////////////////////////////////////////////////////////////'
            echo '////////////////////////////////////////////////////////////'
            echo ''
            echo 'Mmmmmmm! You have created a new file named _'$2'.scss,'
            echo 'and it has been imported into the _modules.scss file.'
            echo ''

            touch _$2.scss

            echo '// -------------------------------------' >> _$2.scss
            echo '// - styles for the' $2 'module'          >> _$2.scss
            echo '// -------------------------------------' >> _$2.scss
            echo ''                                         >> _$2.scss
            echo ''                                         >> _$2.scss
            echo '// -------------------------------------' >> _$2.scss
            echo '//  layout'                               >> _$2.scss
            echo ''                                         >> _$2.scss
            echo '//  lllllllllll'                          >> _$2.scss
            echo '//  l:::::::::l'                          >> _$2.scss
            echo '//  l:::::::::l'                          >> _$2.scss
            echo '//  ll:::::::ll'                          >> _$2.scss
            echo '//    l:::::l'                            >> _$2.scss
            echo '//    l:::::l'                            >> _$2.scss
            echo '//    l:::::l'                            >> _$2.scss
            echo '//    l:::::l'                            >> _$2.scss
            echo '//    l:::::l'                            >> _$2.scss
            echo '//    l:::::l'                            >> _$2.scss
            echo '//    l:::::l'                            >> _$2.scss
            echo '//    l:::::l         llllll'             >> _$2.scss
            echo '//  ll:::::::lllllllll:::::l'             >> _$2.scss
            echo '//  l::::::::::::::::::::::l'             >> _$2.scss
            echo '//  l::::::::::::::::::::::l'             >> _$2.scss
            echo '//  llllllllllllllllllllllll'             >> _$2.scss
            echo ''                                         >> _$2.scss
            echo ''                                         >> _$2.scss
            echo '// -------------------------------------' >> _$2.scss
            echo '//  skin'                                 >> _$2.scss
            echo ''                                         >> _$2.scss
            echo '//     sssssssssssssss'                   >> _$2.scss
            echo '//   ss:::::::::::::::s'                  >> _$2.scss
            echo '//  s:::::ssssss::::::s'                  >> _$2.scss
            echo '//  s:::::s     sssssss'                  >> _$2.scss
            echo '//  s:::::s'                              >> _$2.scss
            echo '//  s:::::s'                              >> _$2.scss
            echo '//   s::::ssss'                           >> _$2.scss
            echo '//    ss::::::sssss'                      >> _$2.scss
            echo '//      sss::::::::ss'                    >> _$2.scss
            echo '//         ssssss::::s'                   >> _$2.scss
            echo '//              s:::::s'                  >> _$2.scss
            echo '//              s:::::s'                  >> _$2.scss
            echo '//  sssssss     s:::::s'                  >> _$2.scss
            echo '//  s::::::ssssss:::::s'                  >> _$2.scss
            echo '//  s:::::::::::::::ss'                   >> _$2.scss
            echo '//   sssssssssssssss'                     >> _$2.scss
            echo ''                                         >> _$2.scss
            echo ''                                         >> _$2.scss
            echo '// -------------------------------------' >> _$2.scss
            echo '//  typography'                           >> _$2.scss
            echo ''                                         >> _$2.scss
            echo '//  ttttttttttttttttttttttt'              >> _$2.scss
            echo '//  t:::::::::::::::::::::t'              >> _$2.scss
            echo '//  t:::::::::::::::::::::t'              >> _$2.scss
            echo '//  t:::::tt:::::::tt:::::t'              >> _$2.scss
            echo '//  tttttt  t:::::t  tttttt'              >> _$2.scss
            echo '//          t:::::t'                      >> _$2.scss
            echo '//          t:::::t'                      >> _$2.scss
            echo '//          t:::::t'                      >> _$2.scss
            echo '//          t:::::t'                      >> _$2.scss
            echo '//          t:::::t'                      >> _$2.scss
            echo '//          t:::::t'                      >> _$2.scss
            echo '//          t:::::t'                      >> _$2.scss
            echo '//        tt:::::::tt'                    >> _$2.scss
            echo '//        t:::::::::t'                    >> _$2.scss
            echo '//        t:::::::::t'                    >> _$2.scss
            echo '//        ttttttttttt'                    >> _$2.scss
            echo ''                                         >> _$2.scss
            echo ''                                         >> _$2.scss
            echo '// -------------------------------------' >> _$2.scss
            echo '//  components'                           >> _$2.scss
            echo ''                                         >> _$2.scss
            echo '//          ccccccccccccc'                >> _$2.scss
            echo '//       ccc::::::::::::c'                >> _$2.scss
            echo '//     cc:::::::::::::::c'                >> _$2.scss
            echo '//    c:::::cccccccc::::c'                >> _$2.scss
            echo '//   c:::::c       cccccc'                >> _$2.scss
            echo '//  c:::::c'                              >> _$2.scss
            echo '//  c:::::c'                              >> _$2.scss
            echo '//  c:::::c'                              >> _$2.scss
            echo '//  c:::::c'                              >> _$2.scss
            echo '//  c:::::c'                              >> _$2.scss
            echo '//  c:::::c'                              >> _$2.scss
            echo '//   c:::::c       cccccc'                >> _$2.scss
            echo '//    c:::::cccccccc::::c'                >> _$2.scss
            echo '//     cc:::::::::::::::c'                >> _$2.scss
            echo '//       ccc::::::::::::c'                >> _$2.scss
            echo '//          ccccccccccccc'                >> _$2.scss
            echo ''                                         >> _$2.scss
            echo ''                                         >> _$2.scss
            echo '// -------------------------------------' >> _$2.scss
            echo '//  states'                               >> _$2.scss
            echo '//'                                       >> _$2.scss
            echo '//     sssssssssssssss'                   >> _$2.scss
            echo '//   ss:::::::::::::::s'                  >> _$2.scss
            echo '//  s:::::ssssss::::::s'                  >> _$2.scss
            echo '//  s:::::s     sssssss'                  >> _$2.scss
            echo '//  s:::::s'                              >> _$2.scss
            echo '//  s:::::s'                              >> _$2.scss
            echo '//   s::::ssss'                           >> _$2.scss
            echo '//    ss::::::sssss'                      >> _$2.scss
            echo '//      sss::::::::ss'                    >> _$2.scss
            echo '//         ssssss::::s'                   >> _$2.scss
            echo '//              s:::::s'                  >> _$2.scss
            echo '//              s:::::s'                  >> _$2.scss
            echo '//  sssssss     s:::::s'                  >> _$2.scss
            echo '//  s::::::ssssss:::::s'                  >> _$2.scss
            echo '//  s:::::::::::::::ss'                   >> _$2.scss
            echo '//   sssssssssssssss'                     >> _$2.scss
            echo ''                                         >> _$2.scss
            ;;
        \?)
            echo ''
            echo '  ____     ____    _____     _____   _ '
            echo ' / __ \   / __ \  |  __ \   / ____| | |'
            echo '| |  | | | |  | | | |__) | | (___   | |'
            echo '| |  | | | |  | | |  ___/   \___ \  | |'
            echo '| |__| | | |__| | | |       ____) | |_|'
            echo ' \____/   \____/  |_|      |_____/  (_)'
            echo '                                       '
            echo ''
            echo '-'$OPTARG 'is not a valid option.'
            echo ''
            echo 'Please pass in -s, -m, or -l to generate small, medium, or large ascii comments.'
            exit 1
            ;;
        :)
            echo ''
            echo '  ____     ____    _____     _____   _ '
            echo ' / __ \   / __ \  |  __ \   / ____| | |'
            echo '| |  | | | |  | | | |__) | | (___   | |'
            echo '| |  | | | |  | | |  ___/   \___ \  | |'
            echo '| |__| | | |__| | | |       ____) | |_|'
            echo ' \____/   \____/  |_|      |_____/  (_)'
            echo '                                       '
            echo ''
            echo 'Please pass in an additional argument - the name of your module.'
            echo ''
            echo 'The goal is to create a new module file, with default comments,'
            echo 'and to @import the new file to the main _module.scss file.'
            echo ''
            exit 1
            exit 1
            ;;
    esac
done

echo '// Modules' > _modules.scss

for file in *.scss
do
  echo '@import "'$file'";' | sed s/_// | sed s/.scss// | grep -v 'modules' | sort >> _modules.scss
done
