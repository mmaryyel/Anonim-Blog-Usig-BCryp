$(document).ready(function() {
  // Este código corre después de que `document` fue cargado(loaded) 
  // completamente. 
  // Esto garantiza que si amarramos(bind) una función a un elemento 
  // de HTML este exista ya en la página. 

// ESTO ES PARA PODER CONFIRMAR EL DELETE
  $(".delete_button").on("click", function(event){
  	//El "this" nos indica a que link le estamos dando click
  	event.preventDefault();
  	var link_select = $(this).attr("id");
    var current_user = $(this).attr("data-current-user");
    if (confirm('Are you sure you wanna delete it?')) {
    //Concatenamos entre los dos strings a la variable "link _select"
    //Para concatenar en JS usamos el signo +
	    $.post("/posts/"+link_select+"/delete", function(data){
	    	console.log(data);
	    	window.location.href = '/users/' + current_user;
	 });   
    }
  });
});


