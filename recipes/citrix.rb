#
# Cookbook Name:: sbp_tcp_offloading
# Recipe:: citrix
#
# Copyright 2015, Schuberg Philis
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
#

powershell "Disable Citrix PV NIC Offloading" do
  code <<-EOH
    $root = 'HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\Class\\{4D36E972-E325-11CE-BFC1-08002BE10318}'
    $items = Get-ChildItem -Path Registry::$Root -Name
      Foreach ($item in $items) {
      if ($item -ne "Properties") {
        $path = $root + "\\" + $item
        $DriverDesc = Get-ItemProperty -Path Registry::$path | Select-Object -expandproperty DriverDesc
        if ($DriverDesc -eq "Citrix PV Ethernet Adapter") {
          Set-ItemProperty -path Registry::$path -Name LROIPv4 -Value 0
          Set-ItemProperty -path Registry::$path -Name *LSOv2IPv4 -Value 0
          Set-ItemProperty -path Registry::$path -Name *IPChecksumOffloadIPv4 -Value 0
          Set-ItemProperty -path Registry::$path -Name *TCPChecksumOffloadIPv4 -Value 0
          Set-ItemProperty -path Registry::$path -Name *UDPChecksumOffloadIPv4 -Value 0
          Set-ItemProperty -path Registry::$path -Name NeedChecksumValue -Value 0
        }
      }
   }
  EOH
end
