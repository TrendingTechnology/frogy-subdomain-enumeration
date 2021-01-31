#!/bin/bash

echo -e "


           .,;::::,..      ......      .,:llllc;'.
        .cxdolcccloddl;:looooddooool::xxdlc:::clddl.
       cxo;'',;;;,,,:ododkOOOOOOOOkdxxl:,';;;;,,,:odl
      od:,;,...x0c:c;;ldox00000000dxdc,,:;00...,:;;cdl
     'dc,;.    ..  .o;:odoOOOOOOOOodl,;;         ::;od.
     'ol';          :o;odlkkkkkkkxodl,d          .o;ld.
     .do,o..........docddoxxxxxxxxodo;x,.........:d;od'
     ;odlcl,......,odcdddodddddddddddl:d:.......:dcodl:.
    ;clodocllcccloolldddddddddddddddddoclllccclollddolc:
   ,:looddddollllodddddddddddddddddddddddollllodddddooc:,
   ':lloddddddddddddddddxxdddddddodxddddddddddddddddoll:'
    :cllclodddddddddddddxloddddddllddddddddddddddolcllc:
     :cloolclodxxxdddddddddddddddddddddddxxxxollclool:,
       ::cloolllllodxxxxxxxxxxxxxxkkkxxdolllllooolc:;
         .::clooddoollllllllllllllllllloodddolcc:,
              ,:cclloodddxxxxxxxxxdddoollcc::.
                     .,:ccccccccccc:::.

 / _____)     | |       | |                 (_)        (_______)                                      _  (_)
( (____  _   _| |__   __| | ___  ____  _____ _ ____     _____   ____  _   _ ____  _____  ____ _____ _| |_ _  ___  ____
 \____ \| | | |  _ \ / _  |/ _ \|    \(____ | |  _ \   |  ___) |  _ \| | | |    \| ___ |/ ___|____ (_   _) |/ _ \|  _ \
 _____) ) |_| | |_) | (_| | |_| | | | / ___ | | | | |  | |_____| | | | |_| | | | | ____| |   / ___ | | |_| | |_| | | | |
(______/|____/|____/ \____|\___/|_|_|_\_____|_|_| |_|  |_______)_| |_|____/|_|_|_|_____)_|   \_____|  \__)_|\___/|_| |_|
                                                                                                                        "

########### Taking User Input  ############
chmod +x anew
chmod +x assetfinder
chmod +x findomain-linux
chmod +x httprobe
chmod +x subfinder


echo -e "\e[94m Enter the organisation name (without space): \e[0m"
read org

echo -e "\e[94m Enter the root domain name (eg: frogy.com): \e[0m"
read domain_name

echo -e "\e[92m Hold on! some house keeping tasks being done... \e[0m"

if [[ -d output ]]
then
        :
else
        mkdir output
fi

if [[ -d output/$org ]]
then
        echo -e "\e[94m $org directory already exists in the 'output' folder\e[0m"
else
        echo -e "\e[94m Creating $org directory in the 'output' folder... \e[0m"
        mkdir output/$org
fi

############ Find Subdomains ##############
echo -e "\e[92m Identifying Subdomains \e[0m"
./subfinder -d $domain_name -silent >> all.txt

curl -s "https://crt.sh/?q="$org"&output=json" | jq -r '.[].name_value' | sed '/^$/d' | sed 's/\*\.//g' | grep -v " " | grep -v "@" | grep -v "*" | sort -u  >> all.txt
curl -s "https://crt.sh/?q="$org"%&output=json" | jq -r '.[].name_value' | sed '/^$/d' | sed 's/\*\.//g' | grep -v " " | grep -v "@" | grep -v "*" | sort -u  >> all.txt
curl -s "https://crt.sh/?q=%"$org".%&output=json" | jq -r '.[].name_value' | sed '/^$/d' | sed 's/\*\.//g' | grep -v " " | grep -v "@" | grep -v "*" | sort -u >> all.txt
curl -s "https://crt.sh/?q=%"$org"%&output=json" | jq -r '.[].name_value' | sed '/^$/d' | sed 's/\*\.//g' | grep -v " " | grep -v "@" | grep -v "*" | sort -u  >> all.txt

python3 sublister/sublist3r.py -d $domain_name -o sublister_output.txt &> /dev/null
cat sublister_output.txt >> all.txt
rm sublister_output.txt

./assetfinder $org | ./anew | grep -v " " | grep -v "@" | grep -v "*" >> all.txt

./findomain-linux -t $domain_name -q >> all.txt

echo -e "\e[92m Bruteforcing subdomains using domain name iterations... \e[0m"

############ Generating Wordlist  ##############
cat all.txt | cut -d "." -f1 >> temp_wordlist.txt
cat all.txt | cut -d "." -f2 >> temp_wordlist.txt
cat all.txt | cut -d "." -f3 >> temp_wordlist.txt
cat all.txt | cut -d "." -f4 >> temp_wordlist.txt
cat all.txt | cut -d "." -f5 >> temp_wordlist.txt
cat all.txt | cut -d "." -f6 >> temp_wordlist.txt
cat all.txt | cut -d "." -f7 >> temp_wordlist.txt
cat all.txt | cut -d "." -f8 >> temp_wordlist.txt
cat all.txt | cut -d "." -f9 >> temp_wordlist.txt
cat all.txt | cut -d "." -f10 >> temp_wordlist.txt
cat all.txt | cut -d "." -f11 >> temp_wordlist.txt
cat all.txt | cut -d "." -f12 >> temp_wordlist.txt
cat all.txt | cut -d "." -f13 >> temp_wordlist.txt
cat all.txt | cut -d "." -f14 >> temp_wordlist.txt
cat all.txt | cut -d "." -f15 >> temp_wordlist.txt
cat temp_wordlist.txt | ./anew | sed '/^$/d' | sed 's/\*\.//g' | grep -v " " | grep -v "@" | grep -v "*" | sort -u >> $org-wordlist.txt

rm temp_wordlist.txt
############ Running Crt.sh on all domain iterations  ##############

for i in $(cat $org-wordlist.txt); do curl -s "https://crt.sh/?q="$i"."$org"&output=json" | jq -r '.[].name_value' | sed '/^$/d' | sed 's/\*\.//g' | grep -v " " | grep -v "@" | grep -v "*" | sort -u; done >> all.txt &> /dev/null

############ Housekeeping Tasks ##############

cat all.txt | ./anew >> output/$org/$(date +"%FT%T").txt
rm all.txt

echo -e "\e[36mResult is saved in the output/$org folder.  \e[0m"
cat $org-wordlist.txt >> master_wordlist.txt
if [[ -e output/$org/$org-wordlist.txt ]]
then
        cat $org-wordlist.txt >> output/$org/$org-wordlist.txt
        cat output/$org/$org-wordlist.txt | anew >> output/$org/$org-temp.txt
        rm output/$org/$org-wordlist.txt
        mv output/$org/$org-temp.txt output/$org/$org-wordlist.txt
        rm $org-wordlist.txt
else
        mv $org-wordlist.txt output/$org/
fi

cat master_wordlist.txt | anew >> master_wordlist2.txt; rm master_wordlist.txt; mv master_wordlist2.txt master_wordlist.txt
