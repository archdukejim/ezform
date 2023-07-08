# ezform
Description - creates modules to easily create Windows System Forms in powershell

This reduces the amount of lines of code necessary to initialize and create forms.
As this is just a group of functions used to call different System.Windows.Forms all normal functions of those Powershell Objects will function while using this module.

# How to Use
Import the module either by installing it to the module folder, or using the Import-Module -name "<path to ezform.psd1>"
Loading the module manifest (.psd1) will load all dependent modules and import all functions/cmdlets into powershell.

After the module is installed or loaded via a script, run Start-EZForm.  
This function Adds System.Windows.Forms types and enables the visualization of those types.  
This is a necessity to have the remaing functions work correctly.  (Note: future versions will auto check for this whenever you call any future CmdLets)

Congratuations you are now ready to use the built Form Elements Below!

# New-Button
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

# New-Form
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
        $MAINFORM = New-Form -height 480 -width 640 -title "My First PS Form"
    .Example
		New-Form -name MAINFORM
    .Example
		$MainForm = NewForm -Title "With Picture Background" -BackgroundImage "C:\users\public\pic.bmp" -BackgroundImageLayout Center -Maximize

# New-Label
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
		
# New-ListView
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
		
		
# New-Textbox
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

# Version History

0.0.1.0 - 2023-07-08
This is the first Build of the script.  This is functionaly capable and provides CmdLets to build out a Powershell Form, Button, Textbox, Label, and ListView.

# Current Work
- Provide thorough documentation for all uses of CmdLets and how to build scripts using them and all below work (1.0.0.0 milestone)
- Enable Error Checking for likely errors (0.2.0.0 milestone)
-	-	Error Checking for System Widnows Froms, and Visual Styles
- Create a method to add an array into a listview (0.1.0.0 milestone)
- Add Colors, and images to each existing cmdlet (0.0.C.X milestone)
- Add and test new CmdLets for additional form objects (0.C.X.0)
