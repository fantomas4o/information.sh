#!/bin/bash

# Author     : Fedya Serafiev
# Version    : 1.3
# License    : MIT
# Copyright  : Fedya Serafiev (2023)
# Github     : https://github.com/fantomas4o/information.sh
# Contact    : https://urocibg.eu/

# Colors

zeleno="\e[32;1m"
jylto="\e[33m"
_reset="\e[0m"
_novo="\e[0;1;38;5;220m"
cherveno="\e[0;91m"
svetlosinio="\e[0;96m"

ttext=$(echo -e "$cherveno Изберете опция:$_reset")

# Функция за извеждане на менюто
show_menu() {
    echo "======================"
    echo -e "$zeleno Добре дошли в скрипта!$_reset"
    echo "======================"

    echo -e "$_novo Изберете опция:$_reset"
    echo "---------------"
    echo "i - Извежда вашето реално (външно) ip"
    echo "f - Извежда информация за системата ви"
    echo "u - Ъпдейтва системата"
    echo "s - Стартира скриптове подредени по номера: 1,2,3,4,5"
    echo "m - Извежда меню с възможни операции за избор"
    echo "h - Показва помощ"
    echo "q - Изход"
    echo "k - Извежда информация за скрипта"
    echo -e "\n"
}

# Функция за извеждане на помощ
show_help() {
    echo "==============================="	
    echo "Добре дошли в помощната секция:"
    echo "==============================="
    echo "i - Извежда вашето реално (външно) ip"
    echo "f - Извежда информация за системата ви"
    echo "u - Изпълнение на 'u' опция - ъпдейт на системата."
    echo "s - Стартира скриптове подредени по номера: 1,2,3,4,5"
    echo "m - Извежда меню с възможни операции за избор"
    echo "h - Показва помощ"
    echo "q - Изход"
    echo "k - Извежда информация за скрипта"
    echo "За да изберете опция, напишете буквата пред нея и натиснете Enter."
}

# Функция за ъпдейтване на системата
update_system() {
    echo "Извършвам ъпдейт на системата..."
    sudo apt update
    sudo apt dist-upgrade -y
    echo "Системата е ъпдейтвана успешно!"
}


show_menu  # Показваме менюто за първи път

while true; do
    read -p "$ttext " choice
    case $choice in
	    
		i)
            echo "Вашето реално (външно) ip е:"
            qwe=$(curl -s icanhazip.com)
            echo -e "${jylto}${qwe}${_reset}"	   
            ;;
			
		f)
            echo "Информация за системата ви"
            inxi -C -m -G  -n	   
            ;;
 
         k)
            echo ""
            echo -e "Създадох този Bash скрипт, който предоставя удобен начин за изпълнение на различни операции със системата чрез интерактивно меню.\n Този скрипт е предназначен да помогне на потребителя.\n
$svetlosinio Забележка:$_reset\n
Скриптът може да бъде допълнен и подобрен по различни начини, например чрез добавяне на нови опции и др.\n Това е базов пример, който може да бъде настроен и променян съобразно специфичните изисквания и нужди на потребителите."
            echo ""
            ;;

			
		
        m)
            show_menu
            ;;
        u)
            update_system
            ;;
        s)
            echo "Скриптове за избор:"
            scripts=("ka4i" "fedia" "Скрипт 3" "Скрипт 4" "Скрипт 5")
            for i in "${!scripts[@]}"; do
                echo "$i - ${scripts[$i]}"
            done

            read -p "Изберете номер на скрипт: " script_number
            if [[ $script_number -ge 0 && $script_number -lt ${#scripts[@]} ]]; then
                selected_script=${scripts[$script_number]}
                case $script_number in
                    0)
                        echo "Стартирам ka4i.sh..."
                        bash ka4i.sh
                        ;;
                    1)
                        echo "Стартирам fedia..."
                        fedia
                        ;;
                    2)
                        echo "Стартирам script3.sh..."
                        bash script3.sh
                        ;;
                    3)
                        echo "Стартирам script4.sh..."
                        bash script4.sh
                        ;;
                    4)
                        echo "Стартирам script5.sh..."
                        bash script5.sh
                        ;;
                esac
                break  # Излизане от цикъла
            else
                echo "Невалиден номер на скрипт!"
            fi
            ;;
        h)
            show_help
            ;;
        q)
            echo "Благодарим ви, че използвахте скрипта!"
            break
            ;;
        *)
            echo "Невалиден избор! Моля, изберете отново."
            ;;
    esac
done
