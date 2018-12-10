<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include page="../app/app-header.jsp"/>

<div class="m-4 p-3 width-medium">
    <div class="dashboard-content border-dashed p-3 m-4 view-height">
        <div class="row border-bottom border-3 p-1 m-1">
            <div class="col noPadding"><h3 class="color-header text-uppercase">Lista Przepisów</h3></div>
            <div class="col noPadding d-flex justify-content-end mb-2"><a href="/app/exercise/add"
                                                                          class="btn btn-success rounded-0 pt-0 pb-0 pr-4 pl-4">Add
                Exercise</a></div>
        </div>
        <c:if test="${not empty userExercises}">
            <table class="table border-bottom schedules-content">
                <thead>
                <tr class="d-flex text-color-darker">
                    <th scope="col" class="col-1">ID</th>
                    <th scope="col" class="col-2">NAME</th>
                    <th scope="col" class="col-7">DESCRIPTION</th>
                    <th scope="col" class="col-2 center">ACTIONS</th>
                </tr>
                </thead>
                <tbody class="text-color-lighter">
                <c:forEach var="exercise" items="${userExercises}">
                    <tr class="d-flex">
                        <td class="col-1">${exercise.id}</td>
                        <td class="col-2">${exercise.name}</td>
                        <td class="col-7">${exercise.description}</td>
                        <td class="col-2 d-flex align-items-center justify-content-center flex-wrap">
                            <a href="/app/exercise/delete/${exercise.id}"
                               class="btn btn-danger rounded-0 text-light m-1">Delete</a>
                            <a href="/app/exercise/details/${exercise.id}"
                               class="btn btn-info rounded-0 text-light m-1">Details</a>
                            <a href="/app/exercise/edit/${exercise.id}"
                               class="btn btn-warning rounded-0 text-light m-1">Edit</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${empty userExercises}">
            <div class="m-4 p-4 border-dashed">
                <h2 class="dashboard-content-title">
                    <span>You haven't added any exercise</span>
                </h2>
            </div>
        </c:if>
    </div>
</div>


<jsp:include page="../app/app-footer.jsp"/>