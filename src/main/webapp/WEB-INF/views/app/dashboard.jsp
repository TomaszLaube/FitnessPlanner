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
                    <span class="title">dodaj plan</span>
                </a>
            </div>
            <div class="menu-item border-dashed">
                <a href="/app/recipe/plan/add">
                    <i class="far fa-plus-square icon-plus-square"></i>
                    <span class="title">dodaj przepis do planu</span>
                </a>
            </div>
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
            <table class="table">
                <thead>
                <tr class="d-flex">
                    <th class="col-2">Poniedziałek</th>
                    <th class="col-8"></th>
                    <th class="col-2"></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="planrecipe" items="${monday}">
                    <tr class="d-flex">
                        <td class="col-2">${planrecipe.mealName}</td>
                        <td class="col-8">${planrecipe.recipe.name}</td>
                        <td class="col-2"><a href="/app/recipe/details/${planrecipe.recipe.id}">
                            <button type="button" class="btn btn-primary rounded-0">Szczegóły</button>
                        </a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <table class="table">
                <thead>
                <tr class="d-flex">
                    <th class="col-2">Wtorek</th>
                    <th class="col-8"></th>
                    <th class="col-2"></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="planrecipe" items="${tuesday}">
                    <tr class="d-flex">
                        <td class="col-2">${planrecipe.mealName}</td>
                        <td class="col-8">${planrecipe.recipe.name}</td>
                        <td class="col-2"><a href="/app/recipe/details/${planrecipe.recipe.id}">
                            <button type="button" class="btn btn-primary rounded-0">Szczegóły</button>
                        </a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <table class="table">
                <thead>
                <tr class="d-flex">
                    <th class="col-2">Środa</th>
                    <th class="col-8"></th>
                    <th class="col-2"></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="planrecipe" items="${wednesday}">
                    <tr class="d-flex">
                        <td class="col-2">${planrecipe.mealName}</td>
                        <td class="col-8">${planrecipe.recipe.name}</td>
                        <td class="col-2"><a href="/app/recipe/details/${planrecipe.recipe.id}">
                            <button type="button" class="btn btn-primary rounded-0">Szczegóły</button>
                        </a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <table class="table">
                <thead>
                <tr class="d-flex">
                    <th class="col-2">Czwartek</th>
                    <th class="col-8"></th>
                    <th class="col-2"></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="planrecipe" items="${thursday}">
                    <tr class="d-flex">
                        <td class="col-2">${planrecipe.mealName}</td>
                        <td class="col-8">${planrecipe.recipe.name}</td>
                        <td class="col-2"><a href="/app/recipe/details/${planrecipe.recipe.id}">
                            <button type="button" class="btn btn-primary rounded-0">Szczegóły</button>
                        </a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <table class="table">
                <thead>
                <tr class="d-flex">
                    <th class="col-2">Piątek</th>
                    <th class="col-8"></th>
                    <th class="col-2"></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="planrecipe" items="${friday}">
                    <tr class="d-flex">
                        <td class="col-2">${planrecipe.mealName}</td>
                        <td class="col-8">${planrecipe.recipe.name}</td>
                        <td class="col-2"><a href="/app/recipe/details/${planrecipe.recipe.id}">
                            <button type="button" class="btn btn-primary rounded-0">Szczegóły</button>
                        </a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
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