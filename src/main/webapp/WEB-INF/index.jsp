<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Burger Tracker</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>
    <div class="container">
        <h1>Burger Tracker</h1>
        <table class="table table-striped">
            <tr>
                <th>Burger Name</th>
                <th>Restaurant Name</th>
                <th>Rating (out of 5)</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="burger" items="${burger}">
                <tr>
                    <td>${burger.burgerName}</td>
                    <td>${burger.restaurantName}</td>
                    <td>${burger.rating}</td>
                    <td class="d-flex">
                        <a class="btn btn-warning" href="/burgers/edit/${burger.id}">edit</a>
                        <form action="/burgers/${burger.id}" method="post">
                            <input type="hidden" name="_method" value="delete">
                            <input class="btn btn-danger" type="submit" value="delete">
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <div class="mt-5" style=" margin:0 auto;">
            <form:form action="/burgers" method="post" modelAttribute="burgers" class="d-flex flex-column w-75" style="margin: 0 auto;">
                <h2>Add a Burger:</h2>
                <div class="form-group">
                    <form:label path="burgerName" for="burgerName">Burger Name </form:label>
                    <form:input type="text" class="form-control" path="burgerName" id="burgerName" name="burgerName"/>
                </div>
                <div class="form-group">
                    <form:label path="restaurantName" for="restaurantName">Restaurant Name </form:label>
                    <form:input path="restaurantName" type="text" class="form-control" id="restaurantName" name="restaurantName"/>
                </div>
                <div class="form-group">
                    <form:label path="rating" for="rating">Rating </form:label>
                    <form:input path="rating" type="number" class="form-control" id="rating" name="rating"/>
                </div>
                <div class="form-group">
                    <form:label path="notes" for="notes">Notes </form:label>
                    <form:textarea path="notes" type="text" class="form-control" id="notes" name="notes"></form:textarea>
                </div>
                <button class="btn btn-primary my-3" style="width: fit-content;">Submit</button>
            </form:form>
        </div>
    </div>
</body>
</html>