<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: SerZh
  Date: 07.09.2018
  Time: 13:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="base" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Редактор | ${part.name}</title>
    <link rel='stylesheet' href="${base}/webjars/bootstrap/4.1.3/css/bootstrap.min.css"/>
    <script type="text/javascript" src="${base}/webjars/jquery/3.3.1-1/jquery.min.js"></script>
    <script type="text/javascript" src="${base}/webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col">

            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="${base}/">Главное меню</a></li>
                    <li class="breadcrumb-item"><a href="${base}/parts">Комплектующие ПК</a></li>
                    <li class="breadcrumb-item active" aria-current="page">${part.name}</li>
                </ol>
            </nav>
            <h2>${part.name}</h2>
            <p><b>Номер: </b>${part.id}</p>
            <p><b>Наименование: </b>${part.name}</p>
            <p><b>Необходимость: </b><c:if test="${part.bind}">Да</c:if><c:if test="${!part.bind}">Нет</c:if></p>
            <p><b>Количество: </b>${part.count}</p>

            <form class="needs-validation" action="${base}/edit" method="POST" novalidate>
                <input type="hidden" name="id" value="${part.id}"/>
                <div class="form-row">
                    <div class="col-md-8 mb-3">
                        <label for="validationCustomName">Наименование</label>
                        <input type="text" name="name" class="form-control" id="validationCustomName" value="${part.name}"
                               required>
                        <div class="invalid-feedback">
                            Введите наименование!
                        </div>
                    </div>
                    <div class="col-md-2 mb-3">
                        <label for="validationCustomBind">Необходимость</label>
                        <select class="custom-select mb-1 mr-sm-2" id="validationCustomBind" name="bind">
                            <option value="0">Нет</option>
                            <c:if test="${part.bind}">
                                <option value="1" selected>Да</option>
                            </c:if>
                            <c:if test="${!part.bind}">
                                <option value="1">Да</option>
                            </c:if>
                        </select>
                    </div>
                    <div class="col-md-2 mb-3">
                        <label for="validationCustomCount">Количество</label>
                        <input type="number" name="count" class="form-control" id="validationCustomCount" value="${part.count}"
                               required>
                        <div class="invalid-feedback">
                            Введите количество!
                        </div>
                    </div>
                    <div class="col-md-12 mb-3">
                        <button type="submit" class="btn btn-outline-primary pull-right">Применить</button>
                    </div>
                </div>
            </form>

        </div>
        <div class="col"></div>
    </div>
</div>
<script type="text/javascript" src="${base}/webjars/angular/1.7.3/angular.min.js"></script>
</head>
</body>
</html>
