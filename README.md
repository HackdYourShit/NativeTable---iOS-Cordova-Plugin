NativeTable -- iOS Phonegap Plugin
=============================================================
NativeTable is a plugin that enables users to create and display data using a native UITableView interface in their iOS PhoneGap based application projects.
<br />


This Fork (treason)
-------------------------------------------------------------
- added a UISearchBar
- Added Navigation Bar
- Added proper section headers
- Added left/right buttons in nav w/ callbacks
- Added slide up/down fade transitions
- Added optional chevron on list items


Pre-requisites
-------------------------------------------------------------
~~Tested and known to be working with Cordova Version 1.7.0~~
Tested and known to be working with Cordova Version 2.2.0 (treason)

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

    var myTableData = new Array();
    for(var i = 0; i < 300; i++){
        myTableData[i] = {
                           'textLabel' :  "Item #" + i,
                           'detailTextLabel' :  "Description #" + i,
                           'hasChildren': true,
                           'sectionHeader': (i < 15) ? 'first 15' : 'last 15'
                            };
    }

    // create a reference to the NativeTable Object
    var nt = window.plugins.NativeTable;

    // create the UITableView 
    nt.createTable({
        'height': $(window).height(), 
        'showSearchBar': false, 
        'showNavBar': true, 
        'navTitle': 'My Native Table',
        'showRightButton': true, 
        'RightButtonText': 'Close',
        'showBackButton': true
    });

    nt.onRightButtonTap(function(){
        //console.log("foo");
       nt.hideTable(function() {
        console.log("hidden");
       });
    });

    nt.onBackButtonTap(function(){
        console.log("foo");
       nt.hideTable(function() {
        console.log("hidden");
       });
    });

    // assign a title to the table header
    // /nt.setTableTitle('My Native Table');

    // set the callback function for the row selections
    nt.setRowSelectCallBackFunction(function(rowId){
        // callback code goes here
       alert("Row " + rowId + " Selected!");
       nt.hideTable(function() {
        console.log("hidden");
       });
    });

    // set the table data
    nt.setTableData(myTableData);

    // to display the UITableView
    nt.showTable(function() {
        console.log("shown");
    });

<br />


