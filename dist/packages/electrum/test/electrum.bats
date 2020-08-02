load test_helper


@test 'should install electrum-linux' {
  bash ../electrum-linux

  local -r name='Electrum'
  local -r app_image="${name}.AppImage"
  local -r app_icon="${name,}"
  local -r app_desktop="${name}.desktop"

  local -r dest_base_dir="$(realpath ~/.local)"
  local -r app_image_dest_dir="${dest_base_dir}/bin"
  local -r app_desktop_dest_dir="${dest_base_dir}/share/applications"
  local -r app_icon_dest_dir="${dest_base_dir}/share/icons"

  [[ -x "${app_image_dest_dir}/${app_image}" ]]
  [[ -r "${app_icon_dest_dir}/${app_icon}.png" ]]
  [[ -r "${app_desktop_dest_dir}/${app_desktop}" ]]

  bash ../electrum-linux | grep -q "${app_image} currently installed"
}
