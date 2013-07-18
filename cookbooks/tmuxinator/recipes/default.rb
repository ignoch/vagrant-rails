package "tmux"

bash "install tmuxinator" do
  user "#{node[:ruby][:user]}"
  cwd  "#{node[:ruby][:home]}"
  code <<-CODE
    source ~/.rvm/scripts/rvm
    gem install tmuxinator
  CODE
  environment({ 'HOME' => node[:ruby][:home], 'USER' => node[:ruby][:user] })
end

bash "configuring tmuxinator" do
  user "#{node[:ruby][:user]}"
  cwd  "#{node[:ruby][:home]}"
  code <<-CODE
    echo "[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator" >> ~/.bashrc
    echo "export EDITOR='vim'" >> ~/.bashrc
    tmuxinator new app_rails
  CODE
  environment({ 'HOME' => node[:ruby][:home], 'USER' => node[:ruby][:user] })
end

template "#{node[:ruby][:home]}/.tmuxinator/rails_project.yml" do
  source "rails_project.yml.erb"
  mode "0666"
  owner node[:rails][:user]
  owner node[:rails][:group]
  not_if { `ls #{node[:ruby][:home]}/.tmuxinator`.include?("app_rails.yml")}

end
