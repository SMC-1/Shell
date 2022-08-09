#!/bin/bash
#Santiago Mesa 041044858 mesa0012@algonquinlive.com
#

function line(){
	for ((i=0;i<$1;i++))
	do
		echo -n "#-#-"
	done
	echo
}

function pause(){
	echo
	read -p 'Press enter to continue'
}
clear
line 20
echo
read name < <(whoami);
read username < <(grep $name /etc/passwd | cut -d':' -f 5 | cut -d',' -f 1)
echo "Welcome ${username}"
echo "This is the System Admin menu"
echo "Some administrative task will ask for password"
line 20
echo

flag=1;

while [[ $flag -eq 1 ]]
do
        echo "Enter your choice"
	echo "(P)rint list of users"
	echo "(L)ist the  user groups"
	echo "(A)dd a new user"
	echo "(C)reate a welcome file for user"
	echo "(Q)uit"
	echo 

	read choice
        choice=${choice^^}
 	
	case ${choice} in 
		P) echo "Actual users of the system:" 
		getent passwd {1000..6000} | cut -d':' -f'1,5'
		pause
		clear;;

		L) echo "User groups of the system:"
		getent group {1000..6000} | cut -d':' -f'1'
		pause
		clear;;
		
		A) echo "Enter a login name for a new user:"
                read login
		sudo adduser $login
		echo "User $login created succesfuly!"
		pause
		clear;;

		C) echo "Enter a user name: "
		read user
		echo
		if [[ $user == $(grep -iw $user /etc/passwd | cut -d: -f1) ]];then
			user_home=$(getent passwd $user | cut -d':' -f 6)
			echo "Home directory of $user is: $user_home"
			echo "Creating welcome file ..."
			echo "Welcome to the system $user" > welcome_readme.txt
			#chown $user welcome_readme.txt
			sudo cp welcome_readme.txt $user_home 
			rm welcome_readme.txt
			echo "File created succesfuly"
		else "Error: user $user does not exist." 1>&2 
		fi
		pause
		clear;;	

		Q) echo "Good bye $username"
		flag=0;;
		
		*) echo "Not a valid option. Try again" 1>&2
		pause
		clear;;	
	esac
		
done
