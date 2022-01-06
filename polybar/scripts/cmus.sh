while getopts "qnpt" arg; do
    case $arg in
        q)
            status=$(cmus-remote -Q | awk '/^status/{ s=$2 } /^tag title/{ $1=""; $2=""; gsub(/^[ ]+/, "", $0); t=$0 } /^tag artist/{ $1=""; $2=""; gsub(/^[ ]+/, "", $0); a=$0 } END { print s"::"t"::"a }')
            if [[ $status =~ ^([^\:]+)\:\:([^\:]+)\:\:([^\:]+)$ ]]; then
                # Matches status::title::artist
                icon=""
                case ${BASH_REMATCH[1]} in
                    playing)
                        icon="﫛  "
                    ;;
                esac
                label="${BASH_REMATCH[3]} - ${BASH_REMATCH[2]}"
                if [[ ${#label} > 75 ]]; then
                    label=$(echo "$label" | awk '{ print substr($0, 1, 75) "..." }')
                fi
                echo "${icon}$label"

            else
                echo ""
            fi
            ;;
        t)
            cmus-remote -u
            ;;
        n)
            cmus-remote -n
            ;;
        p)
            cmus-remote -r
            ;;
    esac
done