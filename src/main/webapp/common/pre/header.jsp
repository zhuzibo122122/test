<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript">
  var contextPath = "${ctx}";
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>易买网</title>
<style type="text/css">
      *{
            margin: 0px;
            padding: 0px;
        }
       .mask-layer {
            position: fixed;
            width: 100%;
            height: 100%;
            opacity: 0.5;
            filter: alpha(opacity = 50);
            background-color: black;
            z-index: 99998;
            top: 0px;
            left: 0px;
        }
          

        .center-in-center {
            position: absolute;
            top: 50%;
            left: 50%;
            -webkit-transform: translate(-50%, -50%);
            -moz-transform: translate(-50%, -50%);
            -ms-transform: translate(-50%, -50%);
            -o-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
            text-align: center;
            border: 1px solid orange;
            z-index: 99999;

        }
           .ass{
            height: 50px;
            line-height: 50px;
            background-color: #ff4e00;
        }
        
        
</style>
</head>
<body>
<div class="soubg">
	<div class="sou">
    	<!--Begin 所在收货地区 Begin-->
    	<span class="s_city_b">
        	<span class="fl">送货至：</span>
            <span class="s_city">
            	<span>安徽</span>
                <div class="s_city_bg">
                	<div class="s_city_t"></div>
                    <div class="s_city_c">
                    	<h2>请选择所在的收货地区</h2>
                        <table border="0" class="c_tab" style="width:235px; margin-top:10px;" cellspacing="0" cellpadding="0">
                          <tr>
                            <th>A</th>
                            <td class="c_h"><span>安徽</span><span>澳门</span></td>
                          </tr>
                          <tr>
                            <th>B</th>
                            <td class="c_h"><span>北京</span></td>
                          </tr>
                          <tr>
                            <th>C</th>
                            <td class="c_h"><span>重庆</span></td>
                          </tr>
                          <tr>
                            <th>F</th>
                            <td class="c_h"><span>福建</span></td>
                          </tr>
                          <tr>
                            <th>G</th>
                            <td class="c_h"><span class="c_check">广东</span><span>广西</span><span>贵州</span><span>甘肃</span></td>
                          </tr>
                          <tr>
                            <th>H</th>
                            <td class="c_h"><span>河北</span><span>河南</span><span>黑龙江</span><span>海南</span><span>湖北</span><span>湖南</span></td>
                          </tr>
                          <tr>
                            <th>J</th>
                            <td class="c_h"><span>江苏</span><span>吉林</span><span>江西</span></td>
                          </tr>
                          <tr>
                            <th>L</th>
                            <td class="c_h"><span>辽宁</span></td>
                          </tr>
                          <tr>
                            <th>N</th>
                            <td class="c_h"><span>内蒙古</span><span>宁夏</span></td>
                          </tr>
                          <tr>
                            <th>Q</th>
                            <td class="c_h"><span>青海</span></td>
                          </tr>
                          <tr>
                            <th>S</th>
                            <td class="c_h"><span>上海</span><span>山东</span><span>山西</span><span>四川</span><span>陕西</span></td>
                          </tr>
                          <tr>
                            <th>T</th>
                            <td class="c_h"><span>台湾</span><span>天津</span></td>
                          </tr>
                          <tr>
                            <th>X</th>
                            <td class="c_h"><span>西藏</span><span>香港</span><span>新疆</span></td>
                          </tr>
                          <tr>
                            <th>Y</th>
                            <td class="c_h"><span>云南</span></td>
                          </tr>
                          <tr>
                            <th>Z</th>
                            <td class="c_h"><span>浙江</span></td>
                          </tr>
                        </table>
                    </div>
                </div>
            </span>
        </span>
        <!--End 所在收货地区 End-->
        <span class="fr">
        <!-- 登陆了就不显示该信息了，没登陆显示 -->
        <c:if test="${sessionScope.easybuyUserLogin==null}">
        	<span class="fl">你好，请<a href="${ctx }/pre/Login.jsp">登录</a>&nbsp; <a href="${ctx }/pre/Regist.jsp" style="color:#ff4e00;">免费注册</a>&nbsp;|&nbsp;</span>
        </c:if>
        <!-- 获取登陆用户昵称 -->
        <c:if test="${sessionScope.easybuyUserLogin!=null}">
            <span class="fl"><a href="${ctx }/spring/user/index" style="color: red;font-weight: bolder;">${sessionScope.easybuyUserLogin.userName}</a>&nbsp;|&nbsp;<a href="${ctx }/spring/index?userId=${sessionScope.easybuyUserLogin.id}">我的订单</a>&nbsp;</span>
          </c:if>
          <!-- 管理员登陆显示 -->
          <c:if test="${sessionScope.easybuyUserLogin!=null && sessionScope.easybuyUserLogin.type==1}">
            <span class="fl">|&nbsp;<a href="${ctx }/spring/product/index">后台管理</a>&nbsp;</span>
          </c:if>
          <!-- 登陆成功出现注销功能！没登录没有。。 -->
          <c:if test="${sessionScope.easybuyUserLogin!=null}">
             <span class="fl">|&nbsp;<a href="${ctx }/spring/user/remove">注销</a>&nbsp;</span>
          </c:if>
          <c:if test="${!empty sessionScope.easybuyUserLogin}">
        	<span class="ss">
            	<div class="ss_list">
                	<a href="#">收藏夹</a>
                    <div class="ss_list_bg">
                    	<div class="s_city_t"></div>
                        <div class="ss_list_c">
                        	<ul>
                            	<li><a href="${ctx}/spring/product/queryProductList4?userId=${sessionScope.easybuyUserLogin.id}">收藏的宝贝</a></li>
                            </ul>
                        </div>
                    </div>     
                </div>
                <div class="ss_list">
                	<a href="#">客户服务</a>
                    <div class="ss_list_bg">
                    	<div class="s_city_t"></div>
                        <div class="ss_list_c">
                        	<ul>
                            	<li><a href="#">我的足迹</a></li>
                                <li><a href="#">我的上新</a></li>
                                <li><a href="#">已买到的宝贝</a></li>
                                <li><a href="#">爱逛街</a></li>
                                <li><a href="#">易买网达人</a></li>
                            </ul>
                        </div>
                    </div>    
                </div>
                
                
            </span>
            </c:if>
            <span class="fl"><c:if test="${!empty sessionScope.easybuyUserLogin}">|&nbsp;</c:if>关注我们：</span>
            <span class="s_sh"><a href="javascript:;" class="sh1">新浪</a><a href="javascript:;" class="sh2" onclick="javascript: $('.win6').show();">微信</a></span>
            <span class="fr">|&nbsp;<a href="#">手机版&nbsp;<img src="${ctx}/statics/images/s_tel.png" align="absmiddle" /></a></span>
        </span>
    </div>
