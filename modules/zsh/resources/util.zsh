join() {
  tr '\n' "$1" | sed "s/$1$//"
}
