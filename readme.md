# Basic ATM Implementation using Shell Scripting
This is a basic ATM simulation program implemented using shell scripting. It allows users to perform simple banking operations such as balance inquiry, deposit, and withdrawal.

## Features
- Balance Inquiry
- Deposit Money
- Withdraw Money
- Change Email Address & Password

## Info about the other files
### 1. Account.txt 
Contains several lines in the below format  
*Account Name, Card Number, Email ID, Balance*  

**Account Name:** It should contain First name followed by Last name (with space separated). First and Last names start with capital letters followed by any number of lower letter alphabets.  

**Card Number:** It has 16 digits in the below format <4 Digits>`<space>`<4 Digits>`<space>`<4 Digits>`<space>`<4 Digits>  

**Email ID:** It has the format username@Domain. The username should start with an alphabet (lower/upper) followed by any number of alphabet or digits. Domain should use `<string>`.`<string>`.`<string>`, where strings contain only lower Alphabets.  

**Balance:** Any number >= 0.  

### 2. Credentials.txt
Contains several lines in the below format.  
*Card Number, Password*  

Card number format follows as listed in Account.txt. Passwords can be any string.

## Prerequisites
- Unix/Linux environment with shell scripting support
- Bash shell (or any compatible shell)

## Usage
1. Run the ATM script:
```bash
./atm.sh
```
2. Follow the on-screen prompts to navigate through the ATM.

## Contributing
Feel free to fork the project and submit pull requests.

## Contact
For any issues or suggestions, contact krishna.jhanwar2005@gmail.com