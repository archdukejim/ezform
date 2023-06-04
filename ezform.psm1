function Start-EZForm {
	[cmdletbinding()]
	BEGIN{}
	PROCESS{
		Add-Type -AssemblyName System.Windows.Forms
		[System.Windows.Forms.Application]::EnableVisualStyles()
	}
	END{}
}