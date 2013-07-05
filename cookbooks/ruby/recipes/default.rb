%W(curl gawk libyaml-dev libsqlite3-dev sqlite3 libgdbm-dev libncurses5-dev libtool pkg-config libffi-dev).each do |pkg|
  package "#{pkg}"
end

execute "install RVM" do
  user "#{node[:ruby][:user]}"
  cwd  "#{node[:ruby][:home]}"
  command "curl -L https://get.rvm.io | bash -s stable --ruby"
  environment({ 'HOME' => node[:ruby][:home], 'USER' => node[:ruby][:user] })
  not_if do
    `ls #{node[:ruby][:home]}`.include?("rvm") &&
    `find #{node[:ruby][:home]}/.rvm/ | grep ruby-`.include?(node[:ruby][:version])
  end
end
