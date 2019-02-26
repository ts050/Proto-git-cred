# Variable Declarations
accounts=([1]=ts050 [2]=ramuthe4nd);
store="/c/Users/vi09496/git/git-tooling";

# Actual code starts here
echo ${accounts[*]};
select account in ${!accounts[@]}
    do 
        source $store/${accounts[$account]}-details.sh;
        break;
    done
echo "using username $user";

# git gibberish goes here
remote=$(git config --get remote.origin.url);
git config --global user.name $user;
git config --global user.email $email;
git config --global --unset credential.helper;
# cmdkey commands are used in the bat files to remove existing credentials
# TODO - Fiure out a way to store the credentials in a way where a new token is not created for every call
# TODO - Figure out a way to handle special characters in username or passwords when the remote call are made
./git-cred-deletion.bat $user;

git config --global credential.helper wincred;
cmd "/c cmdkey /generic:LegacyGeneric:target=git:https://github.com /user:$user /pass:$password"
# git pull https://"\'$user\'":"\'$password\'"@${remote#"https://"} develop;
echo "changed active git account to $user successfully";
