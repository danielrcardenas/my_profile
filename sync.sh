#!/bin/bash
rsync -aqu ~/.zsh_history ~/code/profile/.zsh_history
#rsync -aqu ~/code/profile/.zsh_history ~/.zsh_history
rsync -aqu ~/.bash_history ~/code/profile/.bash_history
#rsync -aqu ~/code/profile/.bash_history ~/.bash_history
#echo "done sync"
