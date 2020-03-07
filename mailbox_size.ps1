# It Creates a list of members and their mailbox sizes in temp folder 
# this can only be run in powershell for exchange on premise


$GroupName = Read-Host "Kindly provide the name of the Distribution Group"
Get-DistributionGroupMember $GroupName | Select Name | Export-Csv C:\Temp\Members.csv -NoTypeInformation
$Members = Import-Csv C:\Temp\Members.csv
$Result = Foreach ($Member in $Members){
Get-MailboxStatistics $Member.Name | Select DisplayName, TotalItemSize
}
$Result | Export-Csv C:\Temp\Result.csv
