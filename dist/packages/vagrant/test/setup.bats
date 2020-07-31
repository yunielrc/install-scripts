load test_helper


@test 'should install vagrant-ubuntu' {
  bash ../vagrant-ubuntu
  type -P vagrant
  bash ../vagrant-ubuntu | grep -q 'vagrant currently installed'
}
