<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include page="../app/app-header.jsp"/>


<div class="m-4 p-3 width-medium">
    <div class="dashboard-content border-dashed p-3 m-4 view-height">
        <div class="row border-bottom border-3 p-1 m-1">
            <div class="col noPadding">
                <h3 class="color-header text-uppercase">Registered users</h3>
            </div>
            <div class="col d-flex justify-content-end mb-2 noPadding">
                <a href="/app/dashboard" class="btn btn-success rounded-0 pt-0 pb-0 pr-4 pl-4">Dashboard</a>
            </div>
        </div>


            <div class="schedules-content">
                <table class="table border-bottom">
                    <thead>
                    <tr class="d-flex">
                        <th class="col-1">ID</th>
                        <th class="col-2">USERNAME</th>
                        <th class="col-5">EMAIL</th>
                        <th class="col-3 center">ACTIONS</th>
                    </tr>
                    </thead>
                    <tbody class="text-color-lighter">
                    <c:forEach var="user" items="${users}" varStatus="loop">
                        <tr class="d-flex">
                            <td class="col-1">${loop.index+1}</td>
                            <td class="col-2">${user.username}</td>
                            <td class="col-5">${user.email}</td>
                            <td class="col-3 d-flex align-items-center justify-content-center flex-wrap">
                                <c:if test="${user.enabled}">
                                    <a href="/admin/disable/${user.id}" class="btn btn-danger rounded-0 text-light m-1">Disable</a>
                                </c:if>
                                <c:if test="${not user.enabled}">
                                    <a href="/admin/enable/${user.id}" class="btn btn-success rounded-0 text-light m-1">Enable</a>
                                </c:if>
                                </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>



    </div>
</div>


<jsp:include page="../app/app-footer.jsp"/>