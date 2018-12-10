<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="header.jsp"/>

<section class="dashboard-section">
    <div class="container pt-4 pb-4">
        <div class="border-dashed view-height">
            <div class="container w-25">
                <form:form class="padding-small text-center" method="post" modelAttribute="user">
                    <h1 class="text-color-darker">Registration</h1>

                    <div class="form-group">
                        <form:input type="text" class="form-control" id="usernameId" path="username" placeholder="Enter username"/>
                        <form:errors path="username" element="div"/>
                        <c:if test="${usernameExists}">
                            <div class="error">This username already exists!</div>
                        </c:if>
                    </div>

                    <div class="form-group">
                        <form:input type="text" class="form-control" id="emailId" path="email" placeholder="Your email"/>
                        <form:errors path="email" element="div"/>
                        <c:if test="${emailExists}">
                            <div class="error">This email address already exists!</div>
                        </c:if>
                    </div>
                    <div class="form-group">
                        <form:input type="password" class="form-control" id="passwordId" path="password" placeholder="Password"/>
                        <form:errors path="password" element="div"/>

                    </div>
                    <div class="form-group">
                        <form:input type="password" class="form-control" id="passwordCheckId" path="checkPassword" placeholder="Repeat password"/>
                        <form:errors path="checkPassword" element="div"/>
                        <c:if test="${incorrectPassword}">
                            <div class="error">Enter correct password twice!</div>
                        </c:if>
                    </div>
                    <button class="btn btn-color rounded-0" type="submit">Create account</button>
                </form:form>
            </div>
        </div>
    </div>
</section>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>

<jsp:include page="footer.jsp"/>