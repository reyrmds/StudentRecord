 function Validation() {

        var Studname = document.frmOnline.txtStudname;
		var Studno=document.frmOnline.txtStudno;
		

        if (Studname.value == "") {
            alert("Enter the Student Name");
            Studname.focus();
            return false;

        }

        if (Studname.value != "") {
            var ck_name = /^[A-Za-z ]{3,50}$/;
            if (!ck_name.test(Studname.value)) {
                alert("You can not enter Numaric values (or) your name should be 3 - 20 characters...");
                Studname.focus();
                return false;
            }
        }
		
        if (Studno.value == "") {
			var ck_no = /{11}$/;
			if (!ck_name.test(Studname.value)) {
            alert("Please Enter the Student Number");
            Studno.focus();
            return false;
        }
        
    }
   
    $(document).ready(function() {
        $('#tryitForm').bootstrapValidator({
            fields: {
                Studname: {
                    validators: {
                        notEmpty: {
                            message: 'The Student name is required and cannot be empty'
                        }
                    }
                },
                Studno: {
                    validators: {
                        notEmpty: {
                            message: 'The Student number is required and cannot be empty'
                        }
                    }
                },

            },
        });
    });