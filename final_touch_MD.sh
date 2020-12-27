main() {

    clear
    r_w_u=0
    r_w_h=0
    r_s_o=0
    echo "You Chooses for Space Remover...! Now Select the options : "
    echo "1 For Replace Space "
    echo "2 For Remove Space"
    read options
    clear

    case $options in
    1)
        echo "1 For Replace Space with Underscore"
        echo "2 For Replace Space with Hypen"
        read op
        clear
        case $op in
        1)
            replace_with_underscore
            ;;
        2)
            replace_with_hypen
            ;;
        *)
            echo "Please Enter the Correct Input...!"

            ;;
        esac

        ;;
    2)
        replace_space_only
        ;;
    *)
        echo "Please Enter the Correct Input...!"

        ;;
    esac
}

function confirms_T() {
    read -p "Do you to rename Confirm [y] : " confirm
    if [[ ${confirm,,} == y ]]; then

        renames_K "$confrim"

    fi
}

function renames_K() {
    ext=${ext:-*}

    find . -type f -name "* *" | while read file; do
        if [[ "${file##*.}" == ${ext#*.} ]]; then
            if [[ $k == $0 || $k == "rename.sh" || $k == "final_touch_MD.sh" ]]; then continue; fi

            if [[ ${confirm,,} == y && $r_w_u == 1 ]]; then
                mv "$file" ${file// /_} #For Underscore

            elif [[ $r_w_u == 1 ]]; then
                echo ${file// /_} | cut -d '/' -f2

            elif [[ ${confirm,,} == y && $r_w_h == 1 ]]; then
                mv "$file" ${file// /-} #For Hypen

            elif [[ $r_w_h == 1 ]]; then
                echo ${file// /-} | cut -d '/' -f2

            elif [[ ${confirm,,} == y && $r_s_o == 1 ]]; then
                mv "$file" ${file// /} #Space Remove

            else
                echo ${file// /} | cut -d '/' -f2

            fi

        fi

    done

}

replace_with_underscore() {
    clear
    r_w_u=1
    echo
    echo "##=========================================================##"
    renames_K "$r_w_u"
    echo "##=========================================================##"
    confirms_T
    echo "Done...!"
}
replace_with_hypen() {
    clear
    r_w_h=1
    echo
    echo "##=========================================================##"
    renames_K "$r_w_h"
    echo "##=========================================================##"
    confirms_T
    echo "Done...!"
}
replace_space_only() {
    clear
    r_s_o=1
    echo
    echo "##=========================================================##"
    renames_K "$r_s_o"
    echo "##=========================================================##"
    confirms_T
    echo "Done...!"

    
}
main "$@"
