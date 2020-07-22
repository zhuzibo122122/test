<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>易买网</title>
</head>
<!--Begin Header Begin-->

<%@ include file="/common/pre/header.jsp"%>
<%@ include file="/common/pre/searchBar.jsp"%>
<!--End Header End-->
<div class="i_bg bg_color">
  <!--Begin 用户中心 Begin -->
  <div class="m_content">
  	<!-- 左侧Begin -->
    <%@ include file="/common/backend/leftBar.jsp"%>
    <div class="m_right" id="content">
      <div class="mem_tit">商品列表</div>
      <br>
      <table border="0" class="order_tab" style="width:930px; text-align:center; margin-bottom:30px;" cellspacing="0" cellpadding="0">
        <tbody>
        <tr>
          <td width="10%">商品名称</td>
          <td width="10%">商品图片</td>
          <td width="5%">库存</td>
          <td width="10%">价格</td>
          <td width="10%" colspan="2">操作</td>
        </tr>
         <c:forEach items="${productList}" var="list">
          <tr>
            <td>${list.name}</td>
            <td>
              <a href="${ctx}/spring/product/queryProductDeatil?id=${list.id}" target="_blank">
                  <img src="${ctx}/files/${list.fileName}" width="50" height="50"/>
              </a>
            </td>
            <td>${list.stock}</td>
            <td>${list.price}</td>
            <td><a href="javascript:;" onclick="updateByProductId('${list.id }','${pager.currentPage}')">修改</a></td>
            <td><a href="javascript:;" id="${list.id }" class="delPro" onclick="_confirm2('${list.id }')" >下架</a></td>
          </tr>
		</c:forEach>
        </tbody>  
      </table>
      <!-- 分页 -->
      <%@ include file="/common/pre/pagerBar.jsp" %> 
    </div>
  </div>
    	<!--Begin Footer Begin -->
		<%@ include file="/common/pre/footer.jsp"%>
		<!--End Footer End -->
</div>
</body>
</html>