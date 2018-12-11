<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include page="../app/app-header.jsp"/>


<div class="m-4 p-3 width-medium ">
    <div class="dashboard-content border-dashed p-3 m-4">
        <div class="row border-bottom border-3 p-1 m-1">
            <div class="col noPadding">
                <h3 class="color-header text-uppercase">Plan Details</h3>
            </div>
            <div class="col d-flex justify-content-end mb-2 noPadding">
                <a href="/app/plan/list" class="btn btn-success rounded-0 pt-0 pb-0 pr-4 pl-4">Powrót</a>
            </div>
        </div>

        <div class="schedules-content">
            <div class="schedules-content-header">
                <div class="form-group row">
                                <span class="col-sm-2 label-size col-form-label">
                                    Name
                                </span>
                    <div class="col-sm-10">
                        <p class="schedules-text">${plan.name}</p>
                    </div>
                </div>
                <div class="form-group row">
                                <span class="col-sm-2 label-size col-form-label">
                                    Description
                                </span>
                    <div class="col-sm-10">
                        <p class="schedules-text">
                            ${plan.description}
                        </p>
                    </div>
                </div>
            </div>
            <c:forEach var="day" items="${fullWeek}">
                <c:if test="${not empty day}">
                    <table class="table">
                        <thead>
                        <tr class="d-flex">
                            <th class="col-2">${day[0].day.name}</th>
                            <th class="col-4"></th>
                            <th class="col-1"></th>
                            <th class="col-1"></th>
                            <th class="col-2"></th>
                            <th class="col-1"></th>
                        </tr>
                        </thead>
                        <tbody class="text-color-lighter">
                        <tr class="d-flex">
                            <th class="col-2">Exercise Type</th>
                            <th class="col-4">Name</th>
                            <th class="col-1"></th>
                            <th class="col-1"></th>
                            <th class="col-2"></th>
                            <th class="col-1"></th>
                        </tr>
                        <c:forEach var="planExercise" items="${day}" varStatus="loop">
                            <tr class="d-flex">
                                <td class="col-2">${planExercise.exerciseName}</td>
                                <td class="col-4">${planExercise.exercise.name}</td>
                                <td class="col-1 center d-flex">
                                    <a href="/app/exercise/deleteFromPlan/${planExercise.id}" class="btn btn-danger rounded-0 text-light m-1">Remove</a>
                                </td>
                                <td class="col-1 center d-flex">
                                    <a href="/app/exercise/details/${planExercise.exercise.id}" class="btn btn-info rounded-0 text-light m-1">Details</a>
                                </td>
                                <td class="col-2 center d-flex" >
                                    <c:if test="${planExercise.exerciseOrder > 1}">
                                        <a href="/app/exercise/reorderUp/${planExercise.id}" class="btn btn-primary rounded-0 text-light m-1">Move up</a>
                                    </c:if>
                                    <c:if test="${planExercise.exerciseOrder <= 1}">
                                        <a href="#" class="btn btn-primary rounded-0 text-light m-1 disabled">Move up</a>
                                    </c:if>
                                </td>
                                <td class="col-1 center d-flex">
                                    <c:if test="${!loop.last}">
                                        <a href="/app/exercise/reorderDown/${planExercise.id}" class="btn btn-primary rounded-0 text-light m-1">Move down</a>
                                    </c:if>
                                    <c:if test="${loop.last}">
                                        <a href="#" class="btn btn-primary rounded-0 text-light m-1 disabled">Move down</a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </c:forEach>
        </div>
    </div>
</div>

<jsp:include page="../app/app-footer.jsp"/>