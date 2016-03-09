﻿<#
        .Parameter Scheduler
        Determines the scheduler used - defaults to the environment variable

    [Parameter(Mandatory=$False,ValueFromPipelineByPropertyName=$True)]

    [Parameter(Mandatory=$False)]
    [switch]
    $CSV
    )

Try{
    Import-Module -Name .\MicrosoftHPCServerTools.psm1 -ErrorAction SilentlyContinue -Force
    Import-Module -Name .\lib\MicrosoftHPCServerTools.psm1 -ErrorAction SilentlyContinue -Force
    Import-Module -Name .\deployed-bundles\MicrosoftHPCApp-2.0\lib\MicrosoftHPCServerTools.psm1 -ErrorAction SilentlyContinue -Force
    Add-PSSnapin Microsoft.hpc
}

While(1){
    $collections = @()
    $collections += Get-HpcClusterOverview -Scheduler $Scheduler -ErrorAction SilentlyContinue -WarningAction SilentlyContinue 
    $Collections += Get-HPCClusterStatus -Scheduler $Scheduler | Select-Object ClusterName,AvailableComputeCores,PercentComputeCoresUtilised,PercentComputeCoresUnutilised,PercentTotalCoresAvailable,PercentTotalCoresUnavailable
    ForEach($Data in $collections){
        If($CSV){$Data | ConvertTo-LogscapeCSV}
        Else{$Data | ConvertTo-LogscapeJSON}
    }
    Sleep($Wait)
}