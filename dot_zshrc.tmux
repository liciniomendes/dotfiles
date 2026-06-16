## This file contains tmux configurations
## Implements an api to automatically configure tmux
## by project.
##
## How to setup:
## Create a folder .tmux on the root of your project
## /home/user/repos/docs/.tmux
##
## This will be the marker for your project, all folders 
## inside docs will reuse the same configurations
##
## Inside '.tmux' you can have 2 files:
## - name: is just a line with the name the tmux pane should have
##	- example: 
##		- docs
## - layout: is the pane layout you want
##	- example: 
## 		- split right 30
##		- focus main
##
## This can be extended as desired

# registers the function to add hooks
autoload -U add-zsh-hook

# finds the .tmux/ folder in the current directory
# tree stopping on root (/)
function _tmux_find_project_root() {
    local dir="$PWD"

    while [[ "$dir" != "/" ]]; do
        if [[ -d "$dir/.tmux" ]]; then
            echo "$dir"
            return 0
        fi

        dir=$(dirname "$dir")
    done

    return 1
}

# applies the name to the tab that is in file 'name'
function _tmux_apply_name() {
    local root="$1"

    if [[ -f "$root/.tmux/name" ]]; then
        local name
        name=$(<"$root/.tmux/name")
        tmux rename-window "$name"
    else
        tmux rename-window "$(basename "$root")"
    fi
}

# applies the layout that is in the 'layout' file
function _tmux_apply_layout() {
    local root="$1"
    local layout_file="$root/.tmux/layout"

    [[ -f "$layout_file" ]] || return

    # avoids recreate same pane
    local panes
    panes=$(tmux list-panes | wc -l | tr -d ' ')

    [[ "$panes" -gt 1 ]] && return

    while read -r cmd arg1 arg2; do
        [[ -z "$cmd" || "$cmd" == \#* ]] && continue

        case "$cmd" in
            split)
                case "$arg1" in
                    right)
			tmux split-window -c "$root" -h -l "${arg2}%"
                        ;;
                    bottom)
			tmux split-window -c "$root" -v -l "${arg2}%"
                        ;;
                esac
                ;;

            focus)
                case "$arg1" in
                    main)
                        tmux select-pane -t 0
                        ;;
                esac
                ;;
        esac
    done < "$layout_file"
}

# apply the configurations
function tmux_project_apply() {
    [[ -z "$TMUX" ]] && return

    local root
    root=$(_tmux_find_project_root) || return

    _tmux_apply_name "$root"
    _tmux_apply_layout "$root"
}

add-zsh-hook chpwd tmux_project_apply
add-zsh-hook precmd tmux_project_apply

# Optional:
# this is for when we already start inside a directory
tmux_project_apply
