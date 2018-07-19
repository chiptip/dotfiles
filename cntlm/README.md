cntlm
======


[documentation cntlm](http://blog.hoachuck.biz/blog/2013/03/21/howto-set-cntlm-on-mac-os-x/)
[documentation brew](https://robots.thoughtbot.com/starting-and-stopping-background-services-with-homebrew)

## installation

```
brew install cntlm
```

## configuration

```
cp /usr/local/etc/cntlm.conf /usr/local/etc/cntlm.conf.bak
mv /usr/local/etc/cntlm.conf ~/Workspaces/dotfiles/cntlm/
rm /usr/local/etc/cntlm.conf
```

## test NTLM support

```
cntlm -c ~/Workspaces/dotfiles/cntlm/cntlm.conf -M http://www.yahoo.com

Password:
Config profile  1/4... Credentials rejected
Config profile  2/4... OK (HTTP code: 301)
----------------------------[ Profile  1 ]------
Auth            NTLM
PassNT          0C0293AF545EFFB663C84ACDEE30CED4
PassLM          EF649309EED01BE31AC4D06B7C5A6057
------------------------------------------------

# then update cntlm.conf with suggested NTLM config
curl -x http://localhost:3128 http://www.yahoo.com
```

## set up service launch with LaunchAgent

```
# back up original plist file
mv /usr/local/Cellar/cntlm/0.92.3/homebrew.mxcl.cntlm.plist /usr/local/Cellar/cntlm/0.92.3/homebrew.mxcl.cntlm.plist.orig

# copy plist file to git repo for revision
cp /usr/local/Cellar/cntlm/0.92.3/homebrew.mxcl.cntlm.plist.orig ~/Workspaces/dotfiles/cntlm/homebrew.mxcl.cntlm.plist

# create symlink from revisioned plist file to homebrew cellar
ln -s ~/Workspaces/dotfiles/cntlm/homebrew.mxcl.cntlm.plist /usr/local/Cellar/cntlm/0.92.3/ 

# create symlink from revisioned cntlm.conf to etc
ln -s ~/Workspaces/dotfiles/cntlm/cntlm.conf /usr/local/etc/
```

## starting cntlm

```
# to check if cntlm is running
brew services list

# to start cntlm
brew services start cntlm

# to view log
tail -f ~/Library/Logs/Homebrew/cntlm/stderr
```