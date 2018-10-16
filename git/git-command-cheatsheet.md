# GIT cheatsheet

All Git command people should be aware of.

## Flatten (squash) commits into one

```bash
	git checkout <branch_to_squash> # eg feature/abc
	git rebase -i <base_reference_branch> # eg master
	
	# interactive mode editor will open up
	# then edit, pick the last one and squash the others
	# save, exit
	
	# done
```

## Log & History

Lots of fun stuffs to do with Git log report.

**Complete log with single-lined entries**

```bash
	git log --oneline --deco --all
```

**Show only annotated commits (lots useful)**

```bash
	git log --oneline --deco --simplify-by-decoration
```

**Go away merge commits**

```bash
	git log --no-merges
```

**Show edit spectrums**

```bash
	git log --oneline --stat
```

**Count the number of commits between the period

```bash
	git rev-list AA..BB —-count
```

## Reset

Want to roll back changes (uncommitted) to the previous commit point?

```bash
	git reset HEAD~1 --hard
```

## Remove files from cache

Ever want to remove a tracked file from cache? Git is awesome enough to have this feature.

```bash
	git rm —cached {FILENAME}
```

## Permanently remove some files in the entire history 

People may find themselves sometimes in a situation where they need to remove some sensitive files from the history. Below is the instruction concluded from https://help.github.com/articles/remove-sensitive-data/

- Remove files from Git
```bash
git filter-branch --force --index-filter \
'git rm --cached --ignore-unmatch FILE_TO_REMOVE.EXT' \
--prune-empty --tag-name-filter cat -- —all
```

- Add the file to `.gitignore`. Skip if not needed.

- Force overwriting the remote repository
```bash
	git push origin --force --all
```

- Force overwriting the remote releases. Skip if not needed.
```bash
	git push origin --force --tags
```

- Expire the cache
```bash
	git reflog expire --expire=now --all
	git gc --prune=now
```
