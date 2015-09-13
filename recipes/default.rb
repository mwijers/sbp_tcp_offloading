#
# Cookbook Name:: sbp_tcp_offloading
# Recipe:: default
#
# Copyright 2014, Schuberg Philis
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
#

if platform_family?('windows')
  include_recipe 'sbp_tcp_offloading::windows'
  include_recipe 'sbp_tcp_offloading::citrix'
#elsif platform_family?('rhel')          => Example of the correct way to add this functionality for other platforms
# include_recipe 'sbp_tcp_offloading::rhel'  => Example of the correct way to add this functionality for other platforms
end
