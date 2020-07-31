load test_helper

@test 'should install 4kvideodownloader' {
  bash ../4kvideodownloader-ubuntu
  type -P 4kvideodownloader
  bash ../4kvideodownloader-ubuntu | grep -q '4kvideodownloader currently installed'
}
