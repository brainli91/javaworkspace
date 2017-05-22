$(document).ready(function() {
	$('#registrationForm').submit(function(event) {

		var email = $('#email').val();
		var password = $('#password').val();
		var passwordAgain = $('#passwordAgain').val();
		var firstName = $('#firstName').val();
		var lastName = $('#lastName').val();
		var errors = '';
		var vRegExp = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/gi;
		 
		var email = $("#email").val().trim();
		
		if($('#email').val().length > 64) {
			errors += '<li>Email cannot be longer than 64 characters</li>';
			event.preventDefault();
		}else if(!vRegExp.test(email)){
			errors += '<li>Email is not in the correct format</li>';
			event.preventDefault();
		}
			
		if($('#password').val().length < 8) {
			errors += '<li>Password cannot be shorter than 8 characters</li>';
			event.preventDefault();
		}
		else if($('#password').val().length > 24) {
			errors += '<li>Password cannot be longer than 24 characters</li>';
			event.preventDefault();
		}
		
		if (!comparePasswords($('#password').val(), $('#passwordAgain').val())) {
			errors += '<li>Passwords do not match</li>';
		}
		
		if($('#firstName').val().length > 24) {
			errors += '<li>First name cannot be longer than 24 characters</li>';
			event.preventDefault();
		}
		
		if($('#lastName').val().length > 24) {
			errors += '<li>First name cannot be longer than 24 characters</li>';
			event.preventDefault();
		}
		if (!($('#firstName').val().match(/^([a-zA-Z\-']{2,24})$/))){
			errors += '<li>First name can contain alphabet \- and \' only</li>';
			event.preventDefault();
		}
		if (!($('#lastName').val().match(/^([a-zA-Z\-']{2,24})$/))){
			errors += '<li>Last name can contain alphabet \- and \' only</li>';
			event.preventDefault();
		}

		if (errors && errors.length > 0) {
			$('#errors').show();
			$('#errors').html(errors);
			event.preventDefault();
		}
		
	});
});

function comparePasswords(password, passwordAgain) {
	return password === passwordAgain
}