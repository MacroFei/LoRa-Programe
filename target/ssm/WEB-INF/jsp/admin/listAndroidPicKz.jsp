<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../include/admin/adminHeader.jsp" %>
<%@include file="../include/admin/adminNavigator.jsp" %>

<script>
    $(function () {
        $(".addFormSingle").submit(function () {
            if (checkEmpty("filepathSingle", "图片文件")) {
                $("#filepathSingle").value("");
                return true;
            }
            return false;
        });
        $(".addFormDetail").submit(function () {
            if (checkEmpty("filepathDetail", "图片文件"))
                return true;
            return false;
        });
    });

</script>

<title>产品图片管理</title>


<div class="workingArea">


    <table class="addPictureTable" align="center">
        <tr>
            <td class="addPictureTableTD">
                <div>
                    <div class="panel panel-warning addPictureDiv">
                        <div class="panel-heading">新增产品<b class="text-primary"> 单个 </b>图片</div>
                        <div class="panel-body">
                            <form method="post" class="addFormSingle" action="admin_androidPic_add"
                                  enctype="multipart/form-data">
                                <table class="addTable">
                                    <tr>
                                        <td>请选择本地图片 尺寸400X400 为佳</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input id="filepathSingle" type="file" name="image"/>
                                        </td>
                                    </tr>
                                    <tr class="submitTR">
                                        <td align="center">
                                            <%--<input type="text" name="name" id="name" placeholder="请输入图片名称">--%>
                                            <input type="hidden" name="type" value="type_pic"/>
                                            <input type="hidden" name="android_id" value="${android.id}"/>
                                            <button type="submit" class="btn btn-success">提 交</button>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </div>
                    <table class="table table-striped table-bordered table-hover  table-condensed">
                        <thead>
                        <tr class="success">
                            <th>ID</th>
                            <th>图片名称</th>
                            <th>产品单个图片缩略图</th>

                            <th>删除</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${pisPic}" var="pi">
                            <%--<tr>--%>
                            <%--<td>${pi.id}</td>--%>
                            <%--<td>${pi.name}</td>--%>
                            <%--<td>${pi.type}</td>--%>
                            <%--</tr>--%>
                            <tr>
                                <td>${pi.id}</td>
                                <td>${pi.name}</td>

                                <td>
                                    <a title="点击查看原图" href="img/magspacePic/${pi.name}_${pi.id}.jpg"><img
                                            height="50px" src="img/magspacePic/${pi.name}_${pi.id}.jpg"></a>
                                </td>
                                    <%--<td>http:localhost:8080/ssm/img/magspaceSingle/${pi.name}_${pi.id}.jpg</td>--%>
                                <td><a deleteLink="true"
                                       href="admin_androidPic_delete?id=${pi.id}"><span
                                        class=" 	glyphicon glyphicon-trash"></span></a></td>

                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                </div>
            </td>
        </tr>
    </table>


</div>

<%@include file="../include/admin/adminFooter.jsp" %>
