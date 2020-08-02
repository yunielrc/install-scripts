load test_helper

@test 'should install google-chrome-ubuntu' {
  bash ../google-chrome-ubuntu
  type -P google-chrome
  bash ../google-chrome-ubuntu | grep -q 'google-chrome currently installed'
}
