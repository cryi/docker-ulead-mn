#!/bin/sh

#  ULEAD Masternode docker template
#  Copyright © 2019 cryon.io
#
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU Affero General Public License as published
#  by the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU Affero General Public License for more details.
#
#  You should have received a copy of the GNU Affero General Public License
#  along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
#  Contact: cryi@tutanota.com


GIT_INFO=$(curl -sL "https://api.github.com/repos/uleadapp/ulead/releases/latest")                            
URL=$(printf "%s\n" "$GIT_INFO" | jq .assets[].browser_download_url -r | grep linux | grep x86_64)                         

if [ -f "./limits.conf" ]; then 
    if grep "NODE_BINARY=" "./limits.conf"; then 
        NODE_BINARY=$(grep "NODE_BINARY=" "./limits.conf" | sed 's/NODE_BINARY=//g')
        if [ -n "$NODE_BINARY" ] && [ ! "$NODE_BINARY" = "auto" ]; then
            URL=$NODE_BINARY
        fi
    fi
fi

case "$URL" in
    *.tar.gz) 
        curl -L "$URL" -o ./ulead.tar.gz
        tar -xzvf ./ulead.tar.gz
        rm -f ./ulead.tar.gz
    ;;
    *.zip)
        curl -L "$URL" -o ./ulead.zip
        unzip ./ulead.zip
        rm -f ./ulead.zip
    ;;
esac

cp -f "$(find . -name uleadd)" .
cp -f "$(find . -name ulead-cli)" .