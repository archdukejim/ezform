function New-Form{
	[CmdletBinding(DefaultParameterSet=Noname)]
    <#
    .DESCRIPTION
        Creates a powershell object to use as a form
    .Parameter height
		Use -height or -h to enter form height in pixels, Default if blank is 480
    .Parameter width
        Use -width or -w to enter form width in pixels, Default if blank is 640
    .Parameter title
        Use -title or -window to label the form window
    .Parameter iconpath
        Use -icon or -iconpath to enter file location for form Icon
    .Parameter BackgroundImage
		Use -BkgImg or $BackgroundImage to add a picture in the background
	.Parameter BackgroundImageLayout
		Use -BkgImgLO or $BackgroundImageLayout to specify the layout
    .Parameter Position
		Use -pos or -position to specify where the form starts
	.Parameter Maximize
		Switch, Use -maximize to start form as a maximized window
	.Parameter topmost
		Switch, Use -topmost to create new form as topmost window
	.Parameter keypreview
		Switch, Use -keypreview to enable keypreview
	.Parameter name
        Optional, Use to define variable name
    .Example
        $BUTTON1 = New-Form -height 480 -width 640 -title "My First PS Form"
    .Example
    .Example
    #>
	param(
			[Parameter(Mandatory=$false, ParameterSetName='name')]
		[string]$name,
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
			[Alias('window')]
		[string]$title,
			[Parameter(Mandatory=$false, ParameterSetName='name')]
            [Parameter(Mandatory=$false, ParameterSetName='noname')]
			[Alias('Icon')]
		[string]$iconpath,
			[Parameter(Mandatory=$false, ParameterSetName='name')]
            [Parameter(Mandatory=$false, ParameterSetName='noname')]
            [Alias('BkgImg')]
        [string]$BackgroundImage,
			[Parameter(Mandatory=$false, ParameterSetName='name')]
            [Parameter(Mandatory=$false, ParameterSetName='noname')]
            [Alias('BkgImgLO')]
        [string]$BackgroundImageLayout,
			[Parameter(Mandatory=$false, ParameterSetName='name')]
            [Parameter(Mandatory=$false, ParameterSetName='noname')]
            [Alias('pos')]
        [string]$position,
			[Parameter(Mandatory=$false, ParameterSetName='name')]
            [Parameter(Mandatory=$false, ParameterSetName='noname')]
        [switch]$maximize,
			[Parameter(Mandatory=$false, ParameterSetName='name')]
            [Parameter(Mandatory=$false, ParameterSetName='noname')]
        [switch]$topmost,
			[Parameter(Mandatory=$false, ParameterSetName='name')]
            [Parameter(Mandatory=$false, ParameterSetName='noname')]
        [switch]$keypreview
    )
    BEGIN{
		$CmdLetForm										= $null
		$CmdLetForm										= New-Object System.Windows.Forms.Form
		if(!$width){$width 								= 480}
		if(!$height){$height							= 640}
	}
    PROCESS{
        $CmdLetForm.clientsize 							= New-Object System.Drawing.Point($width,$height)
        $CmdLetForm.text 								= $title
        if($iconpath){
            $CmdLetIcon									= New-Object system.drawing.icon ("$iconpath")
            $CmdLetForm.Icon							= $CmdLetIcon}
        if($BackgroundImage){
            $CmdLetBackgroundPath						= [system.drawing.image]::FromFile("$BackgroundImage")
            if($BackGroundImageLayout){$CmdLetForm.BackgroundImageLayout = "$BackgroundImageLayout"}
            else{$CmdLetForm.BackgroundImageLayout 		= "None"}
        }
        if($maximize){$CmdLetForm.MaximizeBox 			= $true}
        if($position){$CmdLetForm.StartPosition 		= $position}
        if($keypreview){$CmdLetForm.KeyPreview 			= $true}
        if($topmost){$CmdLetForm.Topmost 				= $true}
    }
    END{ $CmdLetForm }
}