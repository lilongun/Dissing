<!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<% 
	String id = request.getParameter("id");
%>
<html>
<head>
<title>Editor Order Information</title>
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
	access_token = $.cookie('access_token');
	if(access_token == null){
		window.location.href = '404.html';
	}
	//Ajax调用处理
	$(document).ready(function(){
		$.ajax({
			url: "http://localhost:9099/auth/user?access_token="+access_token,
			type: "get",  
			dataType: "json",
			async: false,
			type: "GET",
			success:function (data) {
				if(data.authorities == null || data.authorities == '' || data.authorities == undefined){
					$.confirm({
						//'title'		: 'Delete Confirmation',
						'title'		: 'Tips',
						//'message'	: 'You are about to delete this item. <br />It cannot be restored at a later time! Continue?',
						'message'	: 'Sorry, server exception!',
						'buttons'	: {
							/*'Yes'	: {
								'class'	: 'blue',
								'action': function(){
									elem.slideUp();
								}
							},*/
							'OK': {
								'class'	: 'gray',
								'action': function(){}	// Nothing to do in this case. You can as well omit the action property.
							}
						}
					});
					window.location.href="404.html";
				}
				isAdmin = false;
				for( i=0; i<data.authorities.length; i++ ){
					if(data.authorities[i].authority == 'admin'){
						isAdmin = true;
						break;
					}
				}
				if(!isAdmin){
					$.confirm({
						//'title'		: 'Delete Confirmation',
						'title'		: 'Tips',
						//'message'	: 'You are about to delete this item. <br />It cannot be restored at a later time! Continue?',
						'message'	: 'Sorry, you are not a admin, cannot manage orders!"',
						'buttons'	: {
							/*'Yes'	: {
								'class'	: 'blue',
								'action': function(){
									elem.slideUp();
								}
							},*/
							'OK': {
								'class'	: 'gray',
								'action': function(){}	// Nothing to do in this case. You can as well omit the action property.
							}
						}
					});
					window.location.href="404.html";
				}
				
				<% 
				if(id != null && id.trim() != "" ){
				%>
					$.ajax({
						url: "http://localhost:9099/order/queryList?access_token="+ access_token +"&id=<%=id%>",
						type: "get",  
						dataType: "json",
						async: false,
						type: "GET",
						success:function (data) {
							if( data == null || data.list == null || data.list == undefined || data.list.length == 0 ){
								$.confirm({
									'title'		: 'Tips',
									'message'	: 'Sorry, there is no order information!',
									'buttons'	: {
										'OK': {
											'class'	: 'gray',
											'action': function(){}	// Nothing to do in this case. You can as well omit the action property.
										}
									}
								});
							}else{
								$('#orderNumber').val(data.list[0].orderNumber);
								productArray = data.list[0].product;
								jsonArray = JSON.parse(productArray);
								if(jsonArray.length > 0){
									$('input[name="productModel"]').val(jsonArray[0].productModel);
									$('input[name="quantity"]').val(jsonArray[0].quantity);
									var html = '';
									for( i=1; i<jsonArray.length; i++ ){
										html += '<p><span style="width:40%; display:inline-block"><label>Product Model</label><input value="'+ jsonArray[i].productModel +'" name="productModel" style="width:100%" type="text"></span> <span style="width:10%;display:inline-block"><label>Quantity</label><input value="'+ jsonArray[i].quantity +'" style="width:100%" name="quantity" type="text"></span></p>';
									}
									$('#statusSource').before(html);
								}
								//$('#productModel').val(data.list[0].productModel);
								//$('#quantity').val(data.list[0].quantity);
								$('#status').val(data.list[0].status);
								$('#shipping').val(data.list[0].shipping);
								$('#id').val(data.list[0].id);
								//$('#qualityCheck').val(data.list[0].qualityCheck);
								
								CKEDITOR.instances.qualityCheck.setData(data.list[0].qualityCheck);
							}
						},
						error:function(data){
							$.confirm({
								'title'		: 'Tips',
								'message'	: 'Sorry, server exception!',
								'buttons'	: {
									'OK': {
										'class'	: 'gray',
										'action': function(){}	// Nothing to do in this case. You can as well omit the action property.
									}
								}
							});
						}
					});
				<%
				}
				%>
			},
			error:function(){
                window.location.href = 'login.html';
				$.confirm({
					//'title'		: 'Delete Confirmation',
					'title'		: 'Tips',
					//'message'	: 'You are about to delete this item. <br />It cannot be restored at a later time! Continue?',
					'message'	: 'Sorry, server exception!',
					'buttons'	: {
						/*'Yes'	: {
							'class'	: 'blue',
							'action': function(){
								elem.slideUp();
							}
						},*/
						'OK': {
							'class'	: 'gray',
							'action': function(){}	// Nothing to do in this case. You can as well omit the action property.
						}
					}
				});
				window.location.href="404.html";
			}
		});  
	});//页面加载
	
