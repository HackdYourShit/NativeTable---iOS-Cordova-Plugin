/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
var app = {
    // Application Constructor
    initialize: function() {
        this.bindEvents();
    },
    // Bind Event Listeners
    //
    // Bind any events that are required on startup. Common events are:
    // 'load', 'deviceready', 'offline', and 'online'.
    bindEvents: function() {
        document.addEventListener('deviceready', this.onDeviceReady, false);        
    },
    // deviceready Event Handler
    //
    // The scope of 'this' is the event. In order to call the 'receivedEvent'
    // function, we must explicity call 'app.receivedEvent(...);'
    onDeviceReady: function() {
        app.receivedEvent('deviceready');
    },
    // Update DOM on a Received Event
    receivedEvent: function(id) {
        var parentElement = document.getElementById(id);
        var listeningElement = parentElement.querySelector('.listening');
        var receivedElement = parentElement.querySelector('.received');

    
        listeningElement.setAttribute('style', 'display:none;');
        receivedElement.setAttribute('style', 'display:block;');

        console.log('Received Event: ' + id);

        var button = document.getElementById("doNativeTable");
        button.addEventListener('click',launchNativeTable,false);
        button.setAttribute('style', 'display:block;');



    }
};

window.onerror = function(message, url, linenumber) {
  alert("JavaScript error: " + message + " on line " + linenumber + " for " + url);
}
function launchNativeTable() {
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
}
