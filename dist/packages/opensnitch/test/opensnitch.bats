load test_helper

@test 'should install opensnitch-ubuntu' {
  bash ../opensnitch-ubuntu
  type -P opensnitch-ui opensnitchd
  bash ../opensnitch-ubuntu | grep -q "opensnitch it's currently installed"
}
