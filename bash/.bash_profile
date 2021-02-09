#
# Your previous .profile  (if any) is saved as .profile.mpsaved
# Setting the path for MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

##
# Your previous /Users/ignalp/.profile file was backed up as /Users/ignalp/.profile.macports-saved_2010-03-24_at_23:59:47
##

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;


# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;



# MacPorts Installer addition on 2010-03-24_at_23:59:47: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


# Setting PATH for MacPython 2.6
# The orginal version is saved in .profile.pysave
PATH="/Users/ignalp/Library/Python/3.7/bin:${PATH}"
PATH="/opt/local/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH


# Setting EDITOR
export EDITOR=vim
set -o vi
set editing-mode vi

# Setting PATH for GHDL.

PATH=${PATH}:/Developer/Simulator/GHDL/bin
export PATH
##
# Your previous /Users/ignalp/.profile file was backed up as /Users/ignalp/.profile.macports-saved_2015-12-10_at_13:32:07
##

# MacPorts Installer addition on 2015-12-10_at_13:32:07: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# Virtual Environment Wrapper
VIRTUALENVWRAPPER_PYTHON=/opt/local/bin/python3.7
export VIRTUALENVWRAPPER_PYTHON
VIRTUALENVWRAPPER_VIRTUALENV=/opt/local/bin/virtualenv-3.7
export VIRTUALENVWRAPPER_VIRTUALENV
WORKON_HOME=$HOME/.virtualenvs
source /opt/local/bin/virtualenvwrapper.sh

eval "$(fasd --init auto)"


