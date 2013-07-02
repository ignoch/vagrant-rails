set_unless[:rails][:app_name] = "project"
set_unless[:rails][:version]  = "4.0.0 "
set_unless[:rails][:root]     = "/vagrant"
set_unless[:rails][:app_root] = "#{node[:rails][:root]}/#{node[:rails][:app_name]}"
set_unless[:rails][:bash_env] = { 'HOME' => node[:ruby][:home], 'USER' => node[:ruby][:user] }


