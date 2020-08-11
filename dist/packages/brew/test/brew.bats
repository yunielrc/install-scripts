load test_helper

@test 'should install brew-ubuntu' {
  bash ../brew-ubuntu &> /dev/null

  [[ -f /home/linuxbrew/.linuxbrew/bin/brew ]]

  bash ../brew-ubuntu | grep -q 'brew currently installed'
}
