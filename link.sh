#!/usr/bin/env bash

LINK_DIR=~/.link
LINK_IN=${LINK_DIR}/in.link

# Make sure the directory is there
if [ ! -f $LINK_DIR ]
then
  mkdir -p $LINK_DIR || echo "Failed to create directory: $LINK_DIR"
fi

function link {
  case $1 in
    in)
      # Check if we have a destination
      if [ -z "$2" ]; then
        echo "Error: No destination specified."
        echo "Usage:"
        echo "  link $1 <file>"
        return 1
      fi

      # Perform the linking in
      local inPath=`pwd`/$2
      echo "Linking in \"$inPath\""
      echo $inPath > $LINK_IN
      ;;
    cp|mv|link)
      # First check if we have anything linked in yet
      if ! [ -f "$LINK_IN" ]; then    
        echo "Error: Nothing is linked yet.  First use 'link in file_name'"
        return 1
      fi

      # Check if we have a destination
      if [ -z "$2" ]; then
        echo "Error: No destination specified."
        echo "Usage:"
        echo "  link $1 <file>"
        return 1
      fi

      # Read the paths
      local inPath=`cat $LINK_IN`
      local outPath=$2

      # Perform the actual link
      case $1 in
        cp)
          echo "Linking a copy of $inPath to $outPath"
          cp -r "$inPath" "$outPath"
          ;;
        mv)
          echo "Linking $inPath to $outPath"
          mv "$inPath" "$outPath"
          ;;
        link)
          echo "Opening link-hole from $inPath to $outPath"
          ln -s "$inPath" "$outPath"
          ;;
      esac
      ;;
    *)
      echo "Error: Unknown command: $1"
      echo "Usage:"
      echo "  link {in|cp|mv|link} <file>"
      return 1
  esac
}

if [[ ${BASH_SOURCE[0]} != $0 ]]; then
  export -f link
else
  link "${@}"
  exit $?
fi