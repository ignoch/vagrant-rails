set_unless[:rails][:user]     = "vagrant"
set_unless[:rails][:group]    = "vagrant"
set_unless[:rails][:home]     = "/home/#{node[:rails][:user]}"
set_unless[:rails][:app_name] = "project"
set_unless[:rails][:version]  = "4.0.0 "
set_unless[:rails][:root]     = "/vagrant"
set_unless[:rails][:app_root] = "#{node[:rails][:root]}/#{node[:rails][:app_name]}"
set_unless[:rails][:bash_env] = { 'HOME' => node[:rails][:home], 'USER' => node[:rails][:user] }


