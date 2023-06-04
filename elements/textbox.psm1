function New-Textbox{
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
                Helpmessage='Use -readonly to set the textbox to readonly, disabled by default')]
            [switch]$readonly,
        [Parameter(
   Mandatory=$false,
   Helpmessage='use -anchor to change alignment positions')]
   [array]$anchor,
        [Parameter(
                Mandatory=$false,
                Helpmessage='Use -multiline to enable textbox wrapping, disabled by default')]
            [switch]$multiline
    )
    BEGIN{$CmdLetTextBox = $null}
    PROCESS{    
if($font){}else{$font = 'Microsoft Sans Serif'}
if($fontsize){}else{$fontsize = 10}
        if($anchor){}else{$anchor = 'Left, Top'}
        $CmdLetTextbox = New-Object system.Windows.Forms.TextBox
        $CmdLetTextBox.location = New-Object System.Drawing.Point($xlocation,$ylocation)
   $CmdLetTextBox.Height = $height
        $CmdLetTextBox.Width = $width
        $CmdLetTextBox.text = $text
        $CmdLetTextBox.anchor = $anchor
        $CmdLetTextBox.Font = New-Object System.Drawing.Font($font,$fontsize)
        if($multiline){$CmdLetTextBox.multiline = $true}else{$CmdLetTextBox.multiline = $false}
        if($readonly){$CmdLetTextBox.readonly = $true}else{$CmdLetTextBox.readonly = $false}
    }
    END{ $CmdLetTextBox }
}