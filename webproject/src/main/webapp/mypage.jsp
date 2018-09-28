<!DOCTYPE HTML>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
	String pageNum = request.getParameter("pageNum");
	if( pageNum == null ){
		pageNum = "1";
	}
%>
<html>
<head>
<title>个人中心</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href='http://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
<script src="js/jquery.min.js"></script>
<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
		<link href="css/magnific-popup.css" rel="stylesheet" type="text/css">
		<script>
			$(document).ready(function() {
				$('.popup-with-zoom-anim').magnificPopup({
					type: 'inline',
					fixedContentPos: false,
					fixedBgPos: true,
					overflowY: 'auto',
					closeBtnInside: true,
					preloader: false,
					midClick: true,
					removalDelay: 300,
					mainClass: 'my-mfp-zoom-in'
			});
		});
		</script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script src="jquery.confirm/jquery.confirm.js"></script>
<link rel="stylesheet" type="text/css" href="jquery.confirm/jquery.confirm.css" />
</head>
<body>
<div class="index-banner1">
  <div class="header-top">	
	<div class="wrap">
		<div class="logo">
			<a href="index.html">
				<!--<img src="images/logo.png" alt=""/>-->
				<font size="6px" color="white">Dissing</font>
			</a>
		</div>
		<div class="menu">																
			<a href="#" class="right_bt" id="activator"><img src="images/nav_icon.png" alt=""></a>
				<div class="box" id="box">
				  	<div class="box_content_center1">
					    <div class="menu_box_list1">
							<ul>
								<li><a href="index.html">主页</a></li>
								<li id="diss" style="display:none"><a href="posteditor.jsp">发Diss</a></li>
								<li class="active"><a href="about.html">About</a></li> 
								<li><a href="blog.html">Blog</a></li> 
								<li><a href="gallery.html">Gallery</a></li>
								<li><a href="contact.html">Contact</a></li>
								<li><a href="404.html">404</a></li>
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
		   	 <!--<ul class="breadcrumb breadcrumb__t"><a class="home" href="#">Gallery</a>  / About</ul>-->
			  <!--<ul class="breadcrumb breadcrumb__t">我的Diss列表</ul>-->
			  <div class="section group">
				 <div id="listDiv" class="cont1 span_2_of_g1">

					 <label class="checkbox" style="font-size:17px;color:#999;">我的Diss列表</label>

				      <div class="section group">
						 <div class="col_1_of_about-box span_1_of_about-box" style="width:65%">
						   <div class="g_desc">
			                   <div class="g_1">
			                   	<h4 class="no"><a href="#">#125846q`111111111111111111111112222222222222222222222222222222222222222221111</a></h4>
			                   </div>
			                   <div class="clear"></div>
			               </div>		
					     </div>

						  <div class="col_1_of_about-box span_1_of_about-box" style="width:30%">
							  <div class="g_desc">
								  <div class="g_1">
									  <h4 class="no"><a href="#">16:16</a></h4>
								  </div>
								  <div class="clear"></div>
							  </div>
						  </div>

						  <div class="clear"></div>
					  </div>
					<%--<div class="section group">
						<div class="col_1_of_about-box span_1_of_about-box">
						   <a class="popup-with-zoom-anim" href="#small-dialog4"><span class="rollover"> </span><img src="images/g4.jpg" title="continue" alt=""/></a>
		                     <div id="small-dialog4" class="mfp-hide">
							   <div class="pop_up">
							   	  <img src="images/g4.jpg" alt=""/>
							   	  <div class="mfp-title">Lorem ipsum est</div>
								</div>
							 </div>  
						   <div class="g_desc">
			                   <div class="g_1">
			                   	<h4 class="no"><a href="#">#125846</a></h4>
			                   	<p class="g_2"><a href="#">Nature</a></p>
			                   </div>
			                   <span class="likes"><a href="#"><img src="images/heart.png" title="likes" alt=""> 16</a></span>
			                   <div class="clear"></div>
			               </div>		
					     </div>
						 <div class="col_1_of_about-box span_1_of_about-box">
						    <a class="popup-with-zoom-anim" href="#small-dialog5"><span class="rollover"> </span><img src="images/g5.jpg" title="continue" alt=""/></a>
		                     <div id="small-dialog5" class="mfp-hide">
							   <div class="pop_up">
							   	  <img src="images/g5.jpg" alt=""/>
							   	  <div class="mfp-title">Lorem ipsum est</div>
								</div>
							 </div>  
						   <div class="g_desc">
			                   <div class="g_1">
			                   	<h4 class="no"><a href="#">#125846</a></h4>
			                   	<p class="g_2"><a href="#">Nature</a></p>
			                   </div>
			                   <span class="likes"><a href="#"><img src="images/heart.png" title="likes" alt=""> 16</a></span>
			                   <div class="clear"></div>
			               </div>		
					     </div>
						 <div class="col_1_of_about-box span_1_of_about-box">
						   <a class="popup-with-zoom-anim" href="#small-dialog6"><span class="rollover"> </span><img src="images/g6.jpg" title="continue" alt=""/></a>
		                     <div id="small-dialog6" class="mfp-hide">
							   <div class="pop_up">
							   	  <img src="images/g6.jpg" alt=""/>
							   	  <div class="mfp-title">Lorem ipsum est</div>
								</div>
							 </div>  
						   <div class="g_desc">
			                   <div class="g_1">
			                   	<h4 class="no"><a href="#">#125846</a></h4>
			                   	<p class="g_2"><a href="#">Nature</a></p>
			                   </div>
			                   <span class="likes"><a href="#"><img src="images/heart.png" title="likes" alt=""> 16</a></span>
			                   <div class="clear"></div>
			               </div>		
					     </div>
				        <div class="clear"></div> 
					</div>
					<div class="section group">
						<div class="col_1_of_about-box span_1_of_about-box">
						   <a class="popup-with-zoom-anim" href="#small-dialog7"><span class="rollover"> </span><img src="images/g7.jpg" title="continue" alt=""/></a>
		                     <div id="small-dialog7" class="mfp-hide">
							   <div class="pop_up">
							   	  <img src="images/g7.jpg" alt=""/>
							   	  <div class="mfp-title">Lorem ipsum est</div>
								</div>
							 </div>  
						   <div class="g_desc">
			                   <div class="g_1">
			                   	<h4 class="no"><a href="#">#125846</a></h4>
			                   	<p class="g_2"><a href="#">Nature</a></p>
			                   </div>
			                   <span class="likes"><a href="#"><img src="images/heart.png" title="likes" alt=""> 16</a></span>
			                   <div class="clear"></div>
			               </div>		
					     </div>
						 <div class="col_1_of_about-box span_1_of_about-box">
						   <a class="popup-with-zoom-anim" href="#small-dialog8"><span class="rollover"> </span><img src="images/g8.jpg" title="continue" alt=""/></a>
		                     <div id="small-dialog8" class="mfp-hide">
							   <div class="pop_up">
							   	  <img src="images/g8.jpg" alt=""/>
							   	  <div class="mfp-title">Lorem ipsum est</div>
								</div>
							 </div>  
						   <div class="g_desc">
			                   <div class="g_1">
			                   	<h4 class="no"><a href="#">#125846</a></h4>
			                   	<p class="g_2"><a href="#">Nature</a></p>
			                   </div>
			                   <span class="likes"><a href="#"><img src="images/heart.png" title="likes" alt=""> 16</a></span>
			                   <div class="clear"></div>
			               </div>		
					     </div>
						 <div class="col_1_of_about-box span_1_of_about-box">
						   <a class="popup-with-zoom-anim" href="#small-dialog9"><span class="rollover"> </span><img src="images/g9.jpg" title="continue" alt=""/></a>
		                     <div id="small-dialog9" class="mfp-hide">
							   <div class="pop_up">
							   	  <img src="images/g9.jpg" alt=""/>
							   	  <div class="mfp-title">Lorem ipsum est</div>
								</div>
							 </div>  
						   <div class="g_desc">
			                   <div class="g_1">
			                   	<h4 class="no"><a href="#">#125846</a></h4>
			                   	<p class="g_2"><a href="#">Nature</a></p>
			                   </div>
			                   <span class="likes"><a href="#"><img src="images/heart.png" title="likes" alt=""> 16</a></span>
			                   <div class="clear"></div>
			               </div>		
					     </div>
				        <div class="clear"></div> 
					</div>
					<div class="section group">
						<div class="col_1_of_about-box span_1_of_about-box">
						   <a class="popup-with-zoom-anim" href="#small-dialog10"><span class="rollover"> </span><img src="images/g10.jpg" title="continue" alt=""/></a>
		                     <div id="small-dialog10" class="mfp-hide">
							   <div class="pop_up">
							   	  <img src="images/g10.jpg" alt=""/>
							   	  <div class="mfp-title">Lorem ipsum est</div>
								</div>
							 </div>  
						   <div class="g_desc">
			                   <div class="g_1">
			                   	<h4 class="no"><a href="#">#125846</a></h4>
			                   	<p class="g_2"><a href="#">Nature</a></p>
			                   </div>
			                   <span class="likes"><a href="#"><img src="images/heart.png" title="likes" alt=""> 16</a></span>
			                   <div class="clear"></div>
			               </div>		
					     </div>
						 <div class="col_1_of_about-box span_1_of_about-box">
						    <a class="popup-with-zoom-anim" href="#small-dialog11"><span class="rollover"> </span><img src="images/g11.jpg" title="continue" alt=""/></a>
		                     <div id="small-dialog11" class="mfp-hide">
							   <div class="pop_up">
							   	  <img src="images/g11.jpg" alt=""/>
							   	  <div class="mfp-title">Lorem ipsum est</div>
								</div>
							 </div>  
						   <div class="g_desc">
			                   <div class="g_1">
			                   	<h4 class="no"><a href="#">#125846</a></h4>
			                   	<p class="g_2"><a href="#">Nature</a></p>
			                   </div>
			                   <span class="likes"><a href="#"><img src="images/heart.png" title="likes" alt=""> 16</a></span>
			                   <div class="clear"></div>
			               </div>		
					     </div>
						 <div class="col_1_of_about-box span_1_of_about-box">
						   <a class="popup-with-zoom-anim" href="#small-dialog12"><span class="rollover"> </span><img src="images/g12.jpg" title="continue" alt=""/></a>
		                     <div id="small-dialog12" class="mfp-hide">
							   <div class="pop_up">
							   	  <img src="images/g12.jpg" alt=""/>
							   	  <div class="mfp-title">Lorem ipsum est</div>
								</div>
							 </div>  
						   <div class="g_desc">
			                   <div class="g_1">
			                   	<h4 class="no"><a href="#">#125846</a></h4>
			                   	<p class="g_2"><a href="#">Nature</a></p>
			                   </div>
			                   <span class="likes"><a href="#"><img src="images/heart.png" title="likes" alt=""> 16</a></span>
			                   <div class="clear"></div>
			               </div>		
					     </div>
				        <div class="clear"></div> 
					</div>--%>
				    <ul id="pageUl" class="dc_pagination dc_paginationA dc_paginationA06">

		            </ul>
		</div>
        <div class="labout span_1_of_g1">
			 <!--<h3>Categories</h3>-->
			 <section  class="sky-form">
					<!--<div class="col col-4">
						<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Abstract</label>
					</div>-->
					<div class="col col-4">
						<!--<a href="gallery.html"><label class="checkbox" style="font-size:17px;color:#999;"><img src="images/r-arrow.png" width="12" height="12" />&nbsp;&lt;!&ndash;<input type="checkbox" name="checkbox"><i></i>&ndash;&gt;Diss列表</label></a>-->
						<a href="register.html"><label class="checkbox" style="font-size:17px;color:#999;"><img src="images/r-arrow.png" width="12" height="12" />&nbsp;<!--<input type="checkbox" name="checkbox"><i></i>-->个人信息</label></a>
				    </div>
			</section>
		  </div>
		   <div class="clear"></div>	
		  </div>
		</div>
   	 </div>
   	</div>
	<div class="footer">
	   	<div class="wrap">
	   		<div class="copy">
				Copyright &copy; 2018.dissing.cn All rights reserved.
		    </div>
	   	</div>
    </div>

	<script type="text/javascript">
		if( $.cookie("dissing_user_name") == null || $.cookie("access_token") == null ) {
		    window.location.href = 'index.html';
			$('#loginBox').html('<a href="login.html"><font size="5px" color="white">登录</font></a>');
		}else{
			/*
			 $('#loginBox').html('<ul><li class="dropdown">' +
			 '<a href="register.html"><font size="5px" color="white">' + $.cookie("dissing_user_name") + '</font></a>' +
			 '<ul> <li><a href="#"><font size="4px" color="white">注销</font></a></li></ul>' +
			 '</li></ul>');
			 */
			$('#loginBox').html('<a href="mypage.jsp"><font size="5px" color="white">' + $.cookie("dissing_user_name") + '</font></a>' +
				' <font color="white">[</font><a href="javascript:logout()"><font size="5px" color="white">注销</font></a><font color="white">]</font>');
			$('#diss').css("display","block");

			access_token = $.cookie('access_token');

			$.ajax({
				url: "http://localhost:9099/board/queryMyPostList?access_token="+ access_token +"&pageNum=<%=pageNum%>",
				type: "get",
				dataType: "json",
				/*username: "bonzzy",
				 password: "bonzzy",*/
				async: false,
				success:function (data) {
					currentPage = <%=pageNum%>;

					if(data.list.length > 0){
						if(currentPage > 1){
							$pageLi=$('<li><a href="mypage.jsp?pageNum='+ (currentPage-1) + '" class="previous">Previous</a></li>');
						}else{
							$pageLi=$('<li><a href="mypage.jsp?pageNum=1' + '" class="previous">Previous</a></li>');
						}

						$('#pageUl').append($pageLi);
					}

					if(data.totalPage < 9){
						for( i=0; i<data.totalPage; i++ ){
							if(currentPage == i+1){
								$pageLi=$('<li><a href="mypage.jsp?pageNum='+ (i+1) + '" class="current">'+(i+1)+'</a></li>');
							}else{
								$pageLi=$('<li><a href="mypage.jsp?pageNum='+ (i+1) + '">'+(i+1)+'</a></li>');
							}
							$('#pageUl').append($pageLi);
						}
					}else{
						if( currentPage < 6 ){
							for( i=0; i<6; i++ ){
								if(currentPage == i+1){
									$pageLi=$('<li><a href="mypage.jsp?pageNum='+ (i+1) + '" class="current">'+(i+1)+'</a></li>');
								}else{
									$pageLi=$('<li><a href="mypage.jsp?pageNum='+ (i+1) + '">'+(i+1)+'</a></li>');
								}
								$('#pageUl').append($pageLi);
							}
							$pageLi=$('<li><a href="mypage.jsp?pageNum='+ (data.totalPage-2) + '">...</a></li>');
							$('#pageUl').append($pageLi);
							for( i=data.totalPage-2; i<data.totalPage; i++ ){
								if(currentPage == i+1){
									$pageLi=$('<li><a href="mypage.jsp?pageNum='+ (i+1) + '" class="current">'+(i+1)+'</a></li>');
								}else{
									$pageLi=$('<li><a href="mypage.jsp?pageNum='+ (i+1) + '">'+(i+1)+'</a></li>');
								}
								$('#pageUl').append($pageLi);
							}
						}else if( currentPage > data.totalPage-5 ){
							for( i=0; i<2; i++ ){
								if(currentPage == i+1){
									$pageLi=$('<li><a href="mypage.jsp?pageNum='+ (i+1) + '" class="current">'+(i+1)+'</a></li>');
								}else{
									$pageLi=$('<li><a href="mypage.jsp?pageNum='+ (i+1) + '">'+(i+1)+'</a></li>');
								}
								$('#pageUl').append($pageLi);
							}
							$pageLi=$('<li><a href="mypage.jsp?pageNum=3' + '">...</a></li>');
							$('#pageUl').append($pageLi);
							for( i=data.totalPage-5; i<data.totalPage+1; i++ ){
								if(currentPage == i){
									$pageLi=$('<li><a href="mypage.jsp?pageNum='+ i + '" class="current">'+i+'</a></li>');
								}else{
									$pageLi=$('<li><a href="mypage.jsp?pageNum='+ i + '">'+i+'</a></li>');
								}
								$('#pageUl').append($pageLi);
							}
						}else{
							$pageLi=$('<li><a href="mypage.jsp?pageNum=1' + '">1</a></li>');
							$('#pageUl').append($pageLi);
							$pageLi=$('<li><a href="mypage.jsp?pageNum=2'+ '">...</a></li>');
							$('#pageUl').append($pageLi);
							$pageLi=$('<li><a href="mypage.jsp?pageNum='+ (currentPage-1) + '">'+(currentPage-1)+'</a></li>');
							$('#pageUl').append($pageLi);
							$pageLi=$('<li><a href="mypage.jsp?pageNum='+ currentPage + '" class="current">'+currentPage+'</a></li>');
							$('#pageUl').append($pageLi);
							$pageLi=$('<li><a href="mypage.jsp?pageNum='+ (currentPage+1) + '">'+(currentPage+1)+'</a></li>');
							$('#pageUl').append($pageLi);
							$pageLi=$('<li><a href="mypage.jsp?pageNum='+ (data.totalPage-1) + '">...</a></li>');
							$('#pageUl').append($pageLi);
							$pageLi=$('<li><a href="mypage.jsp?pageNum='+ data.totalPage + '">'+data.totalPage+'</a></li>');
							$('#pageUl').append($pageLi);
						}
					}

					if(data.list.length > 0){
						if( currentPage < data.totalPage ){
							$pageLi=$('<li><a href="mypage.jsp?pageNum='+ (currentPage+1) + '" class="next">Next</a></li>');
						}else{
							$pageLi=$('<li><a href="mypage.jsp?pageNum='+ data.totalPage + '" class="next">Next</a></li>');
						}
					}

					$('#pageUl').append($pageLi);

					/*if(data.list.length == 0){
					 $('#order').hide();
					 return;
					 }*/

					for( i=0; i<data.list.length; i++){
                        $subject=$("<td>"+ data.list[i].id +"</td>");
						$subject=$("<td>"+ data.list[i].suject +"</td>");
						$status=$("<td>"+ data.list[i].createTime +"</td>");
						$orderInfo.append($orderNumber);
						$orderInfo.append($product);
						$orderInfo.append($status);
						$orderInfo.append($shipping);
						$orderInfo.append($operation);

						$("#listDiv").append($orderInfo);
					}
				},
				error:function(){
					$.confirm({
						'title'		: '提示',
						'message'	: '抱歉，系统错误!',
						'buttons'	: {
							'OK': {
								'class'	: 'gray',
								'action': function(){}
							}
						}
					});
				}
			});

		}

		function logout(){
			$.confirm({
				'title'		: '提示',
				'message'	: '确定要注销当前用户吗？',
				'buttons'	: {
					'是'	: {
						'class'	: 'blue',
						'action': function(){
							$.cookie("dissing_user_name", "", {expires: -1});
							$.cookie("access_token", "", {expires: -1});
							window.location.reload();
						}
					},
					'否': {
						'class'	: 'gray',
						'action': function(){}
					}
				}
			});

		}
	</script>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>