load test_helper

@test 'should install popcorn-time-ubuntu' {
  bash ../popcorn-time-ubuntu
  [[ -f /opt/Popcorn-Time/Popcorn-Time ]]
  bash ../popcorn-time-ubuntu | grep -q 'Popcorn-Time currently installed'
}
