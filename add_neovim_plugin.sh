#!/usr/bin/env bash

url="https://github.com/$1"
path="pack/plugins/opt"

echo $url >> ~/....f

user=$(cut -d "/" -f 4 ~/....f)
plugin=$(cut -d "/" -f 5 ~/....f)

git submodule add --name "$plugin" "$url" "$path/$plugin"

rm -rf ~/....f
