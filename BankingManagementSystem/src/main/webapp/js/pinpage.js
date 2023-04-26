/**
 * 
 */
 
function myfun()
{
    const accountNumber=document.getElementById("account_number").value;
    const pin=document.getElementById("pin").value;
    const confirmpin=document.getElementById("confirm").value;
    if(accountNumber=="")
    {
        document.getElementById("accountMessage").innerHTML="** Please fill account number";
        document.getElementById("accountMessage").style.color="red";
        return false;
    }
    if(accountNumber!="")
    {
        if(accountNumber.length==12&&!isNaN(accountNumber))
        {
            document.getElementById("accountMessage").innerHTML="Done";
            document.getElementById("accountMessage").style.color="green";
            if(pin=="")
            {
            document.getElementById("pinMessage").innerHTML="** Please fill PIN";
            document.getElementById("pinMessage").style.color="red";
            return false;
            }
            else{
                if(pin.length==4&&!isNaN(pin))
                {
                    document.getElementById("pinMessage").innerHTML="Done";
                    document.getElementById("pinMessage").style.color="green";
                    if(pin!=""&&confirmpin!="")
                    {
                        if(pin==confirmpin)
                        {
                            document.getElementById("confirmMessage").innerHTML="Matched";
                            document.getElementById("confirmMessage").style.color="green";
                            return true
                            ;  
                        }
                        else{
                            document.getElementById("confirmMessage").innerHTML="Not Matched.";
                           document.getElementById("confirmMessage").style.color="red";
                           return false;
                        }
                    }
                    else{
                        document.getElementById("confirmMessage").innerHTML="**Re-enter PIN";
                        document.getElementById("confirmMessage").style.color="red";
                        return false; 
                    }
                    
                    return false;
                }
                else{
                    document.getElementById("pinMessage").innerHTML="PIN should be in 4 Numeric Character.";
                    document.getElementById("pinMessage").style.color="red";
                    return false;
                }
            }
            return false;
        }
        else{
            document.getElementById("accountMessage").innerHTML="Account Number should be 12 Numeric Character.";
            document.getElementById("accountMessage").style.color="red";
            return false;
        }
    }
}