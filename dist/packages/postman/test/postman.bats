load test_helper

@test 'should install postman' {
  bash ../postman-linux

  [[ -x /opt/Postman/Postman ]]
  [[ -f /usr/share/applications/Postman.desktop ]]

  bash ../postman-linux | grep -q 'Postman currently installed'
}
