function New-ListView{
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
		.parameter font
			Use -font to enter font type, Default is "Microsoft Sans Serif"
		.parameter fontsize
			Use -fontsize to enter text size, Default is 10
		.parameter anchor
			Use -anchor to change alignment positions, Default is 'Left, Top'
		.parameter headers
			use -Headers to set the headers
		.parameter Colsize
			use -ColSize or -columnwidth to set the size of each column, or set the default for all
		.parameter multiselect
			Use -multiselect or -multi to enable label multiselect, disabled by default
		.parameter nolines
			Use -nogrid or -nolines to disable label gridlines, enabled by default
		.parameter checkbox
			Use -checkbox or -check to enable label checkbox, disabled by default
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
        [string]$anchor,
            [Parameter(Mandatory=$false, ParameterSetName='name')]
            [Parameter(Mandatory=$false, ParameterSetName='noname')]
		[array]$Headers,
            [Parameter(Mandatory=$false, ParameterSetName='name')]
            [Parameter(Mandatory=$false, ParameterSetName='noname')]
            [alias('ColumnWidth')]
		[array]$ColSize,
            [Parameter(Mandatory=$false, ParameterSetName='name')]
            [Parameter(Mandatory=$false, ParameterSetName='noname')]
            [alias('multi')]
		[switch]$multiselect,
            [Parameter(Mandatory=$false, ParameterSetName='name')]
            [Parameter(Mandatory=$false, ParameterSetName='noname')]
            [alias('nogrid')]
		[switch]$nolines,
            [Parameter(Mandatory=$false, ParameterSetName='name')]
            [Parameter(Mandatory=$false, ParameterSetName='noname')]
            [alias('check')]
		[switch]$checkbox
    )
    BEGIN{
        $CmdLetListView 										= $null
        $errorsize 												= $Null
        if($colsize){
            if($colsize.count -ne $headers.count){
                [int32]$errorsize 								= $colsize[0]
                $colsize 										= $null
                foreach ($header in $headers){ [array]$colsize += $errorsize }
            } 
            else { 
                foreach($header in $headers){ [array]$colsize += '50' } }} 
        elseif ($headers.count -eq 1){$colsize 				= ($width - 25)} 
        else { foreach($header in $headers){ [array]$colsize 	+= '50' } }
        for($i=0;$i -lt $headers.count; $i++){
            $column 											= $null
            $column 											= New-Object System.Windows.Forms.ColumnHeader
            $column.Text 										= $headers[$i]
            $column.Width 										= $colsize[$i]
            [array]$columns 									+= $column
        }
    }
    PROCESS{
        $column = $Null
        if($anchor){}else{$anchor="left,top"}
        $CmdLetListView                       					= New-Object system.Windows.Forms.ListView
        $CmdLetListView.width                 					= $width
        $CmdLetListView.height                					= $height
        $CmdLetListView.location              					= New-Object System.Drawing.Point($xlocation,$ylocation)
        $CmdLetListView.MultiSelect 							= $multiselect
        $CmdLetListView.View 									= 'Details'
        $CmdLetListView.FullRowSelect 							= $true
        $CmdLetListView.checkboxes								= $checkbox
        $CmdLetListView.Anchor									= $anchor
        if($nolines){$CmdLetListView.GridLines 					= $false} 
		else {$CmdLetListView.GridLines 						= $true}
        foreach($column in $columns){
            [Void]$CmdLetListView.Columns.Add($column)
        }
    }
    END{
        if(!$name){$CmdLetListView}
        else{New-Variable -Name $name -Scope 2 -Value $CmdLetListView}
    }
}

########### Version 0.1.6.0 - ListViewData CmdLets ###############

<#
function Clear-ListView{
    [CmdLetBinding()]
    param(
        [parameter(
                Mandatory=$true,
                HelpMessage='List View to clear')]
            $target)
    BEGIN{}
    PROCESS{$target.listview.items.clear()}
    END{$target.refresh()}
}


function Add-ListViewData{
    [CmdLetBinding()]
    param(
        [Parameter(
                Mandatory=$true,
                HelpMessage='')]
            [Alias('lv')]
            [array]$listview,
        [Parameter(
                Mandatory=$true,
                HelpMessage='')]
            [Alias('data')]
            [array]$data
    )
    BEGIN{
        $CmdLetData = $null
        if($data[0].count -lt $Headercount){

        }
    }
    PROCESS{  }
    END{  }
}
#>
