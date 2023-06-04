function New-Label{
[CmdletBinding()]
    param(
        [Parameter(
                Mandatory=$true,
                HelpMessage='Use -xlocation or -x to enter the location on the form')]
            [Alias('x')]
            [int32]$xlocation,
        [Parameter(
                Mandatory=$true,
                HelpMessage='Use -ylocation or -y to enter the location on the form')]
            [Alias('y')]
            [int32]$ylocation,
[Parameter(
   Mandatory=$false,
   HelpMessage='Use -height or -h to enter form height in pixels')]
   [Alias('h')]
   [int32]$height,
[Parameter(
   Mandatory=$false,
   HelpMessage='Use -width or -w to enter form width in pixels')]
   [Alias('w')]
   [int32]$width,
[Parameter(
   Mandatory=$true,
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
   Helpmessage='use -anchor to change alignment positions')]
   [array]$anchor,
        [Parameter(
                Mandatory=$false,
                Helpmessage='Use -autosize to enable label autosize, disabled by default')]
            [switch]$autosize
    )
    BEGIN{$CmdLetLabel = $null}
    PROCESS{    
if($font){}else{$font = 'Microsoft Sans Serif'}
if($fontsize){}else{$fontsize = 10}
        if($anchor){}else{$anchor = 'Left, Top'}
        $CmdLetLabel = New-Object system.Windows.Forms.Label
        $CmdLetLabel.location = New-Object System.Drawing.Point($xlocation,$ylocation)
   $CmdLetLabel.Height = $height
        $CmdLetLabel.Width = $width
        $CmdLetLabel.text = $text
        $CmdLetLabel.anchor = $anchor
        $CmdLetLabel.Font = New-Object System.Drawing.Font($font,$fontsize)
        if($autosize){$CmdLetLabel.autosize = $true}else{$CmdLetLabel.autosize = $false}
    }
    END{ $CmdLetLabel }
}