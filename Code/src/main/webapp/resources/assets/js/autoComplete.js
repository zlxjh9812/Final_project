$(document).ready(function() {
	let sc = document.getElementById("SC");
	let sel = sc.value; 
	sc.addEventListener("change", function(e) {
		console.log("onchange select", e.target.value);
		sc = e.target.value;
		console.log("sc", sel);
		sel = e.target.value;
		//alert(select);
		//값이 바뀔때마다 찍힘
	});
	$( "#autocompleteText" ).autocomplete({
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
                                      test: item.value
                                }
                          })
                      );
                }
              });
        },
        select: function( event, ui ) {
        console.log(ui.item.label);
        console.log(ui.item.value);
        console.log(ui.item.test);
        $('#moviecode').val(ui.item.test);
        },
        minLength: 1
        
    });
});


