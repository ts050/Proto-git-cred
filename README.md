Proto-git-cred

A hack-job to handle a situation I have at work that can be used to handle multiple git accounts in a deploy env
This dirty piece of code was made to handle a case where the git credentials need to be switched over quickly on a windows machine for parallel deplyments

Highly specific use case and passwords are stored in plain-text

The account details go into individual <username>-details.sh files and and corresponding entries are made in the git-settings-helper.sh file

~~TODO - Handling errors when special characters are present in username or password

TODO - dbstore for credentials

Known Issues - Password prompt is displayed the first time after a credental change is made but hitting return key fixes it
