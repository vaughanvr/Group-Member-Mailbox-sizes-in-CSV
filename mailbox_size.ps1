
# Copyright 2020  (Vaughan) VV
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation,  version 3 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

# It Creates a list of members and their mailbox sizes in temp folder 
# this can only be run in powershell for exchange on premise
# To run at the prompt type ./mailbox_size.ps1 and hit enter.


$GroupName = Read-Host "Kindly provide the name of the Distribution Group"
Get-DistributionGroupMember $GroupName | Select Name | Export-Csv C:\Temp\Members.csv -NoTypeInformation
$Members = Import-Csv C:\Temp\Members.csv
$Result = Foreach ($Member in $Members){
Get-MailboxStatistics $Member.Name | Select DisplayName, TotalItemSize
}
$Result | Export-Csv C:\Temp\Result.csv
