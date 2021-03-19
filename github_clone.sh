#!/bin/bash
GIT_BACKUP_DIR=$(realpath "$0")
GIT_BACKUP_DIR=$(dirname "$GIT_BACKUP_DIR")/repositories	#backup dir = script dir/repos
echo "Repos are saved in $GIT_BACKUP_DIR"

users=( "srahn" "pkorduan" "dudehro" )

for USER in "${users[@]}"
do
	GIT_BACKUP_DIR_USER="$GIT_BACKUP_DIR"/"$USER"

	if [ ! -d "$GIT_BACKUP_DIR_USER" ]; then
		mkdir -p "$GIT_BACKUP_DIR_USER"
	fi
	cd "$GIT_BACKUP_DIR_USER"

	while read REPO
	do
		GIT_BACKUP_DIR_REPO="$GIT_BACKUP_DIR_USER"/$(basename $REPO)

		echo "$GIT_BACKUP_DIR_REPO"

		if [ ! -d "$GIT_BACKUP_DIR_REPO" ]; then
			mkdir -p "$GIT_BACKUP_DIR_REPO"
		fi
		cd "$GIT_BACKUP_DIR_REPO"
		if [ ! -d .git ]; then
			git clone "$REPO" "$GIT_BACKUP_DIR_REPO"
		fi
		git pull

         done < <(curl https://api.github.com/users/$USER/repos?access_token=c7f4d5c97b58eacf43c85d7be9fe39a7bb725fc8 | jq -r .[]'.git_url')
done
