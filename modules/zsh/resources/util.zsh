join() {
  tr '\n' "$1" | sed "s/$1$//"
}

zetnew() {
  ZET_FMT="${ZET_FMT:-%y%V%u}"
  if [[ -z "$KASTEN" ]]; then
    echo '$KASTEN directory is not set' >&2
    return 1
  fi
  zet_num="$(ls $KASTEN | wc -l | printf '%02d')"
  name="$(date +$ZET_FMT)$zet_num"
  echo "$KASTEN/$name.md"
}

ix() {
  curl -F 'f:1=<-' ix.io
}
