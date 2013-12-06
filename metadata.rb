name             'made-nginx'
maintainer       'YOUR_NAME'
maintainer_email 'YOUR_EMAIL'
license          'MIT'
description      'Installs/Configures made-nginx'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'


depends 'nginx', '>= 1.7.0'
depends 'php'