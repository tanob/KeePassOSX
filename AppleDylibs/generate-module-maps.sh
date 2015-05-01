#!/bin/sh

DEVELOPER_ROOT=$(xcode-select -p)

for template in `find . -name '*.template'`; do
  sed -e "s|\$DEVELOPER_ROOT|$DEVELOPER_ROOT|" $template > ${template/.template/}
done