</div>
<div class="win6" style="display: none;">
<div class="mask-layer"></div>
<div class="center-in-center" >

<div class="ass">
    <h2>关注我们</h2>

</div>
    <a href="javascript: $('.win6').hide()" style="background-color: white"><img src="${ctx}/statics/images/jiaweixin.png" height="580" width="500"></a>

</div>
</div>


<link rel="stylesheet" type="text/css" href="${ctx}/statics/css/ShopShow.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/statics/css/MagicZoom.css" />
<link type="text/css" rel="stylesheet" href="${ctx}/statics/css/style.css"/>
<script type="text/javascript" src="${ctx}/statics/js/common/jquery-1.11.1.min_044d0927.js"></script>
<script type="text/javascript" src="${ctx}/statics/js/common/jquery.bxslider_e88acd1b.js"></script>
<script type="text/javascript" src="${ctx}/statics/js/common/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="${ctx}/statics/js/common/menu.js"></script>
<script type="text/javascript" src="${ctx}/statics/js/common/select.js"></script>
<script type="text/javascript" src="${ctx}/statics/js/common/lrscroll.js"></script>
<script type="text/javascript" src="${ctx}/statics/js/common/iban.js"></script>
<script type="text/javascript" src="${ctx}/statics/js/common/fban.js"></script>
<script type="text/javascript" src="${ctx}/statics/js/common/f_ban.js"></script>
<script type="text/javascript" src="${ctx}/statics/js/common/mban.js"></script>
<script type="text/javascript" src="${ctx}/statics/js/common/bban.js"></script>
<script type="text/javascript" src="${ctx}/statics/js/common/hban.js"></script>
<script type="text/javascript" src="${ctx}/statics/js/common/tban.js"></script>
<script type="text/javascript" src="${ctx}/statics/js/common/lrscroll_1.js"></script>
<script type="text/javascript" src="${ctx}/statics/js/common/MagicZoom.js"></script>
<script type="text/javascript" src="${ctx}/statics/js/common/num.js"></script>
<%-- <script type="text/javascript" src="${ctx}/statics/js/common/p_tab.js"></script> --%>
<script type="text/javascript" src="${ctx}/statics/js/common/shade.js"></script>
<script src="${ctx}/statics/js/confic/ui.js"></script>
<script src="${ctx}/statics/js/backend/category.js"></script>
<script type="text/javascript" src="${ctx}/statics/js/pager/pager.js"></script>				
<script type="text/javascript" src="${ctx}/statics/js/backend/user.js"></script>
<script src="${ctx}/statics/js/backend/backend.js"></script>
<script type="text/javascript">

</script>
</body>
</html>