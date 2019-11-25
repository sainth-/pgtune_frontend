#/bin/bash
set -e

ELM_EXE=$(which elm)
SASS_EXE=$(which sass)
TAR_EXE=$(which tar)

USAGE="$(cat<<EOF
$(basename "$0") [-h] [-b all|elm|css] [-a] -- simple build script

where:
    -a  build all and create archive pgtune.tar.gz
    -b  elm: trigger build for elm part
        css: trigger build for css part
        all: trigger all build parts
    -c  delete generated artefacts
    -h  show this help text
EOF
)"


build_elm() {
	echo "Building elm.js"
	pushd elm
	${ELM_EXE} make --optimize --output=../elm.js src/Main.elm 
	popd
}

build_css() {
	echo "Building styles.css"
	${SASS_EXE} --style compressed  styles/bulma.sass styles.css	
}

create_archive() {
	echo "Creating archive"
	${TAR_EXE} czf pgtune.tar.gz index.html elm.js styles.css styles.css.map
}

quit() {
	exit 0
}

while getopts "ab:ch?" opt; do
    case "$opt" in
    a)
        build_elm
        build_css
        create_archive
	quit
        ;;
    b)
        case "$OPTARG" in
        all)
             build_elm
             build_css
             quit
             ;;
        elm)
             build_elm
             quit
             ;;
        css)
             build_css
             quit
             ;;
        esac
        ;;
    c)
        rm -f ./elm.js ./styles.css ./styles.css.map ./pgtune.tar.gz
        quit
        ;;
    h|\?)
        echo "$USAGE"
        exit 1
        ;;
    esac
done

echo "$USAGE"
exit 1
