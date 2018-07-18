cntlm
======


[documentation](http://blog.hoachuck.biz/blog/2013/03/21/howto-set-cntlm-on-mac-os-x/)


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