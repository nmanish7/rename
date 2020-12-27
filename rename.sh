clear

path=.
file_count=0
# read -p "Enter your name [Richard]: " name
# name=${name:-Richard}
# echo $name

#Global Variable:
t_end=0
t_font=0
ad_font=0
ad_end=0
ext_ext=0
ext_oth=0

function extension_fetch_show() {
    read -p "Enter the Extension of File [*] : " ext
    echo

    if [[ $ext == '' ]]; then
        find $path -type f -name "*"
        file_count=$(find $path -type f -name "*$ext" | wc -l)
        echo
        echo "Total Number of file are: "$file_count
        echo
        echo "##=========================================================##"
        echo

    else

        find $path -type f -name "*$ext"
        file_count=$(find $path -type f -name "*$ext" | wc -l)
        echo
        echo "Total Number of '$ext' file are: "$file_count
        echo
        echo "##=========================================================##"
        echo
    fi

    export ext

}
function confirms() {
    read -p "Do you to rename Confirm [y] : " confirm
    if [[ ${confirm,,} == y ]]; then

        renames "$confrim"

    fi
}
function renames() {
    ((char_count_begining += 1))
    for_grant=$(($char_count_begining - 1))
    ((char_count_end += 1))
    for_grant_end=$(($char_count_end - 1))

    for i in *$ext; do

        #Conditional statements for Bypassing the executions on Own File
        if [[ $i == $0 ]]; then
            continue
        fi

        if [[ $i == "sorting_MD.sh" || $i == "final_touch_MD.sh" ]]; then
            continue
        fi

        #Condition Statements for Triming From the Begining side
        if [[ $t_font == 1 ]]; then
            if [[ ${confirm,,} == y ]]; then

                word=$(echo $i | cut -c $for_grant-)
                mv -- "$i" "${word}"

            else
                word=$(echo $i | cut -c $char_count_begining-)
                echo $word

            fi

        #Conditional Statements for Triming from the end Side
        elif [[ $t_end == 1 ]]; then
            if [[ ${confirm,,} == y ]]; then

                word_ends=$(echo $i | rev | cut --complement -f1 -d "." | cut -c $for_grant_end- | rev)
                mv -- "$i" "${word_ends%}$ext"

            else

                word_end=$(echo $i | rev | cut --complement -f1 -d "." | cut -c $char_count_end- | rev)
                echo "$word_end$ext"

            fi
        fi

        #Conditional Statements for Adding Character or Text at the begining of File
        add_ending=$(echo $i | rev | cut --complement -f1 -d "." | rev)
        if [[ $ad_font == 1 ]]; then
            if [[ ${confirm,,} == y ]]; then
                mv -- "$i" "$add_char_begi${i}"

            else

                echo "$add_char_begi$i"

            fi

        #Conditional Statements for Adding Character or Text at the end of File
        elif [[ $ad_end == 1 ]]; then

            if [[ ${confirm,,} == y ]]; then

                mv -- "$i" "${add_ending}$add_char_end$ext"

            else

                echo "$add_ending$add_char_end$ext"

            fi
        fi

        #Conditional Statement for Extenstion to Extension Changing
        if [[ $ext_ext == 1 ]]; then
            if [[ ${confirm,,} == y ]]; then

                mv -- "$i" "${add_ending}$ext_ext_char"

            else

                echo "$add_ending$ext_ext_char"

            fi

        #Conditional Statement for Other to Extension Changing
        elif [[ $ext_oth == 1 && $i == !(*.*) ]]; then

            if [[ ${confirm,,} == y ]]; then

                mv -- "$i" "${i}$ext_oth_char"

            else

                # echo "$add_ending$ext_oth_char"
                echo "$i$ext_oth_char"

            fi

        fi

    done

}

function trim_beginning() {
    clear
    t_font=1
    read -p "Enter the n BEGINNING character you want to trim : " char_count_begining
    echo
    echo "##=========================================================##"
    renames "$char_count_begining" "$t_font"
    echo "##=========================================================##"
    confirms
    echo "Done...!"

}

function trim_end() {
    clear
    t_end=1
    read -p "Enter the n END character you want to trim : " char_count_end
    echo
    echo "##=========================================================##"
    renames "$char_count_end" "$t_end"
    echo "##=========================================================##"
    confirms
    echo "Done...!"

}

function add_text_beginning() {
    clear
    ad_font=1
    read -p "Enter the Charcter or Words to append in BEGINNING : " add_char_begi
    echo
    echo "##=========================================================##"
    renames "$add_char_begi" "$ad_font"
    echo "##=========================================================##"
    confirms

}

function add_text_end() {
    clear
    ad_end=1
    read -p "Enter the Charcter or Words to append in END : " add_char_end
    echo
    echo "##=========================================================##"
    renames "$add_char_end" "$ad_end"
    echo "##=========================================================##"
    confirms

}

