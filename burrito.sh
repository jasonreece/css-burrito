#! /bin/bash

# Functions

ascii-burrito () {
  echo ''
  echo '  ////////////////////////////////////////////////////////////'
  echo '  ////////////////////////////////////////////////////////////'
  echo '  ////////////////////////////////////////////////////////////'
  echo '  //////////////////////////////////........./////////////////'
  echo '  ///////////////////////////////.....mmmmm....///////////////'
  echo '  /////////////////////////////.....mmmmmmmmmm.../////////////'
  echo '  //////////////////////////.....mmmmmmmmmmmmmmmm...//////////'
  echo '  ////////////////////////.....mmmmmmmmmmmmmmmmmmmm...////////'
  echo '  //////////////////////.....mmmmmmmmmmmmmmmmmmmmmm...////////'
  echo '  ////////////////////....mmmmmmmmmmmmmmmmmmmmmmmmm...////////'
  echo '  ///////////////////...mmmmmmmmmmmmmmmmmmmmmmmmmmm...////////'
  echo '  /////////////////....mmmmmmmmmmmmmmmmmmmmmmmmmm..../////////'
  echo '  ///////////////....mmmmmmmmmmmmmmmmmmmmmmmmmmm....//////////'
  echo '  ////////////.....mmmmmmmmmmmmmmmmmmmmmmmmmmm....////////////'
  echo '  /////////....mmmmmmmmmmmmmmmmmmmmmmmmmmmmmm..../////////////'
  echo '  ///////....mmmmmmmmm css-burrito mmmmmmmm....///////////////'
  echo '  //////...........mmmmmmmmmmmmmmmmmmmmmmm....////////////////'
  echo '  //////....mmmmm....mmmmmmmmmmmmmmmmmmm....//////////////////'
  echo '  //////....mmmmmmm....mmmmmmmmmmmmmmm....////////////////////'
  echo '  ////////...mmmmmmmm....mmmmmmmmmmm....//////////////////////'
  echo '  /////////.....mmmmmmm....mmmmmmm....////////////////////////'
  echo '  ///////////....mmmmmmm....mmmm....//////////////////////////'
  echo '  /////////////....mmmmmm...mm....////////////////////////////'
  echo '  ///////////////....mmmmm......//////////////////////////////'
  echo '  /////////////////........../////////////////////////////////'
  echo '  /////////////////////....///////////////////////////////////'
  echo '  ////////////////////////////////////////////////////////////'
  echo '  ////////////////////////////////////////////////////////////'
  echo '  ////////////////////////////////////////////////////////////'
  echo ''
}

ascii-oops () {
  echo ''
  echo '    ____     ____    _____     _____   _ '
  echo '   / __ \   / __ \  |  __ \   / ____| | |'
  echo '  | |  | | | |  | | | |__) | | (___   | |'
  echo '  | |  | | | |  | | |  ___/   \___ \  | |'
  echo '  | |__| | | |__| | | |       ____) | |_|'
  echo '   \____/   \____/  |_|      |_____/  (_)'
  echo '                                         '
}

success-message () {
  echo '  Mmmmmmm! You have created the following files,'
  echo '  and they have been imported into the _modules.scss file.'
}

add-to-modules () {
  echo '// - - - - - - - - - - - - - - - - - - -' > _modules.scss
  echo '// - - modules' > _modules.scss
  echo '' > _modules.scss

  for file in *.scss
  do
    echo '@import "'$file'";' | sed s/_// | sed s/.scss// | grep -v 'modules' | sort >> _modules.scss
  done
}

