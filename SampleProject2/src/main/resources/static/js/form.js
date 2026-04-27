/*const form = document.getElementById("form")
const uname = document.getElementById("uname")
const email = document.getElementById("email")
const mobile = document.getElementById("mobile")
const address = document.getElementById("address")
const salary = document.getElementById("salary")

const street = document.getElementById("street")
const village = document.getElementById("village")
const city = document.getElementById("city")
const pin = document.getElementById("pin")
const state = document.getElementById("state")
const country = document.getElementById("country") 
const addressType = document.getElementById("addressType")


//const tandc = document.getElementById("tc")

var isValidName = false;
var isValidEmail = false;
var isValidMobile = false;
var isValidAddress = false;
var isValidSalary = false;
var isValidStreet = false;
var isValidVillage = false;
var isValidCity = false;
var isValidPin = false;
var isValidState = false;
var isValidCountry= false;
var isValidAddressType= false;

// var isTCChecked = false


//uname.addEventListener('keyup', checkUserName)
form.addEventListener('submit', (e) => {

    e.preventDefault()
    validate()
    checkButton()
})



function validate() {
    let nameValue = uname.value.trim()
    let emailValue = email.value.trim()
    let mobileValue = mobile.value.trim()
    let addressValue = address.value.trim()
    let salaryValue = salary.value.trim()
    let streetValue = street.value.trim()
    let villageValue = village.value.trim()
    let cityValue = city.value.trim()
    let pinValue = pin.value.trim()
    let stateValue = state.value.trim()
    let countryValue = country.value.trim()
    let addressTypeValue = addressType.value.trim()
    
    isValidName = false;
    isValidEmail = false;
    isValidMobile = false;
    isValidAddress = false;
    isValidSalary = false;
    isValidStreet = false;
    isValidVillage = false;
    isValidCity = false;
    isValidPin = false;
    isValidState = false;
    isValidCountry = false;
    isValidAddressType= false;
    //isTCChecked = false



    checkUserName()

    //email check
    if (emailValue === '') {
        setError(email, 'Email cannot be empty')
    }
    else if (!emailCheck(emailValue)) {
        setError(email, 'Enter Valid Email Id')
    }
    else {
        setSuccesss(email)
        isValidEmail = true
    }


    //mobile check
    if (mobileValue === '') {
        setError(mobile, 'Mobile Number cannot be empty')
    } 
    else if (!mobileCheck(mobileValue)) {
        setError(mobile, 'Enter Valid Mobile Number (10 dits only)')
    }
    else {
        setSuccesss(mobile)
        isValidMobile = true
    }

    //mobile check
    function mobileCheck(input) {
        let mobileReg = /^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/;
        let validmobile = mobileReg.test(input)
        return validmobile
    }
    
    
    
    
    
    //salary
    if(salaryValue === ''){
    	setError(salary, 'salary cannot be empty')
    }
    else if(salaryValue<2000){
    	setError(salary, 'Salary cannot be less then 2000')
    }
    else{
    	setSuccesss(salary)
        isValidSalary = true
    }
    
    
    


    //Address check

    if (addressValue === '') {
        setError(address, 'Address cannot be empty')
    }
    else {
        setSuccesss(address)
        isValidAddress = true
    }



    if (streetValue === '') {
        setError(street, 'Streer cannot be empty')
    }
    else {
        setSuccesss(street)
        isValidStreet = true
    }


    if (villageValue === '') {
        setError(village, 'Village cannot be empty')
    }
    else {
        setSuccesss(village)
        isValidVillage = true
    }



    if (cityValue === '') {
        setError(city, 'City cannot be empty')
    }
    else {
        setSuccesss(city)
        isValidCity = true
    }


    if (pinValue === '') {
        setError(pin, 'Pin cannot be empty')
    }
    else {
        setSuccesss(pin)
        isValidPin = true
    }


    if (stateValue === '') {
        setError(state, 'State cannot be empty')
    }
    else {
        setSuccesss(state)
        isValidState = true
    }


    if (countryValue === '') {
        setError(country, 'Country cannot be empty')
    }
    else {
        setSuccesss(country)
        isValidCountry = true
    }
    
    
    if (addressTypeValue === '') {
        setError(addressType, ' cannot be empty')
    }
    else {
        setSuccesss(addressType)
        isValidAddressType = true
    }
    
    
    
    
    
   



   
   
    
 

    if (isValidName && isValidEmail && isValidMobile && isValidAddress && isValidSalary && 
    		isValidStreet && isValidVillage && isValidCity && isValidPin && isValidState && isValidCountry && isValidAddressType) {

        form.submit()
    }


    function emailCheck(input) {
        let emailReg = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$/;
        let valid = emailReg.test(input)
        return valid
    }
}

function setError(input, message) {
    let parent = input.parentElement;
    let small = parent.querySelector('small')
    small.innerText = message
    console.log(small.innerText);
    parent.classList.add('error')
    parent.classList.remove('success')   
}
function setSuccesss(input) {
    let parent = input.parentElement;
    parent.classList.add('success')
    parent.classList.remove('error')
}

//User name check
function checkUserName() {
    let nameValue = uname.value.trim()
    if (nameValue === '') {
        setError(uname, 'Name cannot be empty')
    }
    else if (nameValue.length < 3) {
        setError(uname, 'Name should be minimum 3 characters')
    }
    else {
        setSuccesss(uname)
        isValidName = true
    }
}

function checkButton() {  
    if(document.getElementById('addressType').checked) { 
    	
    	
        
    }
    else if(document.getElementById('addressType2').checked) { 
           
    } else { 
    	
    	setError(addressType, 'You have not selected any AddressType')
    	
        document.getElementById("error1").innerHTML 
        = "You have not selected any AddressType"; 
} 
} 
*/