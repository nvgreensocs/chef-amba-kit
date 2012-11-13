
Chef::Log.warn("Assuming you have downloaded the amba kit amba_socket-1.0.15.tgz to the chef-amba-kit/files/default directory")

cookbook_file "/vagrant/ModelLibrary/amba_socket-1.0.15.tgz" do
  source "amba_socket-1.0.15.tgz"
  mode "0644"
end


bash "Extract amba kit" do
  code <<-EOH
    cd /vagrant/ModelLibrary
    tar -zxf amba_socket-1.0.15.tgz
  EOH
  creates "/vagrant/ModelLibrary/amba_socket"
end

