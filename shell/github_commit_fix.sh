#!/bin/sh
git filter-branch --env-filter '
OLD_EMAIL="jiangchunming@emay.cn"
CORRECT_NAME="jiangchunming"
CORRECT_EMAIL="jiangchunmingzz@gmail.com"
if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags


# bash shell
# git clone --bare https://github.com/user/example.git
# cd example.git
# git log 查看历史
# git push --force --tags origin 'refs/heads/*'
# cd ..
# rm -rf example.git