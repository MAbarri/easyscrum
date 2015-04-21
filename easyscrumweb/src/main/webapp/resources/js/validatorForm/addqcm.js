jQuery(function(){
	
	$.validator.addMethod("selected",
		    function(value) {
              var b = false;
              if(value == 9) b=false;
              else if(value != 9) b=true;
		        return b;
		    },
		    "Vous n'avez pas selectionné un type."
		);
	
	
	 $('.form_qcm').validate({
			rules: {
				intitule: {
					minlength :2,
					maxlength :30,
					required: true
					
				},
				description: {
					minlength :2,
					maxlength :512,
					required: true
				},
				type_question: {
				required : true,
				selected : true
			 },
				question: {
					minlength :8,
					maxlength :60,
					required: true
				},
				reponse: {
					minlength :8,
					maxlength :60,
					required: true
				}
			},
			messages: {				
				intitule: {
					required: "Vous n'avez pas saisi l'intitule du QCM.",
					minlength :"Champ obligatoir entre 2 et 30 caractères max.",
					maxlength :"Champ obligatoir entre 2 et 30 caractères max."
				},
				description: {
					required: "Vous n'avez pas saisi la description de la formation.",
					minlength :"La taille doit être entre 10 et 512 caractères max.",
					maxlength :"La taille doit être entre 10 et 512 caractères max."
				},
				type_question: {
					required: "Vous n'avez pas selectionner un type."
				},
				question: {
					required: "Vous n'avez pas saisi la question.",
					minlength: "Champ obligatoir entre 8 et 60 caractères max.",
					maxlength : "Champ obligatoir entre 8 et 60 caractères max."
				},
				reponse: {
					required: "Vous n'avez pas saisi la reponse.",
					minlength: "Champ obligatoir entre 8 et 60 caractères max.",
					maxlength : "Champ obligatoir entre 8 et 60 caractères max."
				}
			}
});
});
	 