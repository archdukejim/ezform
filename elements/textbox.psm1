function New-Textbox{
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
			Use -width or -w to enter form width in pixels, Default 150
		.parameter text
			Use -text to enter text, Default is <blank>
		.parameter font
			Use -font to enter font type, Default is "Microsoft Sans Serif"
		.parameter fontsize
			Use -fontsize to enter text size, Default is 10
		.parameter readonly
			Use -readonly to set the textbox to readonly, default is read-write
		.parameter anchor
			Use -anchor to change alignment positions, Default is 'Left, Top'
		.parameter multiline
			Use -multiline to enable textbox wrapping, disabled by default
	#>
	param(
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
		[string]$text,
            [Parameter(Mandatory=$false, ParameterSetName='name')]
            [Parameter(Mandatory=$false, ParameterSetName='noname')]
		[string]$Font,
            [Parameter(Mandatory=$false, ParameterSetName='name')]
            [Parameter(Mandatory=$false, ParameterSetName='noname')]
		[int32]$FontSize,
            [Parameter(Mandatory=$false, ParameterSetName='name')]
            [Parameter(Mandatory=$false, ParameterSetName='noname')]
		[switch]$readonly,
            [Parameter(Mandatory=$false, ParameterSetName='name')]
            [Parameter(Mandatory=$false, ParameterSetName='noname')]
		[array]$anchor,
            [Parameter(Mandatory=$false, ParameterSetName='name')]
            [Parameter(Mandatory=$false, ParameterSetName='noname')]
		[switch]$multiline
    )
    BEGIN{
		$CmdLetTextBox 							= $null
		if(!$xlocation){	$xlocation 			= 0}
		if(!$ylocation){	$ylocation 			= 0}
		if(!$height){		$height 			= 30}
		if(!$width){		$width 				= 150}
		if(!$font){			$font 				= 'Microsoft Sans Serif'}
		if(!$fontsize){		$fontsize 			= 10}
        if(!$anchor){		$anchor 			= 'Left, Top'}
        $CmdLetTextbox 							= New-Object system.Windows.Forms.TextBox
	}
    PROCESS{    
        $CmdLetTextBox.location 				= New-Object System.Drawing.Point($xlocation,$ylocation)
		$CmdLetTextBox.Height 					= $height
        $CmdLetTextBox.Width 					= $width
        $CmdLetTextBox.text 					= $text
        $CmdLetTextBox.anchor 					= $anchor
        $CmdLetTextBox.Font 					= New-Object System.Drawing.Font($font,$fontsize)
        if($multiline){$CmdLetTextBox.multiline = $true}
		else{$CmdLetTextBox.multiline			= $false}
        if($readonly){$CmdLetTextBox.readonly 	= $true}
		else{$CmdLetTextBox.readonly			= $false}
    }
    END{ $CmdLetTextBox }
}