function New-Label{
[CmdletBinding(DefaultParameterSetName='noname')]
    <#
		.Description 
			Adds a textbox powershell object as a variable to the current script
		.parameter name
			Name of the powershell textbox variable created by this script
		.parameter xlocation
			Use -xlocation or -x to enter the location on the form, Default 0
		.parameter ylocation
			Use -ylocation or -y to enter the location on the form, Default 0
		.parameter height
			Use -height or -h to enter form height in pixels, Default 30
		.parameter width
			Use -width or -w to enter form width in pixels, Default 90
		.parameter text
			Mandatory, Use -text to enter text, Default is <blank>
		.parameter font
			Use -font to enter font type, Default is "Microsoft Sans Serif"
		.parameter fontsize
			Use -fontsize to enter text size, Default is 10

		.parameter anchor
			Use -anchor to change alignment positions, Default is 'Left, Top'
		.parameter autosize
			Use -autosize to enable label outer draw dimmensions to be determined by text, disabled by default
	#>
    param(
            [Parameter(Mandatory=$true, ParameterSetName='name')]
        [string]$name,
            [Parameter(Mandatory=$true, ParameterSetName='name')]
            [Parameter(Mandatory=$true, ParameterSetName='noname')]
		[string]$text,
			[Parameter(Mandatory=$false, ParameterSetName='name')]
            [Parameter(Mandatory=$false, ParameterSetName='noname')]
            [Alias('x')]
        [int32]$xlocation,
            [Parameter(Mandatory=$false, ParameterSetName='name')]
            [Parameter(Mandatory=$false, ParameterSetName='noname')]
            [Alias('y')]
		[int32]$ylocation,
            [Parameter(Mandatory=$false, ParameterSetName='name')]
            [Parameter(Mandatory=$false, ParameterSetName='noname')]
            [Alias('h')]
		[int32]$height,
            [Parameter(Mandatory=$false, ParameterSetName='name')]
            [Parameter(Mandatory=$false, ParameterSetName='noname')]
            [Alias('w')]
		[int32]$width,
            [Parameter(Mandatory=$false, ParameterSetName='name')]
            [Parameter(Mandatory=$false, ParameterSetName='noname')]
		[string]$Font,
            [Parameter(Mandatory=$false, ParameterSetName='name')]
            [Parameter(Mandatory=$false, ParameterSetName='noname')]
		[int32]$FontSize,
            [Parameter(Mandatory=$false, ParameterSetName='name')]
            [Parameter(Mandatory=$false, ParameterSetName='noname')]
		[array]$anchor,
            [Parameter(Mandatory=$false, ParameterSetName='name')]
            [Parameter(Mandatory=$false, ParameterSetName='noname')]
		[switch]$autosize
    )
    BEGIN{
		$CmdLetLabel 					= $null
		if(!$font){		$font 			='Microsoft Sans Serif'}
		if(!$fontsize){	$fontsize 		= 10}
        if(!$anchor){	$anchor 		= 'Left, Top'}
		if(!$height){	$height 		= 30}
		if(!$width){	$width 			= 90}
		if(!$xlocation){$xlocation		= 0}
		if(!$ylocation){$ylocation		= 0}
        $CmdLetLabel 					= New-Object system.Windows.Forms.Label
	}
    PROCESS{    
        $CmdLetLabel.location 			= New-Object System.Drawing.Point($xlocation,$ylocation)
        $CmdLetLabel.Font 				= New-Object System.Drawing.Font($font,$fontsize)
		$CmdLetLabel.Height				= $height
        $CmdLetLabel.Width				= $width
        $CmdLetLabel.text				= $text
        $CmdLetLabel.anchor				= $anchor
        if($autosize){$CmdLetLabel.autosize = $true}
		else{$CmdLetLabel.autosize		= $false}
    }
    END{
		if(!$name){	$CmdLetLabel }
        else{New-Variable -Name $name -Scope 2 -Value $CmdLetLabel}
	}
}