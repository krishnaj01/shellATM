function seekCredentials(){
	clear
	local authenticated=0	
	while [ $authenticated -eq 0 ]
	do
		echo "Enter card number: "
		read card_no
		echo "Enter password: "
		read -s password
		var=`grep "$card_no" Credentials.txt | awk -F, '{print $2}'`
		if [ $var == $password ]
		then
			echo "Authenticated"
			authenticated=1
			sleep 1
		else
			echo "Invalid Credentials"
			sleep 3
			clear
		fi
	done
}

function menu(){
	while [ true ]
	do
		clear
		echo "Enter the number corresponding to your choice"
		echo "1. Withdraw cash"
		echo "2. Deposit cash"
		echo "3. Settings"
		echo "4. Current Balance"
		echo "5. Exit"
		read -n 1 choice
		
		case $choice in
			1) withdraw ;;
			2) deposit ;;
			3) settings ;;
			4) current ;;
			5) exit 0 ;;
			*) echo "Invalid Choice. Try Again" ;;
		esac
	done
}

function current(){
	clear
	old_balance=`grep "$card_no" Account.txt | awk -F", " '{print $4}'`
	echo "Your current balance is "$old_balance
	sleep 3
}

function withdraw(){
	clear
	read -p "Enter the amount to be withdrawn: " amount
	old_balance=`grep "$card_no" Account.txt | awk -F", " '{print $4}'`
	if [ $amount -lt 0 ]
	then
		echo "Error! Enter a non-negative number"
		sleep 3
	elif [ $amount -gt $old_balance ]
	then
		echo "Insufficient Funds"
		sleep 3
	else
		let new_balance=$old_balance-$amount
		name=`grep "$card_no" Account.txt | awk -F", " '{print $1}'`
		email=`grep "$card_no" Account.txt | awk -F", " '{print $3}'`
		`sed -i "s/$name, $card_no, $email, $old_balance/$name, $card_no, $email, $new_balance/g" Account.txt`
		clear
		echo $amount" withdrawn"
		sleep 3
	fi
}

function deposit(){
	clear
	read -p "Enter the amount to be deposited: " amount
	old_balance=`grep "$card_no" Account.txt | awk -F", " '{print $4}'`
	if [ $amount -lt 0 ]
	then
		echo "Error! Enter a non-negative number"
		sleep 3
	else
		let new_balance=$old_balance+$amount
		name=`grep "$card_no" Account.txt | awk -F", " '{print $1}'`
		email=`grep "$card_no" Account.txt | awk -F", " '{print $3}'`
		`sed -i "s/$name, $card_no, $email, $old_balance/$name, $card_no, $email, $new_balance/g" Account.txt`
		clear
		echo $amount" deposited"
		sleep 3
	fi
}

function settings(){
	clear
	old_email=`grep "$card_no" Account.txt | awk -F", " '{print $3}'`
	echo "Enter the new email address: "
	read new_email
	if [[ $new_email =~ ^[a-zA-Z][a-zA-Z0-9]*@[a-z]+.[a-z]+.[a-z]+$ ]]
	then
		name=`grep "$card_no" Account.txt | awk -F", " '{print $1}'`
		email=`grep "$card_no" Account.txt | awk -F", " '{print $3}'`
		balance=`grep "$card_no" Account.txt | awk -F", " '{print $4}'`
		`sed -i "s/$name, $card_no, $old_email, $balance/$name, $card_no, $new_email, $balance/g" Account.txt`
		clear
		echo "Email address changed successfully!"
		sleep 2
	else
		echo "Invalid email address!"
		sleep 3
	fi
}


clear
echo "**** Welcome to My shellATM ****"
echo "**** Press any key to continue ***"
read -s -n 1
seekCredentials
menu




