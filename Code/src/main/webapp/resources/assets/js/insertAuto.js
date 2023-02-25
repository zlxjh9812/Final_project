$(document).ready(function() {
	let sc = document.getElementById("Search");
	let sel = sc.value; 
	sc.addEventListener("change", function(e) {
		
		sc = e.target.value;
		
		sel = sc;
		
		//alert(select);
		//값이 바뀔때마다 찍힘
	});

	$( "#autocomplete" ).autocomplete({
		minLength: 1,
        source : function( request, response ) {
            $.ajax({
                url: "autoSearch.do?SC="+sel,
                dataType: "json",
                data: {
                  searchKeyword: request.term,
                  SC : request
                },
                success: function( result ) {
                    response( 
                        $.map( result, function( item ) {
 
                                return {
                                      label: item.data,
                                      value: item.data,
                                      test: item.value,
                                      img : item.img
                                }
                          })
                      );
                }
              });
        },
        select: function( event, ui ) {
       
        $('#moviecode').val(ui.item.test);
        console.log(ui.item.img);
        }
        
        
    }).data("uiAutocomplete")._renderItem = function (ul, item) {
        return $("<li />")
        .data("item.autocomplete", item)
        .append("<div><a><img id = 'autoimg' style='width:75px;height:75px' src='" + item.img + "' />" + item.label + "</a></div>")
        .appendTo(ul);
	};
});


