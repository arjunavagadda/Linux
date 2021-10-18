#git

git config --help
git config --list
git config --list --show-origin
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
git init
git status
git add . or git add <filename>
git commit -m "<message>"
git pull --allow-unrelated-histories "https://gitlab.com/arjun.avagadda/demo.git"
git remote add origin "https://gitlab.com/arjun.avagadda/demo.git"

git remote -v == gives the link from where u cloned
git push origin master

git config --global credential.helper cache


git status -s (single line)
	== A (Added)
	== M (Modified)
git log --oneline

git log --graph

git show <commitID>

git push <name> master
git push origin f2

git pull = git fetch + merge

git fetch 

git clone

git branch <branch_name>
git checkout <branch_name>

git checkout - >> switches to before branch
git checkout -b <branchname> == if we dont have branch

git reset .

git reset --hard (deletes the files too)

git stash -u

git stash save "<message>"

git stash list 

git stash apply <stash{}> == only applies and will not delete stash

git stash pop == that will take the latest and delete the stash

git stash clear == clears out all the stashes

git stash drop <stash>

git branch -d branch_name == deletes the branch

git push --all origin --> pushes all the branches

git commit -am "commit"

CTRL + SHIFT + w == to move into the boxes

:diffg RE = remote
       Lo = local
	   BA = base
	   
:wqa == to come out

git rebase master -- will chage the base of master to the fetaure branch

git cherry-pick <46a557b> --> it will create new commit with the specific commit id in the other branch

git diff

git clone --single-branch --branch f1 https://github.com/arjunavagadda/testrepo.git

git clone -b inputTest --single-branch --depth 3 <url> ===> clones last 3 commits

#git - corey youtube

git branch <branchname>
git checkout <branchname>

git branch -a

git push -u origin <branchname>

git pull origin master

git push origin master

git remote add origin <url>

git branch --merged

git branch -d <branchname>

git push origin --delete <branchname>



git diff <hash> <hash> == we can compare b/w the commits

--->  git commit --amend -m "correct"

--> git log --stat

--> git clean -df == removed the untracked files

git clean -n - dry run
git clean -f - untracked file deletion
git clean -f -d - untracked directories
git clean -f -x -  to remove untracked .gitignore files

--> git reset --soft
        reset --hard == deletes the files
		

    git rm --cached stashfile
	
	git rm -f testfile ---> this will delete the file from the directory.
	
		
-->  git reflog ==> create git branch to save those changes
    that will be in a detached state HEAD

--> git revert <hash> == this will create new commits by reverting the changes

--> diffmerge
https://sourcegear.com/diffmerge/

--> git add -A == adds all
    git add . == adds only the current dir.
	git add -u == updates only, doesnt add deleted ones
	
--> git tag <v1.0>

git checkout -b <branchname> <tag>

- git tag

git tag --list


- git push origin v1.0
  git push origin --tags == release in github
  
- git tag -d v1.0 >>> deletes the tag



## markdown files


.md or .markdown

# - <h1>
## - <h2>


[GitHub](http://github.com)   == link

![Image of Yaktocat](https://octodex.github.com/images/yaktocat.png) == images/yaktocat

*This text will be italic*
_This will also be italic_

**This text will be bold**
__This will also be bold__

_You **can** combine them_


You can use a CODEOWNERS file to define individuals or teams that are responsible for code in a repository.

https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-on-github/about-code-owners



# Git hooks

- Git hooks are scripts that run automatically every time a particular event occurs in a Git repository

.git/hooks

# bare repo...

git init --bare /opt/apps.git

git pull git fetch

git fetch - when ever person does the changes of the same file u r working u can fetch that and compare then can merge this is the use of git fetch

git clone --single-branch -b brnachname link














