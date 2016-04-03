#! /bin/bash

countLines() {
 local filePath=$1
 return `cat $filePath | wc -l`
}
