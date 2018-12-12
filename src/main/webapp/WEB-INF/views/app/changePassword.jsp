<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include page="app-header.jsp"/>


<section class="dashboard-section">
    <div class="container pt-4 pb-4">
        <div class="border-dashed view-height width-medium">
            <div class="container w-500">
                <form class="padding-small text-center" method="post">
                    <h1 class="text-color-darker">Change account password</h1>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="Current Password" name="oldPassword" required/>
                        <c:if test="${incorrectOldPassword}">
                            <div class="error">Enter correct password!</div>
                        </c:if>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="New password" name="newPassword" required/>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="Repeat new password" name="newPasswordCheck" required/>
                        <c:if test="${incorrectNewPassword}">
                            <div class="error">Enter new password twice!</div>
                        </c:if>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}"
                           value="${_csrf.token}" />
                    <button class="btn btn-color rounded-0" type="submit">Change password</button>
                </form>
            </div>
        </div>
    </div>
</section>

<jsp:include page="app-footer.jsp"/>