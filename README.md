# h5bp-nginx-php cookbook

# Requirements

Requires the following cookbooks

* nginx 
* php (https://github.com/priestjim/chef-php)

# Usage


    h5bp_nginx_site "my_app" do
        docroot "/var/www/my_app/"
        server_name "my_app.site"
        template "my_app.conf.erb"
    end

