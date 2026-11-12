#!/usr/bin/fish

function fishignore --description "generate .gitignore files."
    set -l templates
    set -l append false
    set -l force false
    for arg in $argv
        switch $arg
            case --append -a
                set append true
            case --force -f
                set force true
            case --help -h
                echo "usage: fishignore [templates...] [options]"
                echo ""
                echo "templates: node python rust go java cpp react flutter"
                echo ""
                echo "Options:"
                echo "  -a, --append  append to existing .gitignore"
                echo "  -f, --force   overwrite existing .gitignore"
                echo "  -h, --help    show help"
                return 0
            case '*'
                set -a templates $arg
        end
    end

    if test (count $templates) -eq 0
        echo "available templates:"
        echo "node python rust go java cpp react flutter general"
        read -P "enter templates (space separated): " selection
        set templates (string split ' ' -- $selection)
    end

    if test (count $templates) -eq 0
        echo "no templates selected :("
        return 1
    end

    set -l ignores

 # should just move them to distinct files according to type; fine for now
    for template in $templates
        switch $template
            case node
                set -a ignores "node_modules/" ".npm/" "dist/" "coverage/" ".env"
            case python
                set -a ignores "__pycache__/" "*.py[cod]" ".venv/" "venv/" "*.egg-info/" ".env"
            case rust
                set -a ignores "target/" ".idea/"
            case go
                set -a ignores "*.exe" "*.test" "*.out" "vendor/"
            case java
                set -a ignores "*.class" "*.jar" "target/" ".gradle/"
            case cpp
                set -a ignores "*.o" "*.obj" "*.exe" "*.out" "build/"
            case react
                set -a ignores "node_modules/" "build/" "dist/" ".env" "coverage/"
            case flutter
                set -a ignores ".dart_tool/" ".flutter-plugins" "build/" ".packages"
            case general
                set -a ignores ".DS_Store" "Thumbs.db" "*.log" ".env"
            case '*'
                echo "unknown template: $template"
                return 1
        end
    end

    set ignores (printf '%s\n' $ignores | sort -u)
    if test -f .gitignore
        if test $append = false; and test $force = false
            echo ".gitignore already exists."
            echo "use --append or --force."
            return 1
        end
    end

    if test $append = true
        printf '%s\n' $ignores >> .gitignore
    else
        printf '%s\n' $ignores > .gitignore
    end

    echo "generated .gitignore successfully -- enjoy!"
    echo "location: "(pwd)"/.gitignore"
end
fishignore $argv