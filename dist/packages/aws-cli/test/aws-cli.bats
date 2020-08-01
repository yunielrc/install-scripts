load test_helper


@test 'should install aws-cli-linux' {
  bash ../aws-cli-linux
  type -P aws
  bash ../aws-cli-linux | grep -q 'aws-cli currently installed'
}
