error_msg(){
	printf "\e[31m<!>\e[0m "
	printf "${1}\n"
}

install_msg(){
	printf "\e[33m<@>\e[0m "
	printf "${1}\n"
}

check_msg(){
	printf "\e[36m<?>\e[0m "
	printf "${1} ... "
}

check_msg "Checking for Node.js"

check_node=$(node -v | grep "v[0-9]")

if [[ ${#check_node} -gt 0 ]]; then
	printf "\e[32mok\e[0m\n"
else
	printf "\e[31mfailed\e[0m\n"
	error_msg "Couldn't locate Node.js"
fi

check_msg "Checking for npm"

check_npm=$(npm -v | grep "[0-9]\+\.[0-9]\+")

if [[ ${#check_npm} -gt 0 ]]; then
	printf "\e[32mok\e[0m\n"
else
	printf "\e[31mfailed\e[0m\n"
	error_msg "Couldn't locate npm"
fi

check_msg "Checking for installation of handlebars in npm"

check_handlebars=$(npm list handlebars | grep handlebars)

if [[ ${#check_handlebars} -gt 0 ]]; then
	printf "\e[32mok\e[0m\n"
else

	printf "\e[31mfailed\e[0m\n"
	install_msg "Couldn't locate npm package \"handlebars\"."
	check_msg "Installing in node package \"handlebars\" in local directory"
	npm install handlebars &> /dev/null
	installation_hb=$(npm list handlebars -g | grep handlebars)

	if [[ ${#installation_hb} -gt 0 ]]; then
		printf "\e[32mok\e[0m\n"
	fi
fi


