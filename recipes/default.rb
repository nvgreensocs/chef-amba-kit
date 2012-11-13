
Chef::Log.warn("Assuming you have downloaded the amba_kit to the chef-amba-kit/files/default directory")

cookbook_file "/tmp/amba_socket-1.0.15.tgz" do
  source "amba_socket-1.0.15.tgz"
  mode "0644"
end

