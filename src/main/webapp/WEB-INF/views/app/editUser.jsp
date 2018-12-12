<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include page="app-header.jsp"/>


<section class="dashboard-section">
    <div class="container pt-4 pb-4">
        <div class="border-dashed view-height width-medium">
            <div class="container w-500">
                <form:form class="padding-small text-center" method="post" modelAttribute="user">
                    <h1 class="text-color-darker">User data update</h1>
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
                    <form:hidden path="id" value="${user.id}"/>
                    <form:hidden path="enabled" value="${user.enabled}"/>
                    <form:hidden path="password" value="${user.password}"/>
                    <button class="btn btn-color rounded-0" type="submit">Update account</button>
                </form:form>
            </div>
        </div>
    </div>
</section>

<jsp:include page="app-footer.jsp"/>