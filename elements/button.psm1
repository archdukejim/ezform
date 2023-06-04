function New-Button{
    [CmdletBinding()]
    param(
        [Parameter(
                Mandatory=$false,
                HelpMessage='Use -xlocation or -x to enter the location on the form')]
            [Alias('x')]
            [int32]$xlocation,
        [Parameter(
                Mandatory=$false,
                HelpMessage='Use -ylocation or -y to enter the location on the form')]
            [Alias('y')]
            [int32]$ylocation,
[Parameter(
   Mandatory=$true,
   HelpMessage='Use -height or -h to enter form height in pixels')]
   [Alias('h')]
   [int32]$height,
[Parameter(
   Mandatory=$true,
   HelpMessage='Use -width or -w to enter form width in pixels')]
   [Alias('w')]
   [int32]$width,
[Parameter(
   Mandatory=$false,
   HelpMessage='Use -text to enter text')]
   [string]$text,
[Parameter(
   Mandatory=$false,
   HelpMessage='Use -font to enter font type')]
   [string]$Font,
[Parameter(
   Mandatory=$false,
   HelpMessage='Use -fontsize to enter text size')]
   [int32]$FontSize,
        [Parameter(
                Mandatory=$false,
                Helpmessage='Use -disable to set the button as disabled by default')]
            [switch]$disable,
[Parameter(
   Mandatory=$false,
   Helpmessage='use -anchor to change alignment positions')]
   [string]$anchor
    )
    BEGIN{ $CmdLetButton = $null }
    PROCESS{
if($font){}else{$font = 'Microsoft Sans Serif'}
if($fontsize){}else{$fontsize = 10}
        if($anchor){}else{$anchor = 'Left, Top'}
        $CmdLetButton = New-Object system.Windows.Forms.Button
   $CmdLetButton.Height = $height
        $CmdLetButton.Width = $width
        $CmdLetButton.text = $text
$CmdLetButton.location = "$xlocation,$ylocation"
        $CmdLetButton.anchor = $anchor
$CmdLetButton.Font = New-Object System.Drawing.Font($font,$fontsize)
        if($disable){$CmdLetButton.enabled = $false}else{$CmdLetButton.enabled = $true}
    }
    END{ $CmdLetButton }
}

function Set-Button{
    [CmdletBinding()]
        param(
        )
    BEGIN{}
    PROCESS{}
    END{}
}

function Disable-Button{
    [CmdletBinding()]
        param(
        )
    BEGIN{}
    PROCESS{}
    END{}
}

function Enable-Button{
    [CmdletBinding()]
        param(
        )
    BEGIN{}
    PROCESS{}
    END{}
}