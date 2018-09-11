<%--
  Created by IntelliJ IDEA.
  User: SerZh
  Date: 05.09.2018
  Time: 16:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="base" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Комплектующие ПК</title>
    <link rel='stylesheet' href="${base}/webjars/bootstrap/4.1.3/css/bootstrap.min.css"/>
    <script type="text/javascript" src="${base}/webjars/jquery/3.3.1-1/jquery.min.js"></script>
    <script type="text/javascript" src="${base}/webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet">
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="col">

            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="${base}/">Главное меню</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Комплектующие ПК</li>
                </ol>
            </nav>

            <h2>Комплектующие для ПК</h2>

            <form action="search" method="POST">
                <div class="form-row">
                    <input type="text" name="query" required/>
                    <input class="btn btn-outline-primary" type="submit" value="Найти"/>
                </div>
            </form>

            <c:if test="${!empty listParts}">
                <p><a href="${base}/parts">все</a> | <a href="${base}/parts?page=0&bind=true">необходимые</a> | <a
                        href="${base}/parts?page=0&bind=false">опциональные</a></p>
                <table style="width: auto;" class="table table-sm table-hover">
                    <thead>
                    <tr>
                        <th scope="col"><b>#</b></th>
                        <th scope="col"><b>Наименование</b></th>
                        <th scope="col"><b>Необходимость</b></th>
                        <th scope="col"><b>Количество</b></th>
                        <th scope="col"><b>Изменить</b></th>
                        <th scope="col"><b>Удалить</b></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listParts}" var="part" varStatus="loopCount">
                        <tr>
                            <c:if test="${pageNumber == 0}">
                                <th scope="row">${loopCount.count}</th>
                            </c:if>
                            <c:if test="${pageNumber > 0}">
                                <th scope="row">${pageNumber*perPage + loopCount.count}</th>
                            </c:if>
                            <td>${part.name}</td>
                            <c:if test="${part.bind}">
                                <td class="text-center">Да</td>
                            </c:if>
                            <c:if test="${!part.bind}">
                                <td class="text-center">Нет</td>
                            </c:if>
                            <td class="text-center">${part.count}</td>
                            <td class="text-center"><a href="${base}/edit/${part.id}" title="Изменить: ${part}"><i
                                    class="material-icons">edit</i></a>
                            </td>
                            <td class="text-center"><a href="${base}/remove/${part.id}" title="Удалить: ${part}"><i
                                    class="material-icons">close</i></a></td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="6" class="text-center">
                            <c:if test="${!empty pagin}">

                                <c:forEach items="${pagin}" var="page" varStatus="loopCount">
                                    <c:if test="${!empty page}">
                                        <a href="${base}/parts${page}"
                                           class="btn btn-outline-primary btn-sm"> ${loopCount.count} </a>
                                    </c:if>
                                    <c:if test="${empty page}">
                                        <button class="btn btn-primary btn-sm"> ${loopCount.count} </button>
                                    </c:if>
                                </c:forEach>

                            </c:if>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </c:if>

            <form class="needs-validation" action="parts/add" method="POST">
                <input type="hidden" name="id" value="0"/>
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="validationCustomName">Наименование</label>
                        <input type="text" name="name" class="form-control" id="validationCustomName"
                               value=""
                               required>
                    </div>

                    <div class="col-md-2 mb-3">
                        <label for="validationCustomCount">Количество</label>
                        <input type="number" name="count" class="form-control" id="validationCustomCount"
                               value=""
                               required>
                    </div>
                    <div class="col-md-12 mb-3">
                        <button type="submit" class="btn btn-outline-primary pull-right">Добавить</button>
                    </div>
                </div>
            </form>

            <div class="alert alert-secondary" role="alert">Можно собрать компьютеров: <b>${countBind}</b></div>
        </div>
        <div class="col"></div>
    </div>
</div>
</body>
</html>
