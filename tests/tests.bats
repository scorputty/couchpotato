@test "Opening CouchPotato on port 5050" {
  run curl http://localhost:5050
  [ "${status}" -eq 0 ]
}
