Az plugin
==========

https://medium.com/@MyDiemHo/enable-azure-cli-autocomplete-in-oh-my-zsh-93e79019a20d

I use azure-cli often but was baffled that it doesn’t have autocomplete. After a bit of searching, it turns out azure-cli does have autocomplete; you just have to load it. The script is located at `/usr/local/etc/bash_completion.d`.
I am using Oh-My-Zsh so I added the following line to my `~/.zshrc` (after sourcing `$ZSH/oh-my-zsh.sh`)
source /usr/local/etc/bash_completion.d/az
However, you’ll notice that when you reload your shell, there will be an error
`/usr/local/etc/bash_completion.d/az:21: command not`found: complete
This is because the script is using bash complete, which does not exist in zsh. You can however, make this work by using the zsh completion function.
```
autoload -U +X bashcompinit && bashcompinit
source /usr/local/etc/bash_completion.d/az
```
