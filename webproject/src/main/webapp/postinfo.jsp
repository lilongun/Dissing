<!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<% 
	String id = request.getParameter("id");

	String subject = request.getParameter("subject");
	if(id == null || id.trim().equals("") || subject == null || subject.trim().equals("")){
		response.getWriter().write("抱歉，未找到diss信息！");
		return ;
	}
%>
<html>
<head>
<title><%=subject%></title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href='http://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
<script src="js/jquery.min.js"></script>

<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script src="jquery.confirm/jquery.confirm.js"></script>
<link rel="stylesheet" type="text/css" href="jquery.confirm/jquery.confirm.css" />
</head>
<body>
<script type="text/javascript">
	//Ajax调用处理
	$(document).ready(function(){
		$.ajax({
			url: "http://localhost:9099/board/queryPostInfo/<%=id%>",
			type: "get",  
			dataType: "json",
			success: function(ret){
			    $('#qualityCheckDiv').html('<font size="5"><%=subject%></font>' + ret.content);
			},
			error: function(err){
				alert('抱歉, 系统错误!');
			}
		});  
	});//页面加载
	
</script>
<div class="index-banner1">
  <div class="header-top">	
	<div class="wrap">
   		<div class="logo">
			<!--<a href="index.html"><img src="images/logo.png" alt=""/></a>-->
			<font size="6px" color="white">Dissing</font>
		</div>	
		<div class="menu">																
			<a href="#" class="right_bt" id="activator"><img src="images/nav_icon.png" alt=""></a>
				<div class="box" id="box">
				  	<div class="box_content_center1">
					    <div class="menu_box_list1">
							<ul>
								<li><a href="index.html">Home</a></li>
								<li><a href="login.html">Management</a></li>
								<li class="active"><a href="about.html">About</a></li> 
								<!--<li><a href="blog.html">Blog</a></li> -->
								<!--<li><a href="gallery.html">Gallery</a></li>-->
								<!--<li><a href="contact.html">Contact</a></li>-->
								<!--<li><a href="404.html">404</a></li>-->
							</ul>
					     </div>
						 <a class="boxclose" id="boxclose"><img src="images/close.png" alt=""></a>
					 </div>                
			       </div>
			                 <script type="text/javascript">
								var $ = jQuery.noConflict();
									$(function() {
										$('#activator').click(function(){
												$('#box').animate({'top':'0px'},500);
										});
										$('#boxclose').click(function(){
												$('#box').animate({'top':'-700px'},500);
										});
									});
									$(document).ready(function(){
									
									//Hide (Collapse) the toggle containers on load
									$(".toggle_container").hide(); 
									
									//Switch the "Open" and "Close" state per click then slide up/down (depending on open/close state)
									$(".trigger").click(function(){
										$(this).toggleClass("active").next().slideToggle("slow");
										return false; //Prevent the browser jump to the link anchor
									});
									
									});
							</script>
			         </div>

		<div id="loginBox" style="float:right;line-height:55px;">

		</div>
		<div class="clear"></div>
	</div>
		</div>	
	   </div>
   	   <div class="main">
   	     <div class="wrap">
   	       <div class="abstract">
			  <div style="text-align:center" class="section group">
				   <div id="qualityCheckDiv"></div>
			  </div>
		   </div>
		 </div>
	   </div>		   	
	<div class="footer">
	   	<div class="wrap">
	   		<div class="copy">
				<p>Copyright &copy; 2018.dissing.cn All rights reserved.</p>
		    </div>
	   	</div>
    </div>

<script type="text/javascript">
    if( $.cookie("dissing_user_name") == null || $.cookie("access_token") == null ) {
        $('#loginBox').html('<a href="login.html"><font size="5px" color="white">登录</font></a>');
    }else {
        $('#loginBox').html('<a href="mypage.jsp"><font size="5px" color="white">' + $.cookie("dissing_user_name") + '</font></a>' +
            ' <font color="white">[</font><a href="javascript:logout()"><font size="5px" color="white">注销</font></a><font color="white">]</font>');

        access_token = $.cookie('access_token');
    }
</script>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>