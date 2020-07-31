load test_helper


@test 'should install docker-ubuntu' {
  [[ "$RUN_ON_DOCKER" == true ]] && skip
  bash ../docker-ubuntu

  type -P docker
  type -P docker-compose

  sudo docker run hello-world

  bash ../docker-ubuntu | grep -q 'docker currently installed'
}
