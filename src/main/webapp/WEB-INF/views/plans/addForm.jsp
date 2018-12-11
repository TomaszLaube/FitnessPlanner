<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include page="../app/app-header.jsp"/>

<div class="m-4 p-3 width-medium text-color-darker">
    <div class="dashboard-content border-dashed p-3 m-4 view-height">
        <div class="mt-4 ml-4 mr-4">
            <form:form method="post" class="padding-small text-center" modelAttribute="plan">
                <div class="row border-bottom border-3">
                    <div class="col"><h3 class="color-header text-uppercase">Create Plan</h3></div>
                    <div class="col d-flex justify-content-end mb-2">
                        <button type="submit" class="btn btn-color rounded-0 pt-0 pb-0 pr-4 pl-4">Save
                        </button>
                    </div>
                </div>
                <table class="table borderless">
                    <tbody>
                    <tr class="d-flex">
                        <th scope="row" class="col-2">Plan name</th>
                        <td class="col-7">
                            <form:input type="text" class="w-100 p-1" path="name"/>
                            <form:errors path="name" element="div" cssClass="error"/>
                        </td>
                    </tr>
                    <tr class="d-flex">
                        <th scope="row" class="col-2">Plan description</th>
                        <td class="col-7">
                            <form:textarea path="description" class="w-100 p-1" rows="5"/>
                            <form:errors path="description" element="div" cssClass="error"/>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form:form>
        </div>
    </div>
</div>

<jsp:include page="../app/app-footer.jsp"/>