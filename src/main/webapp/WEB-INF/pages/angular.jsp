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
    <title>Angular</title>
    <link type="text/css" rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
</head>
<body>


<div class="container" ng-app="myApp" ng-controller="sampleCtrl">
    <h1 class="display-4">Angular JS + bw.paging</h1>
    <!--[if lt IE 10]>
    <div class="alert alert-warning">
        <strong>
            It is highly recommended you update Internet Explorer or try using a modern browser!
        </strong>
    </div>
    <![endif]-->


    <div class="collapse">
        <div class="well">


            <div class="form-group">
                <label>Current Page:</label>
                <input
                        placeholder="page"
                        class="form-control"
                        maxlength="16"
                        ng-model="currentPage"
                        ng-change="change()"
                        ng-init="currentPage = 1"/>
            </div>
            <div class="form-group">
                <label>Page Size:</label>
                <input
                        placeholder="Page Size"
                        class="form-control"
                        maxlength="16"
                        ng-model="pageSize"
                        ng-init="pageSize = 10"/>
            </div>
            <div class="form-group">
                <label>Total Items:</label>
                <input
                        placeholder="Total"
                        class="form-control"
                        maxlength="16"
                        ng-model="total"
                        ng-init="total = 1"/>
            </div>
        </div>
    </div>

    <hr/>

    <table class="table table-hover">
        <thead>
        <tr>
            <th>id</th>
            <th>name</th>
            <th>bind</th>
            <th>count</th>
        </tr>
        </thead>
        <tbody>
        <tr ng-repeat="item in parts">
            <td>{{item.id}}</td>
            <td>{{item.name}}</td>
            <td>{{item.bind}}</td>
            <td>{{item.count}}</td>
        </tr>
        </tbody>

    </table>

    <div class="well" ng-click="change()">
        <div paging
             page="currentPage"
             page-size="pageSize"
             total="total">
        </div>
    </div>

</div>
</div>
<script type="text/javascript" src="${base}/webjars/angular/1.7.3/angular.min.js"></script>
<script type="text/javascript" src="${base}/webjars/angular-cookies/1.7.3/angular-cookies.min.js"></script>
<script type="text/javascript" src="${base}js/app.js"></script>
<script type="text/javascript" src="${base}js/paging.js"></script>
</body>
</html>
