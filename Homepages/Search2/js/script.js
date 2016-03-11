$(document).ready(function(){
	var i=0;
	var ii=0;
	$.ajax({
		type: "GET",
		url: "sites.xml",
		dataType: "xml",
		success: function(xml) {
			var cols = $(xml).find('cols').text();
			var width = $(xml).find('width').text();
			var height = $(xml).find('height').text();
			$(xml).find('bookmark').each(function(){				
				var label = $(this).find('label').text();
				var url = $(this).find('url').text();
				var icon = $(this).find('icon').text();
				if(i%cols == 0){
					ii++;
					$('table').append('<tr id=id'+ii+'></tr>');
				}
				$('<td></td>').html('<div class="App"><div class="AppIcon" onclick="window.location=\'' + url + '\';"><img src="icons/' + icon + '"/><div class="gloss"></div></div><div class="label">' + label + '</div></div>').appendTo('#id'+ii);
				i++;
			});
			$('.App').each(function(i, obj) {

			    var self = $(this);
			    setTimeout(function () {
				    self.addClass('App-fadeIn');
				}, 60);

			});
			$('#search').addClass('OpacityReset')
			document.getElementById('search').style.transform="translate(0,0)";
		}
	});
});