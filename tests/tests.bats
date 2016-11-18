@test "Opening CouchPotato" {
  run curl http://localhost:5050
  [ "${status}" -eq 0 ]
}
