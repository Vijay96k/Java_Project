<%@ page import="model.User" %>
<html>
    <head>
        <title>editUser</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <h1>Update Users Detail</h1>
        <%
    User user = (User) request.getAttribute("user");
    if(user == null){
    out.println("<h3 style='color:red;'>No user data found. Please go via Edit button.</h3>");
    return;
}
%>
        <form action="UpdateServlet" method="post">       
 
            <div class="user-details">

                <div class="input-box">
                     <label class="details">User ID</label>
                     <input type="hidden" name="id" value="<%= user.getId() %>">
                </div>

                <div class="input-box">
                    <label class="details" for="name">Full Name</label>
                    <input type="text" name="name" value="<%= user.getName() %>">
                </div>

                <div class="input-box">
                    <label class="details" for="email">Email</label>
                    <input type="text" name="email" value="<%= user.getEmail() %>">
                </div>

                <div class="input-box">
                    <label class="details" for="password">Password</label>
                    <input type="password" name="password" value="<%= user.getPassword() %>">
                </div>

            </div>
            
            <div class="button">
                <input type="submit" value="Update User">
            </div>


        </form>
    </body>
</html>