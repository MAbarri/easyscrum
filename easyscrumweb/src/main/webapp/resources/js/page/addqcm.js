	$("#modifier").hide();
	 $(".alert").hide();
     var qcm_exists = false;
     var qcm = new Object();
     var tbqcms = {};

	 $('#ajouter').click(function(event) {
		 if($('.form_qcm').valid()){
		 if(!qcm_exists){
		 var qcmVO = new Object();
		 qcmVO.intitule = $("#intitule").val();
		 qcmVO.description = $("#description").val();
		 qcmVO.questionList = [];
		 tbqcms = JSON.stringify(qcmVO);
		 qcm_exists = true;
		 }
		 qcm = JSON.parse(tbqcms);
		 var questionVO = new Object();
		 questionVO.type    = $("#type_question").val();
		 questionVO.question  = $("#question").val();
		 questionVO.reponseText = $("#reponse").val();
		 qcm.questionList.push(
		   questionVO
		 );
		 if(qcm_has_changed($("#intitule").val(),$("#description").val())){
			 var qcmVO = JSON.parse(tbqcms);
			 qcmVO.intitule = $("#intitule").val();
			 qcmVO.description = $("#description").val();
			 tbqcms = JSON.stringify(qcmVO);
		 }
		 else{
		 tbqcms = JSON.stringify(qcm);
		 }
		 $("#type_question").val('');
		 $("#question").val('');
		 $("#reponse").val('');
		 List();
		 $(".alert").show();
		 $(".alert").html("La question est ajouté avec succes");
		 }
	 });
	 
	 function display(selected_index){
		 var qcmVO = JSON.parse(tbqcms);
			   var question = qcmVO.questionList[selected_index];
			   $("#idquestion").val(selected_index);
			   $("#type_question").val(question.type);
			   $("#question").val(question.question);
			   $("#reponse").val(question.reponseText);
			   $("#modifier").show();
			   $("#ajouter").hide();
			   $(".alert").hide();
	 }
	 
	 function qcm_has_changed(intitule,description){
		 var qcmVO = JSON.parse(tbqcms); 
		 if(qcmVO.intitule == intitule && qcmVO.description == description)
			 return false;
		 else
			 return true;
	 }
	 
	 function Edit(){
		 if($('.form_qcm').valid()){
		 var index = $("#idquestion").val();
		 var qcmVO = JSON.parse(tbqcms);
		 qcmVO.questionList[index].type=$("#type_question").val();
		 qcmVO.questionList[index].question=$("#question").val();
		 qcmVO.questionList[index].reponseText=$("#reponse").val();
		 tbqcms = JSON.stringify(qcmVO);
		 List();
		 $("#modifier").hide();
		 $("#ajouter").show();
		 $(".alert").show();
		 $("#type_question").val('');
		 $("#question").val('');
		 $("#reponse").val('');
		 $(".alert").html("La question est modifié avec succes");
		}
	 }
	 
	 function Delete(index){
	     if (confirm("Voulez-vous supprimer la question ?")) {
		 var qcmVO = JSON.parse(tbqcms);
		 qcmVO.questionList.splice(index, 1);
		 tbqcms = JSON.stringify(qcmVO);
		 List();
		 $(".alert").show();
		 $(".alert").html("Supprimé avec succes");
	     }
	} 
	
	 function List(){	
		 var qcmVO = JSON.parse(tbqcms);
			$("#dynamic-table").html("");
			$("#dynamic-table").html(
				"<thead>"+
				"	<tr>"+
				"	<th>Question</th>"+
				"	<th>Type de réponse</th>"+
				"	<th>Réponse</th>"+
				"	<th>Action</th>"+
				"	</tr>"+
				"</thead>"+
				"<tbody>"+
				"</tbody>"
				);
			 for(var i in qcmVO.questionList){
			   var question = qcmVO.questionList[i];
			   var type = "";
			   if(question.type==0)
				   type="Texte";
			   else 
				   type="Boolean";
			 	$("#dynamic-table tbody").append("<tr>"+
						 "	<td>"+question.question+"</td>" + 
						 "	<td>"+type+"</td>" + 
						 "	<td>"+question.reponseText+"</td>" + 
						 "	<td><a href='#' onClick='display("+i+")' >Modifier </a> <a href='#' onClick='Delete("+i+")' >Supprimer</a></td>" + 
							 "</tr>");
			 }
		} 
	 
	  $('#terminer').click(function(event) {      
	         $.ajax({
	              type: "POST",
	              url: "addqcm",
	              data: tbqcms,
	              beforeSend: function(xhr) {
	                  xhr.setRequestHeader("Accept", "application/json");
	                  xhr.setRequestHeader("Content-Type", "application/json");
	              },
	              success: function(data) {
	                      
	              }
	            });
	     });