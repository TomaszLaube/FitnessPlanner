<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include page="../app/app-header.jsp"/>

<div class="m-4 p-3 width-medium">
    <div class="dashboard-content border-dashed p-3 m-4 view-height">
        <div class="row border-bottom border-3 p-1 m-1">
            <div class="col noPadding">
                <h3 class="color-header text-uppercase">Your plan list</h3>
            </div>
            <div class="col d-flex justify-content-end mb-2 noPadding">
                <a href="/app/plan/add" class="btn btn-success rounded-0 pt-0 pb-0 pr-4 pl-4">Add plan</a>
            </div>
        </div>

        <c:if test="${not empty userPlans}">
            <div class="schedules-content">
                <table class="table border-bottom">
                    <thead>
                    <tr class="d-flex">
                        <th class="col-1">ID</th>
                        <th class="col-2">NAME</th>
                        <th class="col-5">DESCRIPTION</th>
                        <th class="col-3 center">ACTIONS</th>
                    </tr>
                    </thead>
                    <tbody class="text-color-lighter">
                    <c:forEach var="plan" items="${userPlans}" varStatus="loop">
                        <tr class="d-flex">
                            <td class="col-1">${loop.index+1}</td>
                            <td class="col-2">${plan.name}</td>
                            <td class="col-5">${plan.description}</td>
                            <td class="col-3 d-flex align-items-center justify-content-center flex-wrap">
                                <a href="/app/plan/delete/${plan.id}" class="btn btn-danger rounded-0 text-light m-1">Delete</a>
                                <a href="/app/plan/details/${plan.id}" class="btn btn-info rounded-0 text-light m-1">Details</a>
                                <a href="/app/plan/edit/${plan.id}" class="btn btn-warning rounded-0 text-light m-1">Edit</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
        <c:if test="${empty userPlans}">
            <div class="schedules-content">
                <h2 class="dashboard-content-title">
                    <span>You haven't created any plan</span>
                </h2>
            </div>
        </c:if>

    </div>
</div>


<jsp:include page="../app/app-footer.jsp"/>