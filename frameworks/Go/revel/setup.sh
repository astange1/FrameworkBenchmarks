#!/bin/bash

sed -i 's|tcp(.*:3306)|tcp('"${DBHOST}"':3306)|g' src/benchmark/conf/app.conf

# Where to find the go executable
export PATH="$GOROOT/bin:$PATH"

go get -u github.com/robfig/revel/revel
go build -o bin/revel github.com/robfig/revel/revel
bin/revel run benchmark prod &