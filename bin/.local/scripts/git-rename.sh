#! /bin/bash
################################################################################
# @description This little helper can interactively guide you to rename
#              name and email of committer and author in your git history.
# @author      Fernandos https://github.com/X4
################################################################################

echo "----------------------------------------"
echo "Rename [0] name / [1] email / [2] both  "
echo "----------------------------------------"
read "v"

if [ $v -eq 0 ] ; then
   
        echo "Enter old email address: "
        read "old_email"
        echo "Enter new author name: "
        read "new_author"
        echo -e "\n"

        git filter-branch --env-filter '
        an="$GIT_AUTHOR_NAME"
        am="$GIT_AUTHOR_EMAIL"
        cn="$GIT_COMMITTER_NAME"
        cm="$GIT_COMMITTER_EMAIL"
        
        if [ "$GIT_COMMITTER_EMAIL" = "$old_email" ]
        then
            cn="$new_author"
        fi
        if [ "$GIT_AUTHOR_EMAIL" = "$old_email" ]
        then
            an="$new_author"
        fi
        
        export GIT_AUTHOR_NAME="$an"
        export GIT_AUTHOR_EMAIL="$am"
        export GIT_COMMITTER_NAME="$cn"
        export GIT_COMMITTER_EMAIL="$cm"
        '

elif [ $v -eq 1 ] ; then
   
        echo "Enter old email address: "
        read "old_email"
        echo "Enter new email address: "
        read "new_email"
        echo -e "\n"
        
        git filter-branch --env-filter '
        an="$GIT_AUTHOR_NAME"
        am="$GIT_AUTHOR_EMAIL"
        cn="$GIT_COMMITTER_NAME"
        cm="$GIT_COMMITTER_EMAIL"
        
        if [ "$GIT_COMMITTER_EMAIL" = "$old_email" ]
        then
            cm="$new_author"
        fi
        if [ "$GIT_AUTHOR_EMAIL" = "$old_email" ]
        then
            am="$new_author"
        fi
        
        export GIT_AUTHOR_NAME="$an"
        export GIT_AUTHOR_EMAIL="$am"
        export GIT_COMMITTER_NAME="$cn"
        export GIT_COMMITTER_EMAIL="$cm"
        '

elif [ $v -eq 2 ] ; then

        echo "Enter old email address: "
        read "old_email"
        echo "Enter new email address: "
        read "new_email"
        echo -e "\n"
        echo "Enter new author name:"
        read "new_author"
        echo -e "\n"

        git filter-branch --env-filter '
        an="$GIT_AUTHOR_NAME"
        am="$GIT_AUTHOR_EMAIL"
        cn="$GIT_COMMITTER_NAME"
        cm="$GIT_COMMITTER_EMAIL"
        
        if [ "$GIT_COMMITTER_EMAIL" = "$old_email" ]
        then
            cn="$new_author"
            cm="$new_email"
        fi
        if [ "$GIT_AUTHOR_EMAIL" = "$old_email" ]
        then
            an="$new_author"
            am="$new_email"
        fi
        
        export GIT_AUTHOR_NAME="$an"
        export GIT_AUTHOR_EMAIL="$am"
        export GIT_COMMITTER_NAME="$cn"
        export GIT_COMMITTER_EMAIL="$cm"
        '
	
fi
