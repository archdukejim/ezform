function New-ListView{
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
                Helpmessage='use -Headers to set the headers')]
            [array]$Headers,
        [Parameter(
                Mandatory=$false,
                Helpmessage='use -ColSize or -columnwidth to set the size of each column, or set the default for all')]
            [alias('ColumnWidth')]
            [array]$ColSize,
        [Parameter(
                Mandatory=$false,
                Helpmessage='Use -multiselect or -multi to enable label multiselect, disabled by default')]
            [alias('multi')]
            [switch]$multiselect,
        [Parameter(
                Mandatory=$false,
                Helpmessage='Use -nogrid or -nolines to disable label gridlines, enabled by default')]
            [alias('nogrid')]
            [switch]$nolines,
        [Parameter(
                Mandatory=$false,
                Helpmessage='Use -checkbox or -check to enable label checkbox, disabled by default')]
            [alias('check')]
            [switch]$checkbox
    )
    BEGIN{
        $CmdLetListView = $null
        $errorsize = $Null
        if($colsize){
            if($colsize.count -ne $headers.count){
                [int32]$errorsize = $colsize[0]
                $colsize = $null
                foreach ($header in $headers){ [array]$colsize += $errorsize }
            } else { foreach($header in $headers){ [array]$colsize += '50' } }
        } elseif ($headers.count -eq 1){$colsize = ($width - 25)
        } else { foreach($header in $headers){ [array]$colsize += '50' } }
        for($i=0;$i -lt $headers.count; $i++){
            $column = $null
            $column = New-Object System.Windows.Forms.ColumnHeader
            $column.Text = $headers[$i]
            $column.Width = $colsize[$i]
            [array]$columns += $column
        }
    }
    PROCESS{
        $column = $Null
        if($anchor){}else{$anchor="left,top"}
        $CmdLetListView                       = New-Object system.Windows.Forms.ListView
        $CmdLetListView.width                 = $width
        $CmdLetListView.height                = $height
        $CmdLetListView.location              = New-Object System.Drawing.Point($xlocation,$ylocation)
        $CmdLetListView.MultiSelect = $multiselect
        $CmdLetListView.View = 'Details'
        $CmdLetListView.FullRowSelect = $true
        $CmdLetListView.checkboxes = $checkbox
        $CmdLetListView.Anchor = $anchor
        if($nolines){$CmdLetListView.GridLines = $false} else {$CmdLetListView.GridLines = $true}
        foreach($column in $columns){
            [Void]$CmdLetListView.Columns.Add($column)
        }
    }
    END{ $CmdLetListView }
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