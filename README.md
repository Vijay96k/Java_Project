# Mini Project 2 – User Module (CRUD using JSP, Servlets, JDBC)

## 📌 Project Overview

This project demonstrates the implementation of a **User Module** using JSP-based web pages. It covers all four fundamental CRUD operations:

* Create (Register User)
* Read (Display Users)
* Update (Modify User Profile)
* Delete (Remove User)

The system integrates **JSP, Servlets, JDBC, HTML, CSS, and JavaScript** to provide a complete web-based solution.

---

## ⚙️ Technologies Used

* **Frontend:** HTML, CSS, JavaScript
* **Backend:** JSP, Servlets
* **Database:** JDBC (MySQL or any relational DB)
* **Tools:** Apache Tomcat (or any servlet container)

---

## 🚀 Features

### 1. Register User (Create)

* User registration form using JSP/HTML
* Styled using CSS
* Client-side validation using JavaScript:

  * Email format validation
  * Password length validation
* Server-side processing using Servlets and JDBC
* Stores user data in the database

---

### 2. Display All Users (Read)

* Displays all registered users in a table format
* Styled table using CSS
* Data fetched using Servlets and JDBC

---

### 3. Update User Profile (Update)

* Pre-filled form with existing user data
* JavaScript validation for updated inputs
* Updates user data using Servlets and JDBC

---

### 4. Delete User (Delete)

* Option to delete user from the system
* Styled buttons/links using CSS
* Removes user records via Servlets and JDBC

---

## 📋 Additional Requirements

* Each group member handles one functionality:

  * HTML
  * CSS
  * JavaScript
  * JSP
  * Servlet
  * JDBC
* Proper validation:

  * Client-side (JavaScript)
  * Server-side (Servlet/JSP)
* Consistent UI design using CSS
* Modular coding for maintainability

---

## 📁 Project Structure (Suggested)

```
/project-root
│── index.jsp
│── register.jsp
│── displayUsers.jsp
│── updateUser.jsp
│── deleteUser.jsp
│
├── /css
│   └── styles.css
│
├── /js
│   └── validation.js
│
├── /servlet
│   ├── RegisterServlet.java
│   ├── DisplayServlet.java
│   ├── UpdateServlet.java
│   └── DeleteServlet.java
│
├── /dao
│   └── UserDAO.java
│
├── /model
│   └── User.java
│
└── /db
    └── DBConnection.java
```

---

## 🧠 Key Learning Outcomes

* Understanding CRUD operations in web applications
* Integration of frontend and backend technologies
* Database connectivity using JDBC
* Form validation techniques
* Modular and maintainable coding practices

---

## ✅ Conclusion

This project provides a complete hands-on experience in building a **dynamic web application** using JSP and Servlets. It strengthens understanding of full-stack development concepts and prepares for real-world applications.

---
