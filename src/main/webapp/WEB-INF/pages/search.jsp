<%--
  Created by IntelliJ IDEA.
  User: SerZh
  Date: 07.09.2018
  Time: 22:31
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="base" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Результаты поиска</title>
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
                    <li class="breadcrumb-item"><a href="${base}/parts">Комплектующие ПК</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Результаты поиска</li>
                </ol>
            </nav>
            <h2>Результаты поиска по запросу: <b>${query}</b></h2>

            <form action="search" method="POST">
                <div class="form-row">
                    <input type="text" name="query" required/>
                    <input class="btn btn-outline-primary" type="submit" value="Найти"/>
                </div>
            </form>

            <c:if test="${!empty listParts}">
                <table style="width: auto;" class="table table-sm table-hover">
                    <thead>
                    <tr>
                        <th scope="col"><b>ID</b></th>
                        <th scope="col"><b>Наименование</b></th>
                        <th scope="col"><b>Необходимость</b></th>
                        <th scope="col"><b>Количество</b></th>
                        <th scope="col"><b>Изменить</b></th>
                        <th scope="col"><b>Удалить</b></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listParts}" var="part">
                        <tr>
                            <th scope="row">${part.id}</th>
                            <td>${part.name}</td>
                            <c:if test="${part.bind}">
                                <td class="text-center">Да</td>
                            </c:if>
                            <c:if test="${!part.bind}">
                                <td class="text-center">Нет</td>
                            </c:if>
                            <td class="text-center">${part.count}</td>
                            <td class="text-center"><a href="${base}/edit/${part.id}" title="Изменить: ${part}"><i class="material-icons">edit</i></a>
                            </td>
                            <td class="text-center"><a href="${base}/remove/${part.id}" title="Удалить: ${part}"><i
                                    class="material-icons">close</i></a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </div>
        <div class="col"></div>
    </div>
</div>
</body>
</html>
