load test_helper

@test 'should install stremio & config' {
  bash ../stremio-ubuntu
  type -P stremio
  bash ../stremio-ubuntu | grep -q "${app_image} currently installed"
}
