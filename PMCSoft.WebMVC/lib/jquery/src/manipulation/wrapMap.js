define( [
	"./support"
], function( support ) {

"use strict";

// We have to close these tags to support XHTML (trac-13200)
var wrapMap = {

	// XHTML parsers do not magically insert elements in the
	// same way that tag soup parsers do. So we cannot shorten
	// this by omitting <tbody> or other required elements.
	thead: [ 1, "<div class="row" >", "  </div>" ],
	col: [ 2, "<div class="row" ><colgroup>", "</colgroup>  </div>" ],
	tr: [ 2, "<div class="row" ><tbody>", "</tbody>  </div>" ],
	td: [ 3, "<div class="row" ><tbody><tr>", "</tr></tbody>  </div>" ],

	_default: [ 0, "", "" ]
};

wrapMap.tbody = wrapMap.tfoot = wrapMap.colgroup = wrapMap.caption = wrapMap.thead;
wrapMap.th = wrapMap.td;

// Support: IE <=9 only
if ( !support.option ) {
	wrapMap.optgroup = wrapMap.option = [ 1, "<select multiple='multiple'>", "</select>" ];
}

return wrapMap;
} );
