load test_helper


@test 'should install vscode' {
  bash ../vscode-ubuntu
  type -P code
  bash ../vscode-ubuntu 'vscode currently installed'
}
