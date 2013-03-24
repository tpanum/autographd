#!/bin/sh

printf "\e[32m              _                              _         _ \n"
printf "             | |                            | |       | |\n"
printf "   __ _ _   _| |_ ___   __ _ _ __ __ _ _ __ | |__   __| |\n"
printf "  / _\` | | | | __/ _ \ / _\` | '__/ _\` | '_ \| '_ \ / _\` |\n"
printf " | (_| | |_| | || (_) | (_| | | | (_| | |_) | | | | (_| |\n"
printf "  \__,_|\__,_|\__\___/ \__, |_|  \__,_| .__/|_| |_|\__,_|\n"
printf "                        __/ |         | |                \n"
printf "                       |___/          |_|                \n\n\e[0m"

github=("What's the username of your GitHub account?")
fullname=("What is your fullname?")
organization=("What is your organization?")
logo=("What is the filename of logo you want in your signature?")
position=("What's your position?")
department=("What's the name of that department?")
twitter=("What's the username of your Twitter account?")

params=(fullname organization position department github twitter logo)

json_args=""

printf "\e[34m<!> This is version 1, so leaving fields might break templates. So please fill out everything <!>\e[0m\n\n"

for arg in ${params[@]};
do
    var=$arg
    arg=${arg}[@]
    arg=( "${!arg}" )

    skip=false
    while [[ ${#arg[@]} -gt 1 ]]; do
        read -p "${arg[0]}" yn
            case $yn in
                [Yy]* ) var=${arg[1]}
                        arg=${arg[1]}[@]
                        arg=( "${!arg}" );;
                [Nn]* ) skip=true
                        break;;
                * ) echo "Please answer yes or no.";;
            esac
    done

    if [[ $skip == false ]]; then
        printf "\e[36m[?] \e[0m ${arg[0]} \n"
        read -p "-->  " $var
        if [[ ${#var} -gt 0 ]]; then
            json_args="$json_args${var} "
        fi
    fi
done

json="{"
for arg in $json_args;
do
    json="$json \"$arg\":\"${!arg}\","
done
json=$(echo $json | sed s/.$//)
json="$json }"

> my_autographd.json
echo "$json" >> my_autographd.json

 exit