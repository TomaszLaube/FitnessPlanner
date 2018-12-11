<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include page="../app/app-header.jsp"/>

<div class="m-4 p-3 width-medium">
    <div class="dashboard-content border-dashed p-3 m-4 view-height">
        <form:form method="post" modelAttribute="planExercise">
            <div class="row border-bottom border-3 p-1 m-1">
                <div class="col noPadding">
                    <h3 class="color-header text-uppercase">Add exercise to fitness plan</h3>
                </div>
                <div class="col d-flex justify-content-end mb-2 noPadding">
                    <button class="btn btn-success rounded-0 pt-0 pb-0 pr-4 pl-4" type="submit">Add
                    </button>
                </div>
            </div>

            <div class="schedules-content">
                <div class="form-group row">
                    <label for="choosePlan" class="col-sm-2 label-size col-form-label">
                        Choose your plan
                    </label>
                    <div class="col-sm-3">
                        <form:select class="form-control" path="plan" items="${userPlans}" itemLabel="name"
                                     itemValue="id" id="choosePlan"/>
                        <form:errors path="plan" element="div" cssClass="error"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="nameId" class="col-sm-2 label-size col-form-label">
                        Exercise Type
                    </label>
                    <div class="col-sm-10">
                        <form:input type="text" class="form-control" path="exerciseName" id="nameId"
                                    placeholder="Type of exercise"/>
                        <form:errors path="exerciseName" element="div" cssClass="error"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="dayId" class="col-sm-2 label-size col-form-label">
                        Choose a day
                    </label>
                    <div class="col-sm-2">
                        <form:select class="form-control" path="day" items="${days}" itemLabel="name"
                                     itemValue="id" id="dayId"/>
                        <form:errors path="day" element="div" cssClass="error"/>
                        <c:if test="${dayLimit}">
                            <div class="error">You can't add more than 10 exercises to a single day</div>
                        </c:if>
                    </div>
                </div>
                <form:input type="hidden" value="1" path="exerciseOrder"/>
                <form:errors path="exerciseOrder"/>
                <div class="form-group row">
                    <label for="exerciseId" class="col-sm-2 label-size col-form-label">
                        Add your exercise
                    </label>
                    <div class="col-sm-4">
                        <form:select class="form-control" path="exercise" items="${userExercises}"
                                     itemLabel="name" itemValue="id" id="exerciseId"/>
                        <form:errors path="exercise" element="div" cssClass="error"/>
                    </div>
                </div>
            </div>
        </form:form>
    </div>
</div>


<jsp:include page="../app/app-footer.jsp"/>