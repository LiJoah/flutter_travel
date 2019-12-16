#!/bin/zsh

sessionName="flutter-travel"

tmux has-session -t $sessionName
hasSession=$?
type="dev"

if [ "$hasSession" = "0" ]; then
  tmux attach -t $sessionName
  exit 0
fi

if [ $1 = "prod" ]; then
  type=$1
fi

echo "Starting dev session for $sessionName"
tmux new-session -d -s $sessionName -n "compile"
t=$sessionName:"compile"

tmux split-window -vb -t $t "trap '' 2;flutter run --track-widget-creation;$SHELL"
tmux split-window -h -t $t "trap '' 2;flutter packages pub run build_runner watch;$SHELL"
tmux select-pane -D -t $t

tmux attach -t $sessionName

# flutter packages pub run build_runner build
# flutter packages pub run build_runner watch
