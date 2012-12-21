/*
 //
 //  Created by Spartak B 
 //  Copyright (c) 2011 Develocorp Inc. All rights reserved.
 //
 */


/**
 * This class exposes NativeTable interface controls to JavaScript, 
 * @constructor
 */
function NativeTable() {
	this.callBackFunction = null;
}


/**
 * Create a nativeTable instance.
 */
NativeTable.prototype.createTable = function(params) {
    Cordova.exec("NativeTable.createTable", params);
};

/**
 * Set table title.
 */
NativeTable.prototype.setTableTitle = function(tableTitle) {
    Cordova.exec("NativeTable.setTableTitle", tableTitle);
};

/**
 * Set table data.
 */
NativeTable.prototype.setTableData = function(tableData) {
    Cordova.exec("NativeTable.setTableData", tableData);
};


/**
 * show nativeTable.
 */
NativeTable.prototype.showTable = function() {
    Cordova.exec("NativeTable.showTable");
};

/**
 * hide nativeTable.
 */
NativeTable.prototype.hideTable = function() {
    Cordova.exec("NativeTable.hideTable");
};


/**
 * sets CallBackFunction.
 */
NativeTable.prototype.setRowSelectCallBackFunction = function(callBkFunc) {
	this.callBackFunction = callBkFunc;
};

/**
 * gets called from native layer.
 */
NativeTable.prototype._onTableViewRowSelect = function(rowId) {
	if(this.callBackFunction)
		this.callBackFunction(rowId);
};



/** Run the constructor **/
Cordova.addConstructor(function()
                       {
                       if(!window.plugins)
                       {
                       window.plugins = {};
                       }
                       window.plugins.nativeTable = new NativeTable();
                       
                       });