check-for-ascii () {
  local OPTIND
  while getopts ":sS:mM:lL:" opt; do
    case $opt in
      [sS])
        ascii-burrito
        success-message
        for i in ${@:2}
        do
          echo '  _'$i'.scss'

          touch _$i.scss

          echo '// - - - - - - - - - - - - - - - - - - -' >> _$i.scss
          echo '// - - styles for the' $i 'module'        >> _$i.scss
          echo ''                                         >> _$i.scss
          echo ''                                         >> _$i.scss
          echo '// - - - - - - - - - - - - - - - - - - -' >> _$i.scss
          echo '// - - layout'                            >> _$i.scss
          echo '//   _'                                   >> _$i.scss
          echo '//  | |'                                  >> _$i.scss
          echo '//  | |__'                                >> _$i.scss
          echo '//  |____|'                               >> _$i.scss
          echo ''                                         >> _$i.scss
          echo ''                                         >> _$i.scss
          echo '// - - - - - - - - - - - - - - - - - - -' >> _$i.scss
          echo '// - - skin'                              >> _$i.scss
          echo '//   ___   '                              >> _$i.scss
          echo '//  / __|  '                              >> _$i.scss
          echo '//  \__ \  '                              >> _$i.scss
          echo '//  |___/  '                              >> _$i.scss
          echo ''                                         >> _$i.scss
          echo ''                                         >> _$i.scss
          echo '// - - - - - - - - - - - - - - - - - - -' >> _$i.scss
          echo '// - - typography'                        >> _$i.scss
          echo '//   _____  '                             >> _$i.scss
          echo '//  |_   _| '                             >> _$i.scss
          echo '//    | |   '                             >> _$i.scss
          echo '//    |_|   '                             >> _$i.scss
          echo ''                                         >> _$i.scss
          echo ''                                         >> _$i.scss
          echo '// - - - - - - - - - - - - - - - - - - -' >> _$i.scss
          echo '// - - components'                        >> _$i.scss
          echo '//    ___  '                              >> _$i.scss
          echo '//   / __| '                              >> _$i.scss
          echo '//  | (__  '                              >> _$i.scss
          echo '//   \___| '                              >> _$i.scss
          echo ''                                         >> _$i.scss
          echo ''                                         >> _$i.scss
          echo '// - - - - - - - - - - - - - - - - - - -' >> _$i.scss
          echo '// - - states'                            >> _$i.scss
          echo '//   ___   '                              >> _$i.scss
          echo '//  / __|  '                              >> _$i.scss
          echo '//  \__ \  '                              >> _$i.scss
          echo '//  |___/  '                              >> _$i.scss
          echo ''                                         >> _$i.scss
        done
      ;;

      [mM])
        ascii-burrito
        success-message
        for i in ${@:2}
        do
          echo '  _'$i'.scss'

          touch _$i.scss

          echo '// - - - - - - - - - - - - - - - - - - -' >> _$i.scss
          echo '// - - styles for the' $i 'module'        >> _$i.scss
          echo ''                                         >> _$i.scss
          echo ''                                         >> _$i.scss
          echo '// - - - - - - - - - - - - - - - - - - -' >> _$i.scss
          echo '// - - layout'                            >> _$i.scss
          echo '//   _      '                             >> _$i.scss
          echo '//  | |     '                             >> _$i.scss
          echo '//  | |     '                             >> _$i.scss
          echo '//  | |     '                             >> _$i.scss
          echo '//  | |____ '                             >> _$i.scss
          echo '//  |______|'                             >> _$i.scss
          echo ''                                         >> _$i.scss
          echo ''                                         >> _$i.scss
          echo '// - - - - - - - - - - - - - - - - - - -' >> _$i.scss
          echo '// - - skin'                              >> _$i.scss
          echo '//    _____  '                            >> _$i.scss
          echo '//   / ____| '                            >> _$i.scss
          echo '//  | (___   '                            >> _$i.scss
          echo '//   \___ \  '                            >> _$i.scss
          echo '//   ____) | '                            >> _$i.scss
          echo '//  |_____/  '                            >> _$i.scss
          echo ''                                         >> _$i.scss
          echo ''                                         >> _$i.scss
          echo '// - - - - - - - - - - - - - - - - - - -' >> _$i.scss
          echo '// - - typography'                        >> _$i.scss
          echo '//   _______ '                            >> _$i.scss
          echo '//  |__   __|'                            >> _$i.scss
          echo '//     | |   '                            >> _$i.scss
          echo '//     | |   '                            >> _$i.scss
          echo '//     | |   '                            >> _$i.scss
          echo '//     |_|   '                            >> _$i.scss
          echo ''                                         >> _$i.scss
          echo ''                                         >> _$i.scss
          echo '// - - - - - - - - - - - - - - - - - - -' >> _$i.scss
          echo '// - - components'                        >> _$i.scss
          echo '//    _____  '                            >> _$i.scss
          echo '//   / ____| '                            >> _$i.scss
          echo '//  | |      '                            >> _$i.scss
          echo '//  | |      '                            >> _$i.scss
          echo '//  | |____  '                            >> _$i.scss
          echo '//   \_____| '                            >> _$i.scss
          echo ''                                         >> _$i.scss
          echo ''                                         >> _$i.scss
          echo '// - - - - - - - - - - - - - - - - - - -' >> _$i.scss
          echo '// - - states'                            >> _$i.scss
          echo '//    _____  '                            >> _$i.scss
          echo '//   / ____| '                            >> _$i.scss
          echo '//  | (___   '                            >> _$i.scss
          echo '//   \___ \  '                            >> _$i.scss
          echo '//   ____) | '                            >> _$i.scss
          echo '//  |_____/  '                            >> _$i.scss
          echo ''                                         >> _$i.scss
        done
      ;;

      [lL])
        ascii-burrito
        success-message
        for i in ${@:2}
        do
          echo '  _'$i'.scss'

          touch _$i.scss

          echo '// - - - - - - - - - - - - - - - - - - -' >> _$i.scss
          echo '// -  - styles for the' $i 'module'       >> _$i.scss
          echo ''                                         >> _$i.scss
          echo '// - - - - - - - - - - - - - - - - - - -' >> _$i.scss
          echo '// - - layout'                            >> _$i.scss
          echo ''                                         >> _$i.scss
          echo '//  lllllllllll'                          >> _$i.scss
          echo '//  l:::::::::l'                          >> _$i.scss
          echo '//  l:::::::::l'                          >> _$i.scss
          echo '//  ll:::::::ll'                          >> _$i.scss
          echo '//    l:::::l'                            >> _$i.scss
          echo '//    l:::::l'                            >> _$i.scss
          echo '//    l:::::l'                            >> _$i.scss
          echo '//    l:::::l'                            >> _$i.scss
          echo '//    l:::::l'                            >> _$i.scss
          echo '//    l:::::l'                            >> _$i.scss
          echo '//    l:::::l'                            >> _$i.scss
          echo '//    l:::::l         llllll'             >> _$i.scss
          echo '//  ll:::::::lllllllll:::::l'             >> _$i.scss
          echo '//  l::::::::::::::::::::::l'             >> _$i.scss
          echo '//  l::::::::::::::::::::::l'             >> _$i.scss
          echo '//  llllllllllllllllllllllll'             >> _$i.scss
          echo ''                                         >> _$i.scss
          echo ''                                         >> _$i.scss
          echo ''                                         >> _$i.scss
          echo '// - - - - - - - - - - - - - - - - - - -' >> _$i.scss
          echo '// - - skin'                              >> _$i.scss
          echo ''                                         >> _$i.scss
          echo '//     sssssssssssssss'                   >> _$i.scss
          echo '//   ss:::::::::::::::s'                  >> _$i.scss
          echo '//  s:::::ssssss::::::s'                  >> _$i.scss
          echo '//  s:::::s     sssssss'                  >> _$i.scss
          echo '//  s:::::s'                              >> _$i.scss
          echo '//  s:::::s'                              >> _$i.scss
          echo '//   s::::ssss'                           >> _$i.scss
          echo '//    ss::::::sssss'                      >> _$i.scss
          echo '//      sss::::::::ss'                    >> _$i.scss
          echo '//         ssssss::::s'                   >> _$i.scss
          echo '//              s:::::s'                  >> _$i.scss
          echo '//              s:::::s'                  >> _$i.scss
          echo '//  sssssss     s:::::s'                  >> _$i.scss
          echo '//  s::::::ssssss:::::s'                  >> _$i.scss
          echo '//  s:::::::::::::::ss'                   >> _$i.scss
          echo '//   sssssssssssssss'                     >> _$i.scss
          echo ''                                         >> _$i.scss
          echo ''                                         >> _$i.scss
          echo ''                                         >> _$i.scss
          echo '// - - - - - - - - - - - - - - - - - - -' >> _$i.scss
          echo '// - - typography'                        >> _$i.scss
          echo ''                                         >> _$i.scss
          echo '//  ttttttttttttttttttttttt'              >> _$i.scss
          echo '//  t:::::::::::::::::::::t'              >> _$i.scss
          echo '//  t:::::::::::::::::::::t'              >> _$i.scss
          echo '//  t:::::tt:::::::tt:::::t'              >> _$i.scss
          echo '//  tttttt  t:::::t  tttttt'              >> _$i.scss
          echo '//          t:::::t'                      >> _$i.scss
          echo '//          t:::::t'                      >> _$i.scss
          echo '//          t:::::t'                      >> _$i.scss
          echo '//          t:::::t'                      >> _$i.scss
          echo '//          t:::::t'                      >> _$i.scss
          echo '//          t:::::t'                      >> _$i.scss
          echo '//          t:::::t'                      >> _$i.scss
          echo '//        tt:::::::tt'                    >> _$i.scss
          echo '//        t:::::::::t'                    >> _$i.scss
          echo '//        t:::::::::t'                    >> _$i.scss
          echo '//        ttttttttttt'                    >> _$i.scss
          echo ''                                         >> _$i.scss
          echo ''                                         >> _$i.scss
          echo ''                                         >> _$i.scss
          echo '// - - - - - - - - - - - - - - - - - - -' >> _$i.scss
          echo '// - - components'                        >> _$i.scss
          echo ''                                         >> _$i.scss
          echo '//          ccccccccccccc'                >> _$i.scss
          echo '//       ccc::::::::::::c'                >> _$i.scss
          echo '//     cc:::::::::::::::c'                >> _$i.scss
          echo '//    c:::::cccccccc::::c'                >> _$i.scss
          echo '//   c:::::c       cccccc'                >> _$i.scss
          echo '//  c:::::c'                              >> _$i.scss
          echo '//  c:::::c'                              >> _$i.scss
          echo '//  c:::::c'                              >> _$i.scss
          echo '//  c:::::c'                              >> _$i.scss
          echo '//  c:::::c'                              >> _$i.scss
          echo '//  c:::::c'                              >> _$i.scss
          echo '//   c:::::c       cccccc'                >> _$i.scss
          echo '//    c:::::cccccccc::::c'                >> _$i.scss
          echo '//     cc:::::::::::::::c'                >> _$i.scss
          echo '//       ccc::::::::::::c'                >> _$i.scss
          echo '//          ccccccccccccc'                >> _$i.scss
          echo ''                                         >> _$i.scss
          echo ''                                         >> _$i.scss
          echo ''                                         >> _$i.scss
          echo '// - - - - - - - - - - - - - - - - - - -' >> _$i.scss
          echo '// - - states'                            >> _$i.scss
          echo '//'                                       >> _$i.scss
          echo '//     sssssssssssssss'                   >> _$i.scss
          echo '//   ss:::::::::::::::s'                  >> _$i.scss
          echo '//  s:::::ssssss::::::s'                  >> _$i.scss
          echo '//  s:::::s     sssssss'                  >> _$i.scss
          echo '//  s:::::s'                              >> _$i.scss
          echo '//  s:::::s'                              >> _$i.scss
          echo '//   s::::ssss'                           >> _$i.scss
          echo '//    ss::::::sssss'                      >> _$i.scss
          echo '//      sss::::::::ss'                    >> _$i.scss
          echo '//         ssssss::::s'                   >> _$i.scss
          echo '//              s:::::s'                  >> _$i.scss
          echo '//              s:::::s'                  >> _$i.scss
          echo '//  sssssss     s:::::s'                  >> _$i.scss
          echo '//  s::::::ssssss:::::s'                  >> _$i.scss
          echo '//  s:::::::::::::::ss'                   >> _$i.scss
          echo '//   sssssssssssssss'                     >> _$i.scss
          echo ''                                         >> _$i.scss
        done
      ;;
      \?)
        ascii-oops
        echo '  -'$OPTARG 'is not a valid option.'
        echo ''
        echo '  Please pass in -s, -m, or -l to generate small, medium, or large ascii comments.'
        exit 1
      ;;

      :)
        ascii-oops
        echo '  Please pass in an additional argument - the name of your module.'
        echo ''
        echo '  The goal is to create a new module file, with default comments,'
        echo '  and to @import the new file to the main _module.scss file.'
        echo ''

        exit 1
      ;;
    esac
  done

  add-to-modules
}

