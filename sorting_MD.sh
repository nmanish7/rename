main() {
    echo "Warning...!  Warning...!  Warning...! Warning..!"
    echo "Warning...!  Warning...!  Warning...! Warning..!"
    echo "Warning...!  Warning...!  Warning...! Warning..!"
    echo
    echo
    echo "First Remove all the Spaces from file name. If any file have space then it may be delete the file or may be damage them...!"
    echo 
    echo "So You can use Option 5 From Main Menu.... For Removing the Space....! :)"
    echo "If your file have No Space then you my script is responsible... Else you understand what should be done...!"
    echo
    echo
    d_a_b=0
    d_a_e=0
    d_d_b=0
    d_d_e=0
    s_a_b=0
    s_a_e=0
    s_d_b=0
    s_d_e=0
    # ext=.*

    function sorting_all() {
        echo "Welcome to Sorting with Rename... Please choose the Options : "
        echo "1 Sorting by DATE"
        echo "2 Sorting by SIZE"
        read sorting
        clear

        case $sorting in
        1)
            echo "You Selected for DATE Sorting"
            echo "1 For Asscending"
            echo "2 For Descending"
            read options_sem
            clear

            case $options_sem in
            1)
                echo "You Choose for DATE ASSCENDING...! Next choose the SERIAL adding options : "
                echo "1 For Beginning"
                echo "2 For End"
                read option_state

                case $option_state in
                1)
                    date_asscending_beginning
                    ;;
                2)
                    date_asscending_end
                    ;;
                *)
                    echo "Please Enter the Correct Input...!"
                    ;;
                esac

                ;;
            2)
                echo "You Choose for DATE DESCENDING...! Next choose the SERIAL adding options : "
                echo "1 For Beginning"
                echo "2 For End"
                read option_state
                clear

                case $option_state in
                1)
                    date_descending_beginning
                    ;;
                2)
                    date_descending_end
                    ;;
                *)
                    echo "Please Enter the Correct Input...!"
                    ;;
                esac
                ;;
            *)
                echo "Please Enter the Correct Input...!"
                ;;
            esac

            ;;
        2)
            echo "1 For Asscending"
            echo "2 For Descending"
            read options_sem
            clear

            case $options_sem in
            1)
                echo "You Choose for SIZE ASSCENDING...! Next choose the SERIAL adding options : "
                echo "1 For Beginning"
                echo "2 For End"
                read option_state
                clear

                case $option_state in
                1)
                    size_asscending_beginning
                    ;;
                2)
                    size_asscending_end
                    ;;
                *)
                    echo "Please Enter the Correct Input...!"
                    ;;
                esac

                ;;
            2)
                echo "You Choose for SIZE DESCENDING...! Next choose the SERIAL adding options : "
                echo "1 For Beginning"
                echo "2 For End"
                read option_state
                clear

                case $option_state in
                1)
                    size_descending_beginning
                    ;;
                2)
                    size_descending_end
                    ;;
                *)
                    echo "Please Enter the Correct Input...!"
                    ;;
                esac

                ;;
            *)
                echo "Please Enter the Correct Input...!"
                ;;
            esac

            ;;
        *)
            echo "Please Enter the Correct Input...!"
            ;;
        esac
    }

    sorting_all
}

function confirms_T() {
    read -p "Do you to rename Confirm [y] : " confirm
    if [[ ${confirm,,} == y ]]; then

        renames_T "$confrim"

    fi
}

