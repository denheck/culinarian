if !node['kernel']['machine'].match(/64/).nil?
  arch = 'amd64'
end

remote_file "/tmp/plexmediaserver_0.9.8.18.290-11b7fdd_#{arch}.deb" do
  source "http://downloads.plexapp.com/plex-media-server/0.9.8.18.290-11b7fdd/plexmediaserver_0.9.8.18.290-11b7fdd_#{arch}.deb"
  mode 0644
end

package 'avahi-daemon'
package 'avahi-utils'

dpkg_package "plexmediaserver" do
  source "/tmp/plexmediaserver_0.9.8.18.290-11b7fdd_#{arch}.deb"
  action :install
end