# Script

if [ $# -eq 0 ]; then
  ascii-oops
  echo '  Please pass in an additional argument - the name of your module.'
  echo ''
  echo '  The goal is to create a new module file, with default comments,'
  echo '  and to @import the new file to the main _module.scss file.'
  echo ''
  exit 1
fi

if [ ! -f _modules.scss ]; then
  ascii-oops
  echo "  Looks like you don't have a _modules.scss file!"
  echo '  Are you in the correct directory?'
  echo ''
  echo '  If you really want to add new files here,'
  echo '  make sure to create a _modules.scss file first.'
  echo ''
  exit 1
fi

if ( getopts ":sS:mM:lL:" opt); then
  if [ -z "$2" ]; then
    ascii-oops
    echo '  Please pass in an additional argument - the name of your module.'
    echo ''
    echo '  The goal is to create a new module file, with default comments,'
    echo '  and to @import the new file to the main _module.scss file.'
    echo ''
    exit 1
  else
    check-for-ascii "$@"
  fi
else
  ascii-burrito
  success-message
  for i in ${@}
  do
    echo '  _'$i'.scss'

    touch _$i.scss

    echo '// - - - - - - - - - - - - - - - - - - -' >> _$i.scss
    echo '// - - styles for the' $i 'module'        >> _$i.scss
  done
  add-to-modules
fi
