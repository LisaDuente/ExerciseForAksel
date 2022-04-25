
/*getElementByID to access a html element*/
    /*innerHTML defines the content*/
function changeSearchText(){
    document.getElementById("Result").innerHTML = "Pressed this button.";
    //window.alert("Button was pushed"); shows an alert in the browser
    //console.log("Button pressed:read in console");
    //window.print(); /* to print the webpage*/
    sendHttpRequest();
}

function addOne(){
    document.getElementById("Result").innerHTML = document.getElementById("Result").innerHTML + 1;
}

var x = 0;

function doingStuffOnHover(){
    x ++;
    console.log(x)
}

function clearFields(){
    for(var i = 1; i<=document.getElementsByClassName("InputPair").length; i++){
        /*console.log(document.getElementById(i).value)*/
        document.getElementById(i).value = "";
    }
}

//method to get the surname from a client in the database
async function sendHttpRequest(){
   const surname = document.getElementById("SearchInputId").value;

    //starts a GET request that can be altered with "method" (you can set it to POST ect)
    const response = await fetch('http://localhost:8080/person/'+ surname,{
       method:'GET'
   });
   const personList = await response.json();
   //because we got a list from the backend, we want to have the first person in the list
   const person = personList[0];
   //convert the json into a string to parse it as an object
   const string = JSON.stringify(person);
   const obj = JSON.parse(string);

   const stringBirth = JSON.stringify(obj.birthday)
   const objBirth = JSON.parse(stringBirth);
   //you can also access json data inside the first json with . 
   console.log(objBirth.month.month);
   
   //set the shown string to the persons first name
   document.getElementById("Result").innerHTML = obj.firstName /*+" "+ obj.birthday.month.month*/;

}

/* TO POST DATA AS A REFERENCE
async function postName() {
  const object = { name: 'James Gordon' };
  const response = await fetch('/api/names', {
    method: 'POST',
    body: JSON.stringify(object)
  });
  const responseText = await response.text();
  console.log(responseText); // logs 'OK'
}
postName();
*/