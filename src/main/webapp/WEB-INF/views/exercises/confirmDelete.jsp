<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include page="../app/app-header.jsp"/>


<div class="m-4 p-3 width-medium">
    <div class="dashboard-content border-dashed p-3 m-4 view-height">
        <div class="row border-bottom border-3 p-1 m-1">
            <div class="col noPadding">
                <h3 class="color-header text-uppercase">Are you sure you want to delete this exercise?</h3>
            </div>
        </div>
        <form method="post" class="center">
            <input type="submit" value="Delete" class="btn btn-warning rounded-0 text-light m-1">
            <input type="hidden" name="${_csrf.parameterName}"
                   value="${_csrf.token}" />
            <a href="/app/exercise/list" class="btn btn-info rounded-0 text-light m-1">Cancel</a>
        </form>
    </div>
</div>

<jsp:include page="../app/app-footer.jsp"/>