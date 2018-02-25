# Ultimate Git setup for Windows

## Introduction
![Ultimate git setup for Windows](/images/preview.png)

This is my ultimate git setup for windows. You will read how to configure Cmder for higher productivity and take the power of aliases on steroids.

## Getting started
1. [Cmder](#cmder)
1. [Alias for Git (g = git)](#alias-for-git)
1. [Git aliases](#git-aliases)
1. [Git-TFS aliases](#git-tfs-aliases)

### Cmder
Download and install [Cmder](http://cmder.net/). I suggest to go with the full version.

Open cmder and press `Win + Alt + P` to open settings. Make sure your default startup task is `{cmd::Cmder as Admin}` by looking at `Startup` section.

Download `powerline_prompt.lua` and `ultimate-git-win.lua` in `%CMDER_ROOT%\config`.

Download and install `Anonymice Powerline.ttf` font. Go to `Settings > Main > Main console font` and change it to `Anonymice Powerline`.

Restart cmder to get new settings take place.

#### Git GUI and Gitk into Cmder
Sometimes I need to view/track commits in `gitk` or to view my staged/unstaged changes (double checking everything to be commited) in `git gui`, so I've created a tasks with hotkeys to integrate them in cmder. Since they are integrated as part of your terminal you won't do window switching anymore. 

Go to Settings and open `Startup > Tasks`.

Git GUI:

![Setting up git gui](/images/cmder-tasks.png)

1. Create a new task
1. Name it `gitgui`
1. Use `/dir %CD%` for task parameters
1. Add `-cur_console:s1T60V "%ConEmuDir%\..\git-for-windows\cmd\git-gui.exe"` for command
1. Assign `Ctrl + G` as a hotkey
1. Save the settings

Gitk:
1. Create a new task named `gitk`.
1. Use `/dir %CD%` for task parameters.
1. Add `-cur_console:s1T60V "%ConEmuDir%\..\git-for-windows\cmd\gitk.exe"` for command
1. Assign `Ctrl + K` as a hotkey
1. Save the settings
1. Open Gitk by pressing `Ctrl + K` and navigate to color preferences (`Edit > Preferences > Colors`)
1. And setup the colors as following (if you are using Monokai theme for cmder - default):
    - Background: 39 40 34 
    - Foreground: 182 182 73
    - Select bg: 3 131 245
    
![Configuring gitk colors](/images/gitk-colors.PNG)

> *If you add commit or make any changes and want to refresh gitk, just click somewhere in the window and press `F5`. The same applies for git gui.*

### Alias for git
Because I'm too busy (or lazy) to write `git` every time to make an action, I have alias for that. So instead of writing `git status`, I'm writing `g status`.

Let me show you how to set up on your own:
Open `%CMDER_ROOT%\config\user-aliases.cmd` and add
`g=git $*` on a new line.

### Git aliases
In order to gain some speed when working with git you will need **aliases** to **do more with less**. You will became more efficient by typing less characters and executing multiple commands in a single shot. Some quick examples:

---
```
git add --all
git commit -m "Commit message"
```
Could be done by `g ca "Commit message"`

--- 

`git checkout master` could be `g com` - it's 19 characters vs 5.

---

#### Now let me show you how to do that
Open git config for edit (`%HOMEPATH%\.gitconfig`) and add the following configurations:
```
[pretty]
  log = %C(dim magenta)%h%C(cyan)%d%C(reset) %C(yellow)[%C(dim green)%an%C(yellow)] %C(bold white)%s%C(reset) %C(reset)

  [alias]
  s = status -s
  d = difftool
  mr = mergetool
  co = checkout
  com = checkout master
  br = branch
  ca = !git add --all && git commit -m
  c = commit -m
  l = log -12 --graph --pretty=log
  prev = log HEAD -1 --pretty=log --stat
  alias = !git config --list | grep 'alias\\.' | sed 's/alias\\.\\([^=]*\\)=\\(.*\\)/\\1\\t=> \\2/' | sort
  
  hlp = !sh "echo '\n --diff-filter A - Show only files which has had addition \n --stat - Show the detailed status of files \n --name-status - Show only the name of file and modification type'"
```

#### Aliases explanation
I'll skip the obvious aliases like `s = status -s` and explain the others:
- `com` - checking out master branch
- `ca` - commit & add - adding all changes by using --all flag and commit them. Usage: `g ca "<Message>"`
- `l` - git log but using a pretty format to show the last 12 commits as graph
- `prev` - display summary of changes from the previous commit (changed files, insertions / deletion). Just a quick way to check what is the last thing you done before the holiday/weekend.
- `alias` - lists all available aliases
- `hlp` - displays a quick cheatsheet (customized it for you)

#### Clink plugin
The file `ultimate-git-win.lua` (you already have installed) is doing some magic by adding auto completions for all your aliases (including `g=git`), files and branches. So if you want to write `g alias` just write `g al` and press tab - the rest will be autocompleted. The same is with `g co ma` will be completed as `g co master`.

Writing `g co origin/` and pressing tab will display a list with all available branches, so you can pick one of them.

### Git-TFS aliases
TBA