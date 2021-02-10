Most of my dotfiles have a

    source $HOME/.local/conf/vimrc

type line in them so I can store messy settings I don't want to
share on the internet.

The dotfiles check out directly to my $HOME without symlinks or
anything using the method outlined [at this blogpost].

On a new machine, I must

    git clone --bare <git-repo-url> $HOME/.cfg
    alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
    config checkout


[at this blogpost]: https://www.atlassian.com/git/tutorials/dotfiles
