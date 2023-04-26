/**
 * 
 */
 const formEl=document.getElementById("form");
 const nameEl=document.getElementById("exampleInputText1");
 const numberEl=document.getElementById("exampleInputText2");
 const queryEl=document.getElementById("query");
 
 formEl.addEventListener("submit",()=>{
	x=confirm("Name : "+nameEl.value+", Contact Number : "+numberEl.value+" and Your Query is : "+queryEl.value)
	if(x==true)
	{
		 alert("Hii Mr/Mrs "+nameEl.value+" Team will contact you soon , Thanks for Contacting");
	}
	else
	{
		alert("Please Resubmit Contact Form");
	}

});
