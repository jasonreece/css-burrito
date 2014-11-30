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
  echo '  Mmmmmmm! you have created the following files,'
  echo '  and they have been imported into the _modules.scss file.'
}

error-message-args () {
  echo '  something is missing here...'
  echo '  here are your options:'
  echo ''
  echo '  burrito -n'
  echo '  adds a new instance of css-burrito to your project'
  echo ''
  echo '  burrito module-name(s)'
  echo '  adds a new module file to the module directory,'
  echo '  and @imports it into the _modules.scss file'
  echo ''
  echo '  burrito -s module-name(s)'
  echo '  adds a new module file, with small ascii comments to the module directory,'
  echo '  and @imports it into the _modules.scss file'
  echo ''
  echo '  burrito -m module-name(s)'
  echo '  adds a new module file, with medium ascii comments to the module directory,'
  echo '  and @imports it into the _modules.scss file'
  echo ''
  echo '  burrito -l module-name(s)'
  echo '  adds a new module file, with large ascii comments to the module directory,'
  echo '  and @imports it into the _modules.scss file'
  echo ''
  echo '  burrito -c module-name descriptive-name'
  echo '  copies a component snippet to the clipboard'
  echo ''
  exit 1
}

error-message-modules () {
  echo "  looks like you don't have a _modules.scss file!"
  echo '  are you in the correct directory?'
  echo ''
  echo '  if you really want to add new files here,'
  echo '  make sure to create a _modules.scss file first.'
  echo ''
  exit 1
}

import-modules () {
  echo '// - - - - - - - - - - - - - - - - - - -' > _modules.scss
  echo '// - - modules' > _modules.scss
  echo '' > _modules.scss

  for file in *.scss
  do
    echo '@import "'$file'";' | sed s/_// | sed s/.scss// | grep -v 'modules' | sort >> _modules.scss
  done
}

check-options () {
  local OPTIND
  while getopts ":sS:mM:lL:nN:hH:cC:" opt; do
    case $opt in
      [sS])
        if [ -z "$2" ]; then
          ascii-oops
          error-message-args
        fi
        if [ ! -f _modules.scss ]; then
          ascii-oops
          error-message-modules
        fi
        ascii-burrito
        success-message
        for i in ${@:2}
        do
          echo '  _'$i'.scss'
          touch _$i.scss

          echo '// - - - - - - - - - - - - - - - - - - -' >> _$i.scss
          echo '// - - '$i 'module'                       >> _$i.scss
          echo '// styles for the' $i 'module'            >> _$i.scss
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
          echo '//   ___'                                 >> _$i.scss
          echo '//  / __|'                                >> _$i.scss
          echo '//  \__ \'                                >> _$i.scss
          echo '//  |___/'                                >> _$i.scss
          echo ''                                         >> _$i.scss
          echo ''                                         >> _$i.scss
          echo '// - - - - - - - - - - - - - - - - - - -' >> _$i.scss
          echo '// - - typography'                        >> _$i.scss
          echo '//   _____ '                              >> _$i.scss
          echo '//  |_   _|'                              >> _$i.scss
          echo '//    | |'                                >> _$i.scss
          echo '//    |_|'                                >> _$i.scss
          echo ''                                         >> _$i.scss
          echo ''                                         >> _$i.scss
          echo '// - - - - - - - - - - - - - - - - - - -' >> _$i.scss
          echo '// - - components'                        >> _$i.scss
          echo '//    ___ '                               >> _$i.scss
          echo '//   / __|'                               >> _$i.scss
          echo '//  | (__ '                               >> _$i.scss
          echo '//   \___|'                               >> _$i.scss
          echo ''                                         >> _$i.scss
          echo ''                                         >> _$i.scss
          echo '// - - - - - - - - - - - - - - - - - - -' >> _$i.scss
          echo '// - - states'                            >> _$i.scss
          echo '//   ___ '                                >> _$i.scss
          echo '//  / __|'                                >> _$i.scss
          echo '//  \__ \'                                >> _$i.scss
          echo '//  |___/'                                >> _$i.scss
          echo ''                                         >> _$i.scss
        done

        import-modules
      ;;

      [mM])
        if [ -z "$2" ]; then
          ascii-oops
          error-message-args
        fi
        if [ ! -f _modules.scss ]; then
          ascii-oops
          error-message-modules
        fi
        ascii-burrito
        success-message
        for i in ${@:2}
        do
          echo '  _'$i'.scss'
          touch _$i.scss

          echo '// - - - - - - - - - - - - - - - - - - -' >> _$i.scss
          echo '// - - '$i 'module'                       >> _$i.scss
          echo '// styles for the' $i 'module'            >> _$i.scss
          echo ''                                         >> _$i.scss
          echo '// - - - - - - - - - - - - - - - - - - -' >> _$i.scss
          echo '// - - layout'                            >> _$i.scss
          echo '//   _ '                                  >> _$i.scss
          echo '//  | |'                                  >> _$i.scss
          echo '//  | |'                                  >> _$i.scss
          echo '//  | |'                                  >> _$i.scss
          echo '//  | |____'                              >> _$i.scss
          echo '//  |______|'                             >> _$i.scss
          echo ''                                         >> _$i.scss
          echo ''                                         >> _$i.scss
          echo '// - - - - - - - - - - - - - - - - - - -' >> _$i.scss
          echo '// - - skin'                              >> _$i.scss
          echo '//    _____'                              >> _$i.scss
          echo '//   / ____|'                             >> _$i.scss
          echo '//  | (___  '                             >> _$i.scss
          echo '//   \___ \ '                             >> _$i.scss
          echo '//   ____) |'                             >> _$i.scss
          echo '//  |_____/ '                             >> _$i.scss
          echo ''                                         >> _$i.scss
          echo ''                                         >> _$i.scss
          echo '// - - - - - - - - - - - - - - - - - - -' >> _$i.scss
          echo '// - - typography'                        >> _$i.scss
          echo '//   _______ '                            >> _$i.scss
          echo '//  |__   __|'                            >> _$i.scss
          echo '//     | |'                               >> _$i.scss
          echo '//     | |'                               >> _$i.scss
          echo '//     | |'                               >> _$i.scss
          echo '//     |_|'                               >> _$i.scss
          echo ''                                         >> _$i.scss
          echo ''                                         >> _$i.scss
          echo '// - - - - - - - - - - - - - - - - - - -' >> _$i.scss
          echo '// - - components'                        >> _$i.scss
          echo '//    _____'                              >> _$i.scss
          echo '//   / ____|'                             >> _$i.scss
          echo '//  | |'                                  >> _$i.scss
          echo '//  | |'                                  >> _$i.scss
          echo '//  | |____'                              >> _$i.scss
          echo '//   \_____|'                             >> _$i.scss
          echo ''                                         >> _$i.scss
          echo ''                                         >> _$i.scss
          echo '// - - - - - - - - - - - - - - - - - - -' >> _$i.scss
          echo '// - - states'                            >> _$i.scss
          echo '//    _____'                              >> _$i.scss
          echo '//   / ____|'                             >> _$i.scss
          echo '//  | (___  '                             >> _$i.scss
          echo '//   \___ \ '                             >> _$i.scss
          echo '//   ____) |'                             >> _$i.scss
          echo '//  |_____/'                              >> _$i.scss
          echo ''                                         >> _$i.scss
        done

        import-modules
      ;;

      [lL])
        if [ -z "$2" ]; then
          ascii-oops
          error-message-args
        fi
        if [ ! -f _modules.scss ]; then
          ascii-oops
          error-message-modules
        fi
        ascii-burrito
        success-message
        for i in ${@:2}
        do
          echo '  _'$i'.scss'
          touch _$i.scss

          echo '// - - - - - - - - - - - - - - - - - - -' >> _$i.scss
          echo '// - - '$i 'module'                       >> _$i.scss
          echo '// styles for the' $i 'module'            >> _$i.scss
          echo '// - - - - - - - - - - - - - - - - - - -' >> _$i.scss
          echo ''                                         >> _$i.scss
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

        import-modules
      ;;
      [nN])
        make-burrito
      ;;
      [hH])
        make-burrito
        hologram-base stylesheets/core/_base.scss
        ascii-burrito
      ;;
      [cC])
        if [ $# -ne 3 ]; then
          echo '  please pass in two arguments - preferably the module name as the first argument,'
          echo '  and descriptive text about the component as the second.'
          echo ''
          echo '  the goal is to output a snippet that looks like this:'
          echo ''
          echo '  // - - example-component'
          echo '  %example-l-component {'
          echo '    // write layout code here...'
          echo '  }'
          echo ''
          echo '  %example-s-component {'
          echo '    // write skin code here...'
          echo '  }'
          echo ''
          echo '  %example-t-component {'
          echo '    // write typography code here...'
          echo '  }'
          echo ''
          echo '  .example-c-component {'
          echo '    @extend %example-l-component;'
          echo '    @extend %example-s-component;'
          echo '    @extend %example-t-component;'
          echo '  }'

          echo ''
          echo '  then, simply paste your newly created snippet into your text editor.'
          exit 1
        fi

        echo '  // - - '$2'-'$3          >> snippet.txt
        echo '  %'$2'-l-'$3' {'          >> snippet.txt
        echo ''                          >> snippet.txt
        echo '  }'                       >> snippet.txt
        echo ''                          >> snippet.txt
        echo '  %'$2'-s-'$3' {'          >> snippet.txt
        echo ''                          >> snippet.txt
        echo '  }'                       >> snippet.txt
        echo ''                          >> snippet.txt
        echo '  %'$2'-t-'$3' {'          >> snippet.txt
        echo ''                          >> snippet.txt
        echo '  }'                       >> snippet.txt
        echo ''                          >> snippet.txt
        echo '  .'$2'-c-'$3' {'          >> snippet.txt
        echo '    @extend %'$2'-l-'$3';' >> snippet.txt
        echo '    @extend %'$2'-s-'$3';' >> snippet.txt
        echo '    @extend %'$2'-t-'$3';' >> snippet.txt
        echo '  }'                       >> snippet.txt

        ascii-burrito
        echo '  this is your snippet:'
        echo ''
        cat snippet.txt
        echo ''
        echo '  if this looks tasty, switch to your editor, and hit paste.'
        echo ''
        cat snippet.txt | pbcopy  && rm snippet.txt
      ;;
      \?)
        ascii-oops
        echo '  -'$OPTARG 'is not a valid option.'
        echo ''
        error-message-args
        exit 1
      ;;
    esac
  done
}