function extension_to_extension() {
    clear
    ext_ext=1
    read -p "Enter the New EXTENSION (Extension - Extension) : " ext_ext_char
    echo
    echo "##=========================================================##"
    renames "$ext_ext_char" "$ext_ext"
    echo "##=========================================================##"
    confirms
}

function other_to_extension() {
    clear
    ext_oth=1
    read -p "Enter the New EXTENSION (Other - Extension) : " ext_oth_char
    echo
    echo "##=========================================================##"
    renames "$ext_oth_char" "$ext_oth"
    echo "##=========================================================##"
    confirms

}
function one_by_one_rename() {
    clear
    for i in *$ext; do

        if [[ $i == $0 || $i == "sorting_MD.sh" || $i == "final_touch_MD.sh" ]]; then continue; fi

        if [[ $last_dinner == 1 ]]; then #rename with extension

            read -p "Enter the new file Name [ $i ] : " new_name
            new_name=${new_name:-$i}
            echo $new_name
            mv -- $i $new_name
            echo "Done...!"
            echo

        elif [[ $last_dinner == 2 ]]; then #rename without extension
            # file_n=$)
            read -p "Enter the new file Name Without Extension[ $(echo $i | rev | cut -d '.' -f2 | rev) ] : " new_name
            new_name=${new_name:-$i}
            echo $new_name
            mv -- $i "$new_name.$ext"
            echo "Done...!"
            echo

        else
            echo "Please Enter the Correct Input...!"
        fi
    done

}

#================================================================================================================##
function about_me() {
    echo "1.First: This Script I created for fun but it's going professional."
    echo
    echo "2.Usage: We can Use this rename Script every where. For example: If you downloading  movie unofficaly from any site there is an Copywrite Clam in File Name. So, it's looking ODD if you watching long seies and finding them, So by using these script you can do multiple things by combining the options."
    echo
    echo "3.Promotion Usage: If you want to promote your website where you want to give the name of your website in the beginning of your file then you can do. Here you can rename multiple files at a time."
    echo
    echo "4.My Purpose: I start to Creating the 'Renames Script' for the Deleting the big length of file and Customizing my movie / series with my Choices and Libary."
    echo
    echo "5.Who am I : I am Noob, is known as Manish....! Loving For maya4u if you want to contact me then ping me on this mail --> memaya4u@gmail.com"
    echo
    echo "6.Developed by : Only Me... No team Work...!"
    echo
    echo "7.Can You Use this for Free?"
    echo "      Yes, You can go for personal and Commercial Use...! "
    echo
    echo "8.Collaboration : Yeh...! I am a Traveler....! I work for Open Source Project :)"
    echo
}
#================================================================================================================##

function choose_options() {
    echo "1 For Trim"
    echo "2 For Addding Text"
    echo "3 For Changing Extension"
    echo "4 For Sorting"
    echo "5 Space Remover"
    echo "6 One By One Manual Rename"
    echo "7 About me :_)"

    #One by one Renaming
    #One by one All in one Renaming with all function
    #
    read options
    clear

    case $options in
    1)
        echo "You have choosen for Trim now Select the options : "
        echo "1 For Beginning Trim"
        echo "2 For End Trim"
        read trim
        case $trim in
        1)
            trim_beginning
            ;;
        2)
            trim_end
            ;;
        *)
            echo "Please Enter the Correct Input...!"
            ;;
        esac

        ;;
    2)
        echo "You choosen for Adding Text now Select the options : "
        echo "1 For Adding Text to Beginning"
        echo "2 For Adding Text to End"
        read add_text
        case $add_text in
        1)
            add_text_beginning
            ;;
        2)
            add_text_end
            ;;
        *)
            echo "Please Enter the Correct Input...!"
            ;;
        esac

        ;;
    3)
        echo "You choosen for changing Extenstion now Select the options : "
        echo "1 For Extension to Extension"
        echo "2 For Non-Extension to Extension"
        read extension
        case $extension in
        1)
            extension_to_extension
            ;;
        2)
            other_to_extension
            ;;
        *)
            echo "Please Enter the Correct Input...!"
            ;;
        esac

        ;;
    4)
        bash sorting_MD.sh

        ;;

    5)
        bash final_touch_MD.sh

        ;;
    6)
        echo "You have Choosen For One by One Rename...! Please Choose the Options: "
        echo "1 For Rename With Extension"
        echo "2 For Rename Without Extension"
        read last_dinner

        one_by_one_rename
        ;;

    7)

        about_me
        ;;

    *)
        echo "Please Enter the Correct Input...!"
        ;;
    esac

}

function main() {
    extension_fetch_show
    choose_options

}

main
