@{

RootModule = "ezform.psm1"
NestedModules = @(
	'elements\form.psm1',
	'elements\button.psm1',
    	'elements\label.psm1',
	'elements\listview.psm1',
	'elements\picture.psm1',
	'elements\progressbar.psm1',
	'elements\statusbar.psm1',
	'elements\textbox.psm1')
ModuleVersion = '0.0.1.0'
Author = 'archdukejim'
Description = 'Simplifies Powershell Form Building'
FunctionsToExport = @("Start-ezform","New-Form","New-Button","New-TextBox","New-Label","New-ListView")
CmdletsToExport = @("New-Form","New-Button","New-TextBox","New-Label","New-ListView")
VariablesToExport = '*'
AliasesToExport = @()

# CompanyName = 'Unknown'
# Copyright = '(c) Archdukejim. All rights reserved.'
# CompatiblePSEditions = @()
# GUID = 'b632e90c-df3d-4340-9f6c-3b832646bf87'
# PowerShellVersion = ''
# PowerShellHostName = ''
# PowerShellHostVersion = '' #minimum version
# DotNetFrameworkVersion = '' #minimum version
# CLRVersion = '' #minimum version
# ProcessorArchitecture = '' # Processor architecture (None, X86, Amd64) required by this module
# RequiredModules = @()
# RequiredAssemblies = @()
# ScriptsToProcess = @()
# TypesToProcess = @() # Type files (.ps1xml) to be loaded
# FormatsToProcess = @() Format files (.ps1xml) to be loaded

# DscResourcesToExport = @()
# ModuleList = @()
# FileList = @()

PrivateData = @{
    PSData = @{
        # Tags = @()
        # LicenseUri = '' #URL*
        # ProjectUri = ''
        # IconUri = ''
        # ReleaseNotes = ''
        # Prerelease = ''
        # RequireLicenseAcceptance = $true
        # ExternalModuleDependencies = @()
    }
}
# HelpInfoURI = ''
# DefaultCommandPrefix = ''
}