make-burrito () {
  git clone https://github.com/jasonreece/css-burrito.git

  mv css-burrito/stylesheets/ .

  rm -r -f css-burrito/
}

hologram-base () {
  # Requires one argument - the path to the file.
  # hologram-base stylesheets/core/_base.scss
  echo '' >> $1
  echo '// - - - - - - - - - - - - - - - - - - -  ' >> $1
  echo '//  documentation' >> $1
  echo '// - - - - - - - - - - - - - - - - - - -  ' >> $1
  echo '' >> $1
  echo '' >> $1
  echo '/*doc ' >> $1
  echo '--- ' >> $1
  echo 'title: Headings' >> $1
  echo 'name: headings' >> $1
  echo 'category: base' >> $1
  echo '---' >> $1
  echo '```html_example ' >> $1
      echo '<h1>The quick brown fox...</h1>' >> $1
      echo '<h2>The quick brown fox...</h2>' >> $1
      echo '<h3>The quick brown fox...</h3>' >> $1
      echo '<h4>The quick brown fox...</h4>' >> $1
      echo '<h5>The quick brown fox...</h5>' >> $1
      echo '<h6>The quick brown fox...</h6>' >> $1
  echo '```' >> $1
  echo '*/' >> $1
}

# Script

if ( getopts ":sS:mM:lL:nN:hH:cC:" opt); then
  check-options "$@"
else
  if [ -z "$1" ]; then
    ascii-oops
    error-message-args
  fi
  ascii-burrito
  success-message
  for i in ${@}
  do
    echo '  _'$i'.scss'

    touch _$i.scss

    echo '// - - - - - - - - - - - - - - - - - - -' >> _$i.scss
    echo '// - - '$i 'module'                       >> _$i.scss
    echo '// styles for the' $i 'module'            >> _$i.scss
  done
  import-modules
fi
