function New-Button{
    [CmdletBinding(DefaultParameterSetName='noname')]
    <#
    .DESCRIPTION
        Creates a button powershell object for use on a windows form
	.SYNOPSIS	
		This is currently missing the following capabilities: Colors
    .Parameter xlocation
        Use -xlocation or -x to enter the location on the form, default is 0
    .Parameter ylocation
        Use -ylocation or -y to enter the location on the form, default is 0
    .Parameter height
        Use -height or -h to enter button height in pixels, default is 30
    .Parameter width
        Use -width or -w to enter button width in pixels, default is 130
    .Parameter text
        Use -text to enter text to display on the button
    .Parameter font
        Use -font to enter font type, Default: Microsoft Sans Serif
    .Parameter fontsize
        Use -fontsize to enter text size, Default: 10
    .Parameter disable
        Switch, Use -disable to set the button as disabled on creation
    .Parameter anchor
        use -anchor to change alignment positions, default is Left, Top
        Other options include bottom, right, center
    .Parameter name
        Optional, Use to define variable name
    .Example
        $BUTTON1 = New-Button -height 30 -width 100
    .Example
        $BUTTON1 = New-Button -x 30 -y 30 -h 30 -w 100 -text "press this" -anchor "top, right"
    .Example
        New-Button -name BUTTON1 -xlocation 30 -ylocation 30 -height 30 -width 100 -text "press this" -anchor bottom, left
    #>
    param(
            [Parameter(Mandatory=$true, ParameterSetName='name')]
        [string]$name,
            [Parameter(Mandatory=$false, ParameterSetName='name')]
            [Parameter(Mandatory=$false, ParameterSetName='noname')]
            [Alias('x')]
        [int32]$xlocation,
            [Parameter(Mandatory=$false, ParameterSetName='name')]
            [Parameter(Mandatory=$false, ParameterSetName='noname')]
            [Alias('y')]
        [int32]$ylocation,
            [Parameter(Mandatory=$true, ParameterSetName='name')]
            [Parameter(Mandatory=$true, ParameterSetName='noname')]
            [Alias('h')]
        [int32]$height,
            [Parameter(Mandatory=$true, ParameterSetName='name')]
            [Parameter(Mandatory=$true, ParameterSetName='noname')]
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
        [switch]$disable,
            [Parameter(Mandatory=$false, ParameterSetName='name')]
            [Parameter(Mandatory=$false, ParameterSetName='noname')]
        [string]$anchor
    )
    BEGIN{ 
		$CmdLetButton = $null }
		if(!$font){      $font									= 'Microsoft Sans Serif'}
        if(!$fontsize){ $fontsize								= 10}
        if(!$anchor){   $anchor									= 'Left, Top'}
		if(!$height){	$height									= 30}
		if(!$width){	$width									= 130}
		if(!$xlocation){$xlocation								= 0}
		if(!$ylocation){$ylocation								= 0}
        $CmdLetButton											= New-Object system.Windows.Forms.Button
    PROCESS{
        $CmdLetButton.Height									= $height
        $CmdLetButton.Width										= $width
        $CmdLetButton.text										= $text
        $CmdLetButton.location									= "$xlocation, $ylocation"
        $CmdLetButton.anchor									= $anchor
        $CmdLetButton.Font										= New-Object System.Drawing.Font($font,$fontsize)
        if($disable){$CmdLetButton.enabled						= $false}
        else{$CmdLetButton.enabled								= $true}
    }
    END{
        if(!$name){$CmdLetButton}
        else{New-Variable -Name $name -Scope 2 -Value $CmdLetButton}
	}
}

function Set-Button{
    [CmdletBinding()]
    <#
    .DESCRIPTION
        Modifies an existing button on a form\
    .SYNOPSIS
		Functionality not yet created.  Intent is to allow the user to change any button parameters using the syntax Set-Button -name <ButtonName> <any parameters below>
    .Parameter name
        Use to select the existing FormButton
    .Parameter xlocation
        Use -xlocation or -x to enter the location on the form
    .Parameter ylocation
        Use -ylocation or -y to enter the location on the form
    .Parameter height
        Mandatory, Use -height or -h to enter button height in pixels
    .Parameter width
        Mandatory, Use -width or -w to enter button width in pixels
    .Parameter text
        Use -text to enter text to display on the button
    .Parameter font
        Use -font to enter font type, Default: Microsoft Sans Serif
    .Parameter fontsize
        Use -fontsize to enter text size, Default: 10
    .Parameter disable
        Switch, Use -disable to set the button to disabled
    .Parameter anchor
        use -anchor to change alignment positions, default is Left, Top
        Other options include bottom, right, center
    .Parameter name
        Use to define variable name
    .Example
        $BUTTON1 = New-Button -height 30 -width 100
    .Example
        $BUTTON1 = New-Button -x 30 -y 30 -h 30 -w 100 -text "press this" -anchor "top, right"
    .Example
        New-Button -name BUTTON1 -xlocation 30 -ylocation 30 -height 30 -width 100 -text "press this" -anchor bottom, left
    #>
    param(
    )
    BEGIN{}
    PROCESS{}
    END{}
}

function Disable-Button{
    [CmdletBinding()]
<#
    .DESCRIPTION
        Disables an existing button on a form
    .SYNOPSIS
		Functionality not yet created.  Intent is to allow the user to disable a button using the syntax Disable-Button -name <ButtonName>
	.Parameter name
        Use to select the existing FormButton
	
#>
    param(
    )
    BEGIN{}
    PROCESS{}
    END{}
}

function Enable-Button{
    [CmdletBinding()]
<#
    .DESCRIPTION
        Enables an existing button on a form
    .SYNOPSIS
		Functionality not yet created.  Intent is to allow the user to enable a button using the syntax Enable-Button -name <ButtonName>
    .Parameter name
        Use to select the existing FormButton
#>
    param(
    )
    BEGIN{}
    PROCESS{}
    END{}
}