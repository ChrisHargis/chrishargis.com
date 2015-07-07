( function( $ ) {
$( document ).ready(function() {
$('#nav').prepend('<div id="indicatorContainer"><div id="pIndicator"><div id="cIndicator"></div></div></div>');
    var activeElement = $('#nav>ul>li:first');

    $('#nav>ul>li').each(function() {
        if ($(this).hasClass('selected')) {
            activeElement = $(this);
        }
    });


	var posLeft = activeElement.position().left;
	var elementWidth = activeElement.width();
	posLeft = posLeft + elementWidth/2 -6;
	if (activeElement.hasClass('has-sub')) {
		posLeft -= 6;
	}

	$('#nav #pIndicator').css('left', posLeft);
	var element, leftPos, indicator = $('#nav pIndicator');
	
	$("#nav>ul>li").hover(function() {
        element = $(this);
        var w = element.width();
        if ($(this).hasClass('has-sub'))
        {
        	leftPos = element.position().left + w/2 - 12;
        }
        else {
        	leftPos = element.position().left + w/2 - 6;
        }

        $('#nav #pIndicator').css('left', leftPos);
    }
    , function() {
    	$('#nav #pIndicator').css('left', posLeft);
    });
});
} )( jQuery );