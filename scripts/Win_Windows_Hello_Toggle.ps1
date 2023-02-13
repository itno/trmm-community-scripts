<#
      .SYNOPSIS
      This will disable or enable Windows Hello on a Windows PC
      .DESCRIPTION
      For enabling or disabling Windows Hello, if no parameters are set it will disable Windows Hello
      .PARAMETER Mode
      2 options: enable and disable
      .EXAMPLE
      -Mode enable
      .NOTES
      2/2023 v1 Initial release by @dinger1986
  #>

param (
    [string] $Mode
)

if ($Mode -eq "enable") {
If (!(Test-Path HKLM:\SOFTWARE\Policies\Microsoft\PassportForWork)) {
    New-Item HKLM:\SOFTWARE\Policies\Microsoft\PassportForWork
    Write-Output "Adding New"
    New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\PassportForWork -Name Enabled -Value 1 -PropertyType DWORD
    New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\PassportForWork -Name DisablePostLogonProvisioning -Value 0 -PropertyType DWORD
} Else {
    Write-Output "Setting Existing"
    Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\PassportForWork -Name Enabled -Value 1
    Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\PassportForWork -Name DisablePostLogonProvisioning -Value 0
}
    
    Exit 0
}

if ($Mode -eq "disable") {
If (!(Test-Path HKLM:\SOFTWARE\Policies\Microsoft\PassportForWork)) {
    New-Item HKLM:\SOFTWARE\Policies\Microsoft\PassportForWork
    Write-Output "Adding New"
    New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\PassportForWork -Name Enabled -Value 0 -PropertyType DWORD
    New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\PassportForWork -Name DisablePostLogonProvisioning -Value 1 -PropertyType DWORD
} Else {
    Write-Output "Setting Existing"
    Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\PassportForWork -Name Enabled -Value 0
    Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\PassportForWork -Name DisablePostLogonProvisioning -Value 1
}
    
    Exit 0
}


If (!(Test-Path HKLM:\SOFTWARE\Policies\Microsoft\PassportForWork)) {
    New-Item HKLM:\SOFTWARE\Policies\Microsoft\PassportForWork
    Write-Output "Adding New"
    New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\PassportForWork -Name Enabled -Value 0 -PropertyType DWORD
    New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\PassportForWork -Name DisablePostLogonProvisioning -Value 1 -PropertyType DWORD
} Else {
    Write-Output "Setting Existing"
    Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\PassportForWork -Name Enabled -Value 0
    Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\PassportForWork -Name DisablePostLogonProvisioning -Value 1
}
