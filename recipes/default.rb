
Chef::Log.warn("Assuming you have downloaded the amba kit amba_socket-1.0.15.tgz to the chef-amba-kit/files/default directory")

#the plan is to have the recipy simply stall and wait for the file to 'arrive' in the right place 
#constantly pining the user and saying " please put systemc in this location ....

directory "/vagrant/ModelLibrary" do
  action :create
end

cookbook_file Chef::Config[:file_cache_path]+"/amba_socket-1.0.15.tgz" do
  source "amba_socket-1.0.15.tgz"
  mode "0644"
end


bash "Extract amba kit" do
  code <<-EOH
    cd /vagrant/ModelLibrary
    tar -zxf #{Chef::Config[:file_cache_path]}/amba_socket-1.0.15.tgz
    rm -rf amba_socket/dependencies/greensocket
  EOH
  creates "/vagrant/ModelLibrary/amba_socket"
end

