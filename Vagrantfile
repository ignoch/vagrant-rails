Vagrant::Config.run do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  
  config.vm.forward_port 3000, 3000
  config.vm.customize do |vm|
    vm.name = "Vagrant Rails App"
    vm.memory_size = 1024
  end


  config.vm.provision :chef_solo, :run_list => ["recipe[application]"] do |chef|
    chef.json.merge!({
      :ruby  => { :version  => "2.0.0" }
#      :rails => { 
#        :app_name => "my_app",
#        :version  => "3.2.3",
#        :db_type  => "postgresql"
#      }
    })
  end
end
