package "libxml2-dev"
package "libxslt1-dev"

bash "install rails" do
  user node[:ruby][:user]
  code <<-CODE
    source ~/.rvm/scripts/rvm
    gem install rails -v #{node[:rails][:version]}
  CODE
  environment(node[:rails][:bash_env])
end

rails_new_command = "rails new #{node[:rails][:app_name]} -T"

bash "create new rails project" do
  user node[:ruby][:user]
  cwd  node[:rails][:root]
  code <<-CODE
    source ~/.rvm/scripts/rvm
    #{rails_new_command}
    rm #{node[:rails][:app_name]}/Gemfile*
    rm #{node[:rails][:app_name]}/config/database.yml
  CODE
  environment(node[:rails][:bash_env])
  not_if do
    `ls #{node[:rails][:root]}`.include?(node[:rails][:app_name])
  end
end


include_recipe 'rails::mysql'
