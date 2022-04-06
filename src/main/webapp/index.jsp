
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
        <h1>停车场车辆管理系统</h1>
        <form action="/show" method="post">
            <input type="hidden" id="rid" value="${param.region_id}"/>
            <select id="region_id" name="region_id">
            </select>
            <input type="submit" value="查询"/>
            <input type="button" value="添加" onclick="location.href='add.jsp'"/>
        </form>
        <table border="1" width="700px">
                <tr>
                    <td>车牌号</td>
                    <td>型号</td>
                    <td>车库分区</td>
                    <td>停车日期</td>
                    <td>停车状态</td>
                    <td>操作</td>
                </tr>
                <c:forEach items="${list}" var="r">
                    <tr>
                        <td>${r.car_num}</td>
                        <td>${r.brand}</td>
                        <td>${r.name}</td>
                        <td>
                            <fmt:formatDate value="${r.add_time}"  pattern="yyyy-MM-dd HH:mm"/>
                           <%-- <fmt:parseDate value="${r.add_time}" var="releaseTime" pattern="yyyy-MM-dd HH:mm"/>
                            <fmt:formatDate value="${releaseTime}" pattern="yyyy-MM-dd HH:mm"/>--%>
                        </td>
                        <%--<td>${r.add_time}</td>--%>
                        <td>
                            <c:if test="${r.status==0}">停车中</c:if>
                            <c:if test="${r.status==1}">已驶离</c:if>
                        </td>
                        <td>
                            <a href="javascript:void(0)" onclick="update(${r.id},this)">
                                <c:if test="${r.status==0}">驶离</c:if>
                            </a>
                            <c:if test="${r.status==1}">已驶离</c:if>
                        </td>
                    </tr>
                </c:forEach>
        </table>
</body>
</html>
<script src="${pageContext.request.contextPath}/statics/js/jquery-1.12.4.js"></script>
<script>
    //隔行换色
    $("tr:even:not(:first)").css("background","red");
    $.ajax({
        url:"/xiala",//请求的url
        success:function(data) {//data：返回数据（json对象）
            if (data != null) {
                $("#region_id").html("");
                var rid=$("#rid").val();
                var options = "<option value=\"-1\">---请选择---</option>";
                for (var i = 0; i < data.length; i++) {
                    if (data[i].id==rid){
                        options += "<option selected='selected' value=" + data[i].id + ">" + data[i].name + "</option>";
                    } else{
                        options += "<option  value=" + data[i].id + ">" + data[i].name + "</option>";
                    }
                }
                $("#region_id").html(options);
            }
        }
    })
    //修改停车状态
    function update(id,a) {
        if (confirm("请确认该车是否已驶离?")) {
                $.ajax({
                    url:"/update",
                    data:"id="+id,
                    success:function (data) {
                        if (data=="ok"){
                            //修改成功!
                            $(a).parent().prev().html("已驶离");
                            $(a).parent().html("已驶离");
                        }
                    }
                });
        }
    }
</script>