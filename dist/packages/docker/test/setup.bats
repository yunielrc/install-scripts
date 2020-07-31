load test_helper


@test 'should install docker-ubuntu' {
  bash ../docker-ubuntu

  type -P docker
  type -P docker-compose

  sudo docker run hello-world

  run bash ../docker-ubuntu

  assert_success
  assert_output --partial 'docker currently installed'
}
