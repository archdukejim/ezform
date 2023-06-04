function New-Form{
[CmdletBinding()]
param(
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
   HelpMessage='Use -title or -text to enter form title')]
   [Alias('text')]
   [string]$title,
[Parameter(
   Mandatory=$false,
   HelpMessage='Use -icon or -iconpath to enter file location for form Icon')]
            [Alias('Icon')]
   [string]$iconpath,
        [Parameter(
                Mandatory=$false,
                HelpMessage='Use -BkgImg or $BackgroundImage to add a picture in the background')]
            [Alias('BkgImg')]
            [string]$BackgroundImage,
        [Parameter(
                Mandatory=$false,
                HelpMessage='Use -BkgImgLO or $BackgroundImageLayout to specify the layout')]
            [Alias('BkgImgLO')]
            [string]$BackgroundImageLayout,
[Parameter(
   HelpMessage='Use -pos or -position to specify where the form starts')]
   [Alias('pos')]
            [string]$position,
[Parameter(
   HelpMessage='Use -maximize to start form as a maximized window')]
   [switch]$maximize,
[Parameter(
   HelpMessage='Use -topmost to create new form as topmost window')]
   [switch]$topmost,
[Parameter(
   HelpMessage='Use -keypreview to enable keypreview')]
   [switch]$keypreview
    )
    BEGIN{$CmdLetForm = $null}
    PROCESS{
        $CmdLetForm = New-Object System.Windows.Forms.Form
   $CmdLetForm.clientsize = New-Object System.Drawing.Point($width,$height)
        $CmdLetForm.text = $title
        if($iconpath){
            $CmdLetIcon = New-Object system.drawing.icon ("$iconpath")
            $CmdLetForm.Icon = $CmdLetIcon}
        if($BackgroundImage){
            $CmdLetBackgroundPath = [system.drawing.image]::FromFile("$BackgroundImage")
            if($BackGroundImageLayout){$CmdLetForm.BackgroundImageLayout = "$BackgroundImageLayout"}
            else{$CmdLetForm.BackgroundImageLayout = "None"}
        }
        if($maximize){$CmdLetForm.MaximizeBox = $true}else{$CmdLetForm.MaximizeBox = $false}
        if($position){$CmdLetForm.StartPosition = $position}
        if($keypreview){$CmdLetForm.KeyPreview = $true}else{$CmdLetForm.KeyPreview = $false}
        if($topmost){$CmdLetForm.Topmost = $true}else{$CmdLetForm.topmost = $false}
    }
    END{ $CmdLetForm }
}
