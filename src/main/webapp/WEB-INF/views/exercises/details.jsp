<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include page="../app/app-header.jsp"/>

<div class="m-4 p-3 width-medium text-color-darker">
    <div class="dashboard-content border-dashed p-3 m-4 view-height">
        <div class="mt-4 ml-4 mr-4">
            <div class="row border-bottom border-3">
                <div class="col"><h3 class="color-header text-uppercase">Exercise Details</h3></div>
                <div class="col d-flex justify-content-end mb-2"><a href="/app/exercise/list" class="btn btn-color rounded-0 pt-0 pb-0 pr-4 pl-4">Exercise List</a></div>
            </div>

            <table class="table borderless">
                <tbody>
                <tr class="d-flex">
                    <th scope="row" class="col-2">Name</th>
                    <td class="col-7">
                        ${exercise.name}
                    </td>
                </tr>
                <tr class="d-flex">
                    <th scope="row" class="col-2">Description</th>
                    <td class="col-7">${exercise.description}</td>
                </tr>
                <tr class="d-flex">
                    <th scope="row" class="col-2">Duration (minutes)</th>
                    <td class="col-7">
                        ${exercise.exerciseDuration}
                    </td>
                </tr>
                </tbody>
            </table>

            <div class="row d-flex">
                <div class="col-5 border-bottom border-3"><h3 class="text-uppercase">Detailed Description</h3></div>
                <div class="col-2"></div>
                <div class="col-5 border-bottom border-3"><h3 class="text-uppercase">Required Gear</h3></div>
            </div>
            <div class="row d-flex">
                <div class="col-5 p-4"><p>${exercise.workoutDesc}</p></div>
                <div class="col-2"></div>
                <div class="col-5 p-4"><p>${exercise.gear}</p></div>
            </div>
        </div>
    </div>
</div>


<jsp:include page="../app/app-footer.jsp"/>