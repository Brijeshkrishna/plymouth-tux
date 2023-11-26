
plymouth-set-default-theme tux
chk_root () {
  if [ ! $( id -u ) -eq 0 ]; then
    echo "The installer must be run as root (sudo)."
    exit
  fi
}

chk_root

DURATION=$1
if [ $# -ne 1 ]; then
  DURATION=10
fi

plymouthd --debug --debug-file=/tmp/plymouth-debug-out
plymouth --show-splash
for ((I=0; I<$DURATION; I++)); do
  plymouth --update=test$I;
  sleep 0.5
  done;
plymouth quit
