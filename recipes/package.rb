#
# Author:: Christopher Walters (<cw@chef.io>)
# Author:: Nuo Yan (<nuo@chef.io>)
# Author:: Joshua Timberman (<joshua@chef.io>)
# Author:: Seth Chisamore (<schisamo@chef.io>)
# Cookbook Name:: gecode
# Recipe:: package
#
# Copyright:: Copyright (c) 2011-2016 Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

case node['platform_family']
when 'debian'

  package 'libgecode-dev'

when 'rhel', 'fedora'

  if platform?('redhat') || platform?('centos') || platform?('scientific')
    if node['platform_version'].to_f < 6.0
      raise 'This recipe does not yet support installing Gecode 3.5.0+ from packages on your platform'
    else
      include_recipe 'yum-epel'
    end
  elsif platform?('fedora') && (node['platform_version'].to_f < 16.0)
    raise 'This recipe does not yet support installing Gecode 3.5.0+ from packages on your platform'
  end

  package 'gecode-devel'

else
  raise 'This recipe does not yet support installing Gecode 3.5.0+ from packages on your platform'
end
