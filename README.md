NativeTable -- iOS Phonegap Plugin
=============================================================
NativeTable is a plugin that enables users to create and display data using a native UITableView interface in their iOS PhoneGap based application projects.
<br />


Pre-requisites
-------------------------------------------------------------
Tested and known to be working with Cordova Version 1.7.0
<br />


Installing NativeTable
-------------------------------------------------------------

1. Copy the .h and .m files to the Plugins directory in your project
2. Copy the .js file to your www directory and reference it from your html file(s)
3. In the Supporting Files directory of your project, add a new plugin by editing the file Cordova.plist and in the Plugins dictionary adding the following key/value pair:
   key: 	NativeTable
   value: 	NativeTable


<br />

NativeTable usage example from JavaScript code
-------------------------------------------------------------

// prepare table data 
// table data must be an array of items containing 'textLabel' and 'detailTextLabel' key/value pairs
var myTableData = new Array();
for(var i = 0; i < 300; i++){
	myTableData[i] = {
					   'textLabel' :  "Item #" + i,
					   'detailTextLabel' :  "Description #" + i
						};
}

// create a reference to the NativeTable Object
var nt = window.plugins.nativeTable;

// create the UITableView instance (height parameter is required)
nt.createTable({'height':250});

// assign a title to the table heade
nt.setTableTitle('My Native Table');

// set the table data
nt.setTableData(myTableData);

// set the callback function for the row selections
nt.setRowSelectCallBackFunction(function(rowId){
												// callback code goes here
											   alert("Row " + rowId + " Selected!");
							   					});
							   
// to display the UITableView
nt.showTable();

// to hide the UITableView
nt.hideTable();

<br />

BUGS?
-----
Please report to spartak@gmail.com   
<br />


