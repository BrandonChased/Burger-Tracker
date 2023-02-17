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
        <div class="mt-5" style="margin: auto;">
            <form:form action="/edit/${burger.id}" method="post" modelAttribute="burger" style="margin: 0 auto;" class="w-50">
                <input type="hidden" name="_method" value="put"/>
                <div class="d-flex align-items-center justify-content-between">
                    <h2>Edit a Burger:</h2>
                    <a href="/">Go Back</a>
                </div>
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
                <button class="btn btn-primary mt-3" style="width: fit-content;">Submit</button>
            </form:form>
        </div>
    </div>
</body>
</html>