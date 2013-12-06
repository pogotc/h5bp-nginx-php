
define :h5bp_nginx_site, :template => "site.conf.erb" do
	application_name = params[:name]
	template node['nginx']['dir'] + "/sites-enabled/" + application_name do
		source params[:template]
		variables(
	      :params           => params
	    )
	end
end