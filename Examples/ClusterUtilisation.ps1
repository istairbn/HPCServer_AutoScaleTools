Param(
    [CmdletBinding()]
    [Parameter(Mandatory=$False,ValueFromPipelineByPropertyName=$True)]
    [string]
    $Scheduler = $env:CCP_SCHEDULER,

    [Parameter(Mandatory=$False,ValueFromPipelineByPropertyName=$True)]
    [string]
    $PositionFolder=".\HPCAppRecords_DONOTREMOVE"
    )
Try{
    Import-Module -Name .\MicrosoftHPCServerTools.psm1  -Force -ErrorAction SilentlyContinue
    Import-Module -Name .\lib\MicrosoftHPCServerTools.psm1  -Force -ErrorAction SilentlyContinue
    Import-Module -Name .\deployed-bundles\MicrosoftHPCApp-2.0\lib\MicrosoftHPCServerTools.psm1 -Force 
    Add-PSSnapin Microsoft.hpc
}