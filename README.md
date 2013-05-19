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
- You can create heiarchy navigation by setting like so:

        nt.setRowSelectCallBackFunction(function(rowId) {
          var item = tableView[rowId];
          nt.hideTable(function() {
            //reinitiate the table here by passing new data
          });
        });


Pre-requisites
-------------------------------------------------------------
~~Tested and known to be working with Cordova Version 1.7.0~~
<br />
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
      var tableView = []; 

      //create an array of items for the listview
      for(var i = 0; i < 300; i++){
        //sectionheaders should be ordered by JS, the plugin wont handle it for you
        //textLabel,detailTextLabel,icon,sectionHeader all required
        tableView.push({
                 'textLabel' : "Item: " + i,
                 'detailTextLabel' : "Description: " + i,
                 'icon': "none",
                 'sectionHeader': "Section 1",
                 'otherstuff': "foobar"
          });
      }

      var nt = window.plugins.NativeTable;

      //all required paramaters
      //navBarColor = black or blue
      nt.createTable({
        'height': 500, 
        'showSearchBar': true, 
        'showNavBar': true, 
        'navTitle': "Channels",
        'navBarColor': 'black',
        'showRightButton': true, 
        'RightButtonText': 'Close',
        'showBackButton': false
      });

      nt.onRightButtonTap(function(){ //fired when right button is clicked
           //trigger hide tableview
           nt.hideTable(function() { 
              //callback when table is hidden
           });
      });
      nt.setRowSelectCallBackFunction(function(rowId) {
        var item = tableView[rowId]; //grab the original item form the tableView array
        //do whatever u want with it
      });

      //send the array data to the table
      nt.setTableData(tableView);

      //show the table
      nt.showTable(function() {
        //table is shown callback
      });

<br />


