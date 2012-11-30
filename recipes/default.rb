
#  -------    CHEF-AMBA --------

# LICENSETEXT
# 
#   Copyright (C) 2007 : GreenSocs Ltd
#       http://www.greensocs.com/ , email: info@greensocs.com
# 
# The contents of this file are subject to the licensing terms specified
# in the file LICENSE. Please consult this file for restrictions and
# limitations that may apply.
# 
# ENDLICENSETEXT

ruby_block "check AMBA kit exits" do
  block do
    puts Chef::Config[:cookbook_path][0]+"/chef-amba-kit/files/default/amba_socket-1.0.15.tgz"
    if File.exists?(Chef::Config[:cookbook_path][0]+"/chef-amba-kit/files/default/amba_socket-1.0.15.tgz")
#      if File.exist?("./cookbooks/chef-amba-kit/files/default/amba_socket-1.0.15.tgz")
#  puts "Ok, we're good to go"
      else
	puts "Please visit : "
	puts "https://portal.carbondesignsystems.com/login.aspx?ReturnUrl=%2fModel%2fCarbon%2fTLM-2.0-AMBA"
	puts "and place the amba kit download in:"
	puts "cookbooks/chef-amba-kit/files/default/amba_socket-1.0.15.tgz"
	exit
      end
  end
end
Chef::Log.warn("Assuming you have downloaded the amba kit amba_socket-1.0.15.tgz to the chef-amba-kit/files/default directory")

#the plan is to have the recipy simply stall and wait for the file to 'arrive' in the right place 
#constantly pining the user and saying " please put systemc in this location ....

directory "/vagrant/ModelLibrary" do
  recursive true
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