</script>

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

					<script type="text/javascript">
						if( $.cookie("dissing_user_name") == null || $.cookie("access_token") == null ) {
							$('#loginBox').html('<a href="login.html"><font size="5px" color="white">登录</font></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="register.html"><font size="5px" color="white">注册</font></a>');
							$('#diss').css("display","none");
						}else{
							/*
							 $('#loginBox').html('<ul><li class="dropdown">' +
							 '<a href="register.html"><font size="5px" color="white">' + $.cookie("dissing_user_name") + '</font></a>' +
							 '<ul> <li><a href="#"><font size="4px" color="white">注销</font></a></li></ul>' +
							 '</li></ul>');
							 */
							$('#loginBox').html('<a href="mypage.html"><font size="5px" color="white">' + $.cookie("dissing_user_name") + '</font></a>' +
								' <font color="white">[</font><a href="javascript:logout()"><font size="5px" color="white">注销</font></a><font color="white">]</font>');
							$('#diss').css("display","block");
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
											window.location.href = "index.html";
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
			         <div class="clear"></div>		
		  </div>	
		</div>	
	   </div>
   	   <div class="main">
   	     <div class="wrap" >
			<div class="quality-area">
				<form>
					<input type="hidden" id="id" >
					<p>
						<label>Diss对象</label>
						<!--<span>*</span>-->
						<input id="subject" type="text" value="">
					</p>
					<%--<p id="productModelSource">
						<span style="width:40%; display:inline-block">
							<label>Product Model</label>
							<!--<span>*</span>-->
							<input value="" name="productModel" style="width:100%" type="text">
						</span>
						<span style="width:10%;display:inline-block">
							<label>Quantity</label>
							<input value="" style="width:100%" name="quantity" type="text">
						</span>
						<span>
							<input onclick="" value="Add" type="button" id="addModel">
						</span>
					</p>--%>
					<p>
						<label>Diss内容</label>
						<!--<span>*</span>-->
						<textarea id="content" name="editor"></textarea>
					</p>
					<p>
						<input id="submitOrder" type="button" value="提交">
						<input type="button" value="取消" onclick="window.location.href='index.html'">
					</p>
				</form>
				<ckeditor:replace replace="content" basePath="ckeditor/" />
				<script type="text/javascript">
					var $ = jQuery.noConflict();
					$(function() {
						$('#submitOrder').click(function(){
							var subject = $('#subject').val();
							//var productModel = $('#productModel').val();
							//var productModelArray = $('input[name="productModel"]');
							//var quantity = $('#quantity').val();
                            //var quantityArray = $('input[name="quantity"]');
                            /*var productArray = [];
                            for( i=0; i<productModelArray.length; i++ ){
                                productArray.push( "{'productModel':'" + productModelArray[i].value + "', 'quantity':'" + quantityArray[i].value + "'}" );
							}
							var status = $('#status').val();
							var shipping = $('#shipping').val();*/
							var id = $('#id').val();
							var reg=/\n/g;
							var reg2=/\"/g;
							var check = CKEDITOR.instances.content.getData().replace(reg , "").replace(reg2, "'");
							if(id == ''){
								$.ajax({
									url: "http://localhost:9099/board/savePost?access_token="+access_token,
									type: "put",  
									//dataType: "json",
									contentType: "application/json; charset=UTF-8",
									data: 
									/*'{"orderNumber" : "'+orderNumber+'","product" : "['+ productArray.toString() + ']","status" : "' + status + '","shipping" : "' + shipping + '","qualityCheck" : "' + check + '"}',*/
                                    '{"subject" : "'+subject+'","content" : "' + check + '"}',
									async: false,
									success:function (data) {
										if(data == null || data == '' || data == undefined){
											$.confirm({
												'title'		: '提示',
												'message'	: '抱歉，服务器错误！',
												'buttons'	: {
													'OK': {
														'class'	: 'gray',
														'action': function(){}
													}
												}
											});
											return;
										}
										if(data == 'success'){
                                            $.confirm({
                                                'title'		: '提示',
                                                'message'	: '发送diss成功!',
                                                'buttons'	: {
                                                    'OK': {
                                                        'class'	: 'gray',
                                                        'action': function(){window.location.href = 'index.html';}
                                                    }
                                                }
                                            });
										}else{
											$.confirm({
												'title'		: '提示',
												'message'	: '抱歉, 发送diss错误!',
												'buttons'	: {
													'OK': {
														'class'	: 'gray',
														'action': function(){}
													}
												}
											});
										}
									},
									error:function(data){
										$.confirm({
											'title'		: '提示',
											'message'	: '抱歉，服务器错误！',
											'buttons'	: {
												'OK': {
													'class'	: 'gray',
													'action': function(){}
												}
											}
										});
									}
								});
							}else{
								$.ajax({
									url: "http://localhost:9099/board/updatePost?access_token="+access_token,
									type: "post",  
									//dataType: "json",
									contentType: "application/json; charset=UTF-8",
									data:
									'{"id": "'+ id +'","subject" : "'+subject+'","content" : "' + check + '"}',
									async: false,
									success:function (data) {
										if(data == null || data == '' || data == undefined){
											$.confirm({
                                                'title'		: '提示',
                                                'message'	: '抱歉，服务器错误！',
                                                'buttons'	: {
                                                    'OK': {
                                                        'class'	: 'gray',
                                                        'action': function(){}
                                                    }
                                                }
											});
											return;
										}
										if(data == 'success'){
											window.location.href = 'orderlist.jsp';
										}else{
                                            $.confirm({
                                                'title'		: '提示',
                                                'message'	: '抱歉, 发送diss错误!',
                                                'buttons'	: {
                                                    'OK': {
                                                        'class'	: 'gray',
                                                        'action': function(){}
                                                    }
                                                }
                                            });
										}
									},
									error:function(data){
                                        $.confirm({
                                            'title'		: '提示',
                                            'message'	: '抱歉，服务器错误！',
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
						});

						//添加model
                        /*$('#addModel').click(function(){
                            $('#statusSource').before('<p><span style="width:40%; display:inline-block"><label>Product Model</label><input value="" name="productModel" style="width:100%" type="text"></span> <span style="width:10%;display:inline-block"><label>Quantity</label><input value="" style="width:100%" name="quantity" type="text"></span></p>');
                        });*/
					});
				</script>
			</div>
		 </div>
		</div>
	<div class="footer">
	   	<div class="wrap">
	   		<div class="copy">
			   <p>
				   Copyright &copy; 2018.dissing.cn All rights reserved.
			   <!--<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a>-->
			   </p>
		    </div>
	   	</div>
    </div>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>