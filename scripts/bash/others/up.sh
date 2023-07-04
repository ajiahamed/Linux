#!/usr/bin/env bash
#Function for updating and upgrading

#command 2>&1 | tee /path/to/logfile

red='\e[1;31m'
green='\e[1;32m'
yellow='\e[1;33m'
blue='\e[1;34m'
magenta='\e[1;35m'
cyan='\e[1;36m'
eoc='\e[0m\n'
tab='\n'
colbg="\e[31;43m"
cole="\e[0m"


update (){
        echo " "
        echo -e $colbg"The Process started..... "$cole
        echo " "
#        sudo apt-get update &> /dev/null && sudo apt-get upgrade -y &> /dev/null
        echo "done."
        echo " "
        echo -e $colbg"Updating..... "$cole
        echo " "
        sudo apt update &> /dev/null && sudo apt upgrade -y &> /dev/null
        echo "done."
        echo " "
        echo " "
        echo -e $colbg"Cleaning Up....!!!"$cole
        echo " "
 #       sudo apt-get autoremove -y &> /dev/null && sudo apt-get autoclean -y &> /dev/null
        echo " "
        echo "done."
        echo " "
}

up_banner_01 (){
        clear
        echo -e $yellow
        echo " "
        echo " "
        echo "  _    _           _       _   _                           _ ";
        echo " | |  | |         | |     | | (_)                         | |";
        echo " | |  | |_ __   __| | __ _| |_ _ _ __   __ _              | |";
        echo " | |  | | '_ \ / _\` |/ _\` | __| | '_ \ / _\` |             | |";
        echo " | |__| | |_) | (_| | (_| | |_| | | | | (_| |  _   _   _  |_|";
        echo "  \____/| .__/ \__,_|\__,_|\__|_|_| |_|\__, | (_) (_) (_) (_)";
        echo "        | |                             __/ |                ";
        echo "        |_|                            |___/                 ";
        echo -e $eoc
        echo -e $cyan
        echo " "
        echo ":: Version: 08 ::                       :: Auther: Mr. Nix ::"
        echo " "
        echo -e $eoc
}

up_banner_02 (){
        clear
        echo -e $yellow
        echo " "
        echo " "
        echo "  ____                   _        _    _                       _ ";
        echo " |  _ \                 | |      | |  | |                     | |";
        echo " | |_) |   __ _    ___  | | __   | |  | |  _ __               | |";
        echo " |  _ <   / _\` |  / __| | |/ /   | |  | | | '_ \              | |";
        echo " | |_) | | (_| | | (__  |   <    | |__| | | |_) |  _   _   _  |_|";
        echo " |____/   \__,_|  \___| |_|\_\    \____/  | .__/  (_) (_) (_) (_)";
        echo "                                          | |                    ";
        echo "                                          |_|                    ";
        echo -e $eoc
        echo -e $cyan
        echo " "
        echo ":: Version: 08 ::                       :: Auther: Mr. Nix ::"
        echo " "
        echo -e $eoc
}

sysinfo()
{
    echo -e $yellow"

    Hostname         : `hostname`

    Kernel Version   : `uname -r`

    Uptime           : `uptime | sed 's/.*up \([^,]*\), .*/\1/'`

    Last Reboot Time : `who -b | awk '{print $3,$4}'`

    Ip Address       :`ip addr | awk '{print 'ip'}'`

    "$eoc
}


up_banner_03 (){
        #clear
        echo -e $yellow
        echo " "
        echo " "
        echo "  _   _  _            _______                  _            ";
        echo " | \ | |(_)          |__   __|                (_)           ";
        echo " |  \| | _ __  __ _ __  | | _ __  ___   _ __   _   ___  ___ ";
        echo " | . \ || |\ \/ /| '_ \ | || '__|/ _ \ | '_ \ | | / __|/ __|";
        echo " | |\  || | >  < | | | || || |  | (_) || | | || || (__ \__ \ ";
        echo ' |_| \_||_|/_/\_\|_| |_||_||_|   \___/ |_| |_||_| \___||___/';
        echo "                                                            ";
        echo "                                                            ";
        echo -e $eoc
        echo -e $cyan
        echo " "
        echo ":: Version: 08 ::                       :: Auther: Mr. Nix ::"
        echo " "
        echo -e $eoc
}




