function validateForm() {
    let name = document.getElementById("name").value.trim();
    let email = document.getElementById("email").value.trim();
    let password = document.getElementById("password").value;
    let confirm = document.getElementById("confirm").value;

    // Name validation
    if (name === "") {
        alert("Name cannot be empty");
        return false;
    }

    // Email validation
    if (!email.includes("@") || !email.includes(".")) {
        alert("Enter a valid email address");
        return false;
    }

    // Password validation
    if (password.length < 6) {
        alert("Password must be at least 6 characters");
        return false;
    }

    // Confirm password validation (IMPORTANT)
    if (confirm === "") {
        alert("Please re-enter your password");
        return false;
    }

    if (password !== confirm) {
        alert("Passwords do not match");
        return false;
    }

    return true;
}