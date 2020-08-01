load test_helper

@test 'should install brew-linux' {
  bash ../brew-ubuntu &> /dev/null

  [[ -f /home/linuxbrew/.linuxbrew/bin/brew ]]
  [[ -f /home/linuxbrew/.linuxbrew/bin/patchelf ]]

  bash ../brew-ubuntu | grep -q 'brew currently installed'
}
