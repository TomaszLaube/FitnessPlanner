<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include page="app-header.jsp"/>


<div class="m-4 p-4 width-medium">
    <div class="dashboard-header m-4">
        <div class="dashboard-menu">
            <div class="menu-item border-dashed">
                <a href="/app/exercise/add">
                    <i class="far fa-plus-square icon-plus-square"></i>
                    <span class="title">Add exercise</span>
                </a>
            </div>
            <div class="menu-item border-dashed">
                <a href="/app/plan/add">
                    <i class="far fa-plus-square icon-plus-square"></i>
                    <span class="title">Add plan</span>
                </a>
            </div>
            <c:if test="${(countPlans > 0) && (countExercises > 0)}">
                <div class="menu-item border-dashed">
                    <a href="/app/exercise/plan/add">
                        <i class="far fa-plus-square icon-plus-square"></i>
                        <span class="title">Add exercise to plan</span>
                    </a>
                </div>
            </c:if>
        </div>

        <div class="dashboard-alerts">
            <div class="alert-item alert-info">
                <i class="fas icon-circle fa-info-circle"></i>
                <span class="font-weight-bold">Added exercises: ${countExercises}</span>
            </div>
            <div class="alert-item alert-light">
                <i class="far icon-calendar fa-calendar-alt"></i>
                <span class="font-weight-bold">Created fit plans: ${countPlans}</span>
            </div>
        </div>
    </div>
    <c:if test="${not empty latestPlan}">
        <div class="m-4 p-4 border-dashed">
            <h2 class="dashboard-content-title">
                <span>Your latest plan: </span>${latestPlan.name}
            </h2>
            <c:forEach var="day" items="${fullWeek}">
                <c:if test="${not empty day}">
                    <table class="table">
                        <thead>
                        <tr class="d-flex">
                            <th class="col-2">${day[0].day.name}</th>
                            <th class="col-3"></th>
                            <th class="col-7"></th>

                        </tr>
                        </thead>
                        <tbody class="text-color-lighter">
                        <tr class="d-flex">
                            <th class="col-2">Exercise Type</th>
                            <th class="col-3">Name</th>
                            <th class="col-7">Description</th>

                        </tr>
                        <c:forEach var="planExercise" items="${day}">
                            <tr class="d-flex">
                                <td class="col-2">${planExercise.exerciseName}</td>
                                <td class="col-3">${planExercise.exercise.name}</td>
                                <td class="col-7 d-flex flex-wrap">${planExercise.exercise.description}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </c:forEach>
        </div>
    </c:if>
    <c:if test="${empty latestPlan}">
        <div class="m-4 p-4 border-dashed">
            <h2 class="dashboard-content-title">
                <span>You haven't created any plan</span>
            </h2>
        </div>
    </c:if>
</div>

<jsp:include page="app-footer.jsp"/>