function renames_T() {

    files_d_a_b_e=($(ls -tr | grep $ext$))
    files_d_d_b_e=($(ls -t | grep $ext$))

    # date_asscending_beginning and date_asscending_end are done both very critical sistuations
    if [[ $d_a_b == 1 || $d_a_e == 1 ]]; then
        count=$d_a_b_value
        count1=$d_a_e_value

        for k in ${files_d_a_b_e[@]}; do

            bug_ext=${k##*.}

            if [[ $k == $0 || $k == "rename.sh" || $k == "final_touch_MD.sh" ]]; then continue; fi

            if [[ ${confirm,,} == y && $d_a_b == 1 ]]; then
                mv -- $k "${d_a_b_value}_${k%}"
                ((d_a_b_value++))

            elif [[ $d_a_b == 1 ]]; then
                echo "$count""_$k"
                ((count++))

            #Bug in * extension
            elif [[ ${confirm,,} == y && $d_a_e == 1 ]]; then
                temp=${k%.$bug_ext}
                # Fixing the bug today_27_DEC_2020 by Manish
                # mv -- $k "${temp}_$d_a_e_value$ext"
                mv -- $k "${temp}_$d_a_e_value.$bug_ext"
                ((d_a_e_value++))

            else
                # echo "${k%$ext}_$count1$ext"
                echo "${k%.$bug_ext}_$count1.$bug_ext"

                ((count1++))

            fi

        done

        # date_descending_beginning and date_descending_end are done both are in very cirtical sistuations
    elif [[ $d_d_b == 1 || $d_d_e == 1 ]]; then
        count=$d_d_b_value
        count1=$d_d_e_value

        for k in ${files_d_d_b_e[@]}; do
            bug_ext=${k##*.}
            if [[ $k == $0 || $k == "rename.sh" || $k == "final_touch_MD.sh" ]]; then continue; fi

            if [[ ${confirm,,} == y && $d_d_b == 1 ]]; then
                mv -- $k "${d_d_b_value}_${k%}"
                ((d_d_b_value++))

            elif [[ $d_d_b == 1 ]]; then
                echo "$count""_$k"
                ((count++))

            #Bug in * extension
            elif [[ ${confirm,,} == y && $d_d_e == 1 ]]; then
                temp=${k%.$bug_ext}
                # Fixing the bug today_27_DEC_2020 by Manish
                mv -- $k "${temp}_$d_d_e_value.$bug_ext"
                ((d_d_e_value++))

            else
                echo "${k%.$bug_ext}_$count1.$bug_ext"
                ((count1++))

            fi
        done

    fi

    # size_asscending_beginning
    # size_asscending_end

    files_s_a_b_e=($(ls -rS | grep $ext$)) #Asscending to Descending in Size
    files_s_d_b_e=($(ls -S | grep $ext$))  #Desscinding to Asscending in Size

    # size_asscending_beginning and size_asscending_end are done both very critical sistuations
    if [[ $s_a_b == 1 || $s_a_e == 1 ]]; then
        count=$s_a_b_value
        count1=$s_a_e_value

        for k in ${files_s_a_b_e[@]}; do
            bug_ext=${k##*.}
            if [[ $k == $0 || $k == "rename.sh" || $k == "final_touch_MD.sh" ]]; then continue; fi

            if [[ ${confirm,,} == y && $s_a_b == 1 ]]; then
                mv -- $k "${s_a_b_value}_${k%}"
                ((s_a_b_value++))

            elif [[ $s_a_b == 1 ]]; then
                echo "$count""_$k"
                ((count++))

            #Bug in * extension
            elif [[ ${confirm,,} == y && $s_a_e == 1 ]]; then
                temp=${k%.$bug_ext}
                # Fixing the bug today_27_DEC_2020 by Manish
                mv -- $k "${temp}_$s_a_e_value.$bug_ext"
                ((s_a_e_value++))

            else
                echo "${k%.$bug_ext}_$count1.$bug_ext"
                ((count1++))

            fi

        done
        # size_descending_beginning
        # size_descending_end
        # size_descending_beginning and size_descending_end are done both are in very cirtical sistuations
    elif [[ $s_d_b == 1 || $s_d_e == 1 ]]; then
        count=$s_d_b_value
        count1=$s_d_e_value

        for k in ${files_s_d_b_e[@]}; do
            bug_ext=${k##*.}
            if [[ $k == $0 || $k == "rename.sh" || $k == "final_touch_MD.sh" ]]; then continue; fi

            if [[ ${confirm,,} == y && $s_d_b == 1 ]]; then
                mv -- $k "${s_d_b_value}_${k%}"
                ((s_d_b_value++))

            elif [[ $s_d_b == 1 ]]; then
                echo "$count""_$k"
                ((count++))

            #Bug in * extension
            elif [[ ${confirm,,} == y && $s_d_e == 1 ]]; then
                temp=${k%.$bug_ext}
                # Fixing the bug today_27_DEC_2020 by Manish
                mv -- $k "${temp}_$s_d_e_value.$bug_ext"
                ((s_d_e_value++))

            else
                echo "${k%.$bug_ext}_$count1.$bug_ext"
                ((count1++))

            fi
        done

    fi

}

date_asscending_beginning() {
    clear
    d_a_b=1
    read -p "Enter the Starting Number [1] : " d_a_b_value
    d_a_b_value=${d_a_b_value:-1}
    echo
    echo "##=========================================================##"
    renames_T "$d_a_b" "$d_a_b_value"
    echo "##=========================================================##"
    confirms_T
    echo "Done...!"
}

date_asscending_end() {
    clear
    d_a_e=1
    read -p "Enter the Starting Number [1] : " d_a_e_value
    d_a_e_value=${d_a_e_value:-1}
    echo
    echo "##=========================================================##"
    renames_T "$d_a_e_value" "$d_a_e"
    echo "##=========================================================##"
    confirms_T
    echo "Done...!"
}
date_descending_beginning() {
    clear
    d_d_b=1
    read -p "Enter the Starting Number [1] : " d_d_b_value
    d_d_b_value=${d_d_b_value:-1}
    echo
    echo "##=========================================================##"
    renames_T "$d_d_b_value" "$d_d_b"
    echo "##=========================================================##"
    confirms_T
    echo "Done...!"
}
date_descending_end() {
    clear
    d_d_e=1
    read -p "Enter the Starting Number [1] : " d_d_e_value
    d_d_e_value=${d_d_e_value:-1}
    echo
    echo "##=========================================================##"
    renames_T "$d_d_e_value" "$d_d_e"
    echo "##=========================================================##"
    confirms_T
    echo "Done...!"
}

size_asscending_beginning() {
    clear
    s_a_b=1
    read -p "Enter the Starting Number [1] : " s_a_b_value
    s_a_b_value=${s_a_b_value:-1}
    echo
    echo "##=========================================================##"
    renames_T "$s_a_b_value" "$s_a_b"
    echo "##=========================================================##"
    confirms_T
    echo "Done...!"
}
size_asscending_end() {
    clear
    s_a_e=1
    read -p "Enter the Starting Number [1] : " s_a_e_value
    s_a_e_value=${s_a_e_value:-1}
    echo
    echo "##=========================================================##"
    renames_T "$s_a_e_value" "$s_a_e"
    echo "##=========================================================##"
    confirms_T
    echo "Done...!"
}
size_descending_beginning() {
    clear
    s_d_b=1
    read -p "Enter the Starting Number [1] : " s_d_b_value
    s_d_b_value=${s_d_b_value:-1}
    echo
    echo "##=========================================================##"
    renames_T "$s_d_b_value" "$s_d_b"
    echo "##=========================================================##"
    confirms_T
    echo "Done...!"
}
size_descending_end() {
    clear
    s_d_e=1
    read -p "Enter the Starting Number [1] : " s_d_e_value
    s_d_e_value=${s_d_e_value:-1}
    echo
    echo "##=========================================================##"
    renames_T "$s_d_e_value" "$s_d_e"
    echo "##=========================================================##"
    confirms_T
    echo "Done...!"
}

main "$@"
