<!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<% 
	String orderNumber = request.getParameter("orderNumber");
	if(orderNumber == null){
		out.write("Sorry, please input a order number!");
		return ;
	}
%>
<html>
<head>
<title>Order Information</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href='http://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
<script src="js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="css/css-table.css" />
<script type="text/javascript" src="js/style-table.js"></script>
<script src="jquery.confirm/jquery.confirm.js"></script>
<link rel="stylesheet" type="text/css" href="jquery.confirm/jquery.confirm.css" />
</head>
<body>
<script type="text/javascript">
	//Ajax调用处理
	$(document).ready(function(){
		$.ajax({
			url: "http://47.254.71.40:9099/order/query/<%=orderNumber%>",
			type: "get",  
			dataType: "json",
			success: function(ret){  
				if(ret == null){
					$.confirm({
						//'title'		: 'Delete Confirmation',
						'title'		: 'Tips',
						//'message'	: 'You are about to delete this item. <br />It cannot be restored at a later time! Continue?',
						'message'	: 'Sorry, there is not the order information!',
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
				}else{
					$('#orderNumber').html(ret.orderNumber);
					productArray = JSON.parse(ret.product);
					parseString = '';
					for( j=0; j<productArray.length; j++ ){
						parseString += productArray[j].productModel + " : " + productArray[j].quantity;
						parseString += "<br/>";
					}
					parseString += '';
					$('#product').html(parseString);
					//$('#productModel').html(ret.productModel);
					//$('#quantity').html(ret.quantity);
					$('#status').html(ret.status);
					$('#shipping').html(ret.shipping);
				}
			},
			error: function(err){
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
			}
		});  
	});//页面加载
	
</script>
<div class="index-banner1">
  <div class="header-top">	
	<div class="wrap">
   		<!--<div class="logo">
			<a href="index.html"><img src="images/logo.png" alt=""/></a>
		</div>	-->
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
			         <div class="clear"></div>		
		  </div>	
		</div>	
	   </div>
   	   <div class="main">
   	     <div class="wrap">
   	       <div class="abstract">
		   	  <!--<div class="map">
				 <iframe width="100%" height="300" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.co.in/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Lighthouse+Point,+FL,+United+States&amp;aq=4&amp;oq=light&amp;sll=26.275636,-80.087265&amp;sspn=0.04941,0.104628&amp;ie=UTF8&amp;hq=&amp;hnear=Lighthouse+Point,+Broward,+Florida,+United+States&amp;t=m&amp;z=14&amp;ll=26.275636,-80.087265&amp;output=embed"></iframe><br><small><a href="https://maps.google.co.in/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Lighthouse+Point,+FL,+United+States&amp;aq=4&amp;oq=light&amp;sll=26.275636,-80.087265&amp;sspn=0.04941,0.104628&amp;ie=UTF8&amp;hq=&amp;hnear=Lighthouse+Point,+Broward,+Florida,+United+States&amp;t=m&amp;z=14&amp;ll=26.275636,-80.087265" style="color:#666;text-align:left;font-size:12px">View Larger Map</a></small>
			 </div>-->
			 <div class="section group">
				<div class="cont1 span_2_of_a1">
					<!--
					<div class="contact-form">
					<div class="contact-to">
                     	<input type="text" class="text" value="Order Number" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Order Number';}">
						<input type="text" class="text" value="Email..." onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email...';}" style="margin-left: 10px">
					 	<input type="text" class="text" value="Subject..." onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Subject...';}" style="margin-left: 10px">
					</div>
					<div class="text2">
	                   <textarea value="Message:" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Message';}">Message..</textarea>
	                </div>
	               <span><input type="submit" class="" value="Search"></span>
				   
	                <div class="clear"></div>
	               </div>
				   -->
				   
				   
					<div class="search_box" style="border:1px solid #E1E2E2; width:35%">
						<form>
						   <!--<input type="text" id="orderNumberInput" value="<%=orderNumber%>" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Order Number';}"><input id="toQuery" type="button" value="">-->
						   <input type="text" id="orderNumberInput" value="<%=orderNumber%>" onfocus="if(this.value=='Order Number')this.value = '';" onblur="if (this.value == '') {this.value = 'Order Number';}"><input id="toQuery" type="button" value="">
						</form>
					</div>
					<script type="text/javascript">
						$('#toQuery').click(function(){
							var orderNumber = $('#orderNumberInput').val();
							 //Ajax调用处理
							$.ajax({  
								url: "http://47.254.71.40:9099/order/query/"+orderNumber,
								type: "get",  
								dataType: "json",
								success: function(ret){  
									if(ret == null){
										$.confirm({
											//'title'		: 'Delete Confirmation',
											'title'		: 'Tips',
											//'message'	: 'You are about to delete this item. <br />It cannot be restored at a later time! Continue?',
											'message'	: 'Sorry, there is no order information!',
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
									}else{
										window.location.href="order.jsp?orderNumber="+orderNumber;
									}
								},
								error: function(err){
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
								}
							});  
						});
					</script>
					<!--
					<br/>
				   <h3>Order Information</h3>
				   <div class="address">
				   		<div style="font-size: 20px; color:#999">Order Number: USA201805111642222</div>
				   		<div style="font-size: 20px; color:#999; margin-top: 10px">Product Model: Test</div>
				 	 	<div style="font-size: 20px; color:#999; margin-top: 10px">Quantity: 10000</div>
				   		<div style="font-size: 20px; color:#999; margin-top: 10px">Status: complete</div>
						<div style="margin-top: 10px">
							<span style="font-size: 20px; color:#999">Quality Check: complete</span>
							<img style="vertical-align:top" src="images/g5.jpg" />
						</div>
						<div style="font-size: 20px; color:#999; margin-top: 10px">Shipping: complete</div>
				   </div>
				   -->
				</div>
				
				<table id="order" >
					<caption>Order Information</caption>
					
					<tbody>
						<tr>
							<th scope="row">Order Number</th>
							<td id="orderNumber"></td>
						</tr>
						
						<tr>
							<th scope="row">Product</th>
							<td id="product"></></td>
						</tr>
						
						<!--
						<tr>
							<th scope="row">Product Model</th>
							<td id="productModel"></></td>
						</tr>
						
						
						<tr>
							<th scope="row">Quantity</th>
							<td id="quantity"></></td>
						</tr>
						-->
						
						<tr>
							<th scope="row">Status</th>
							<td id="status"></></td>
						</tr>
						
						<tr>
							<th scope="row">Shipping</th>
							<td id="shipping"></></td>
						</tr>
						
					</tbody>

				</table>
				<!--
				<div id="qualityCheckButton" style="background: none repeat scroll 0 0 #82C400;
							width:130px; 
							height:42px; 
							border-width: 0; 
							font-size: 17px; 
							color: #FFFFFF; 
							font-weight: 500; 
							border-radius: 6px; 
							cursor:pointer;
							text-align:center;
							vertical-align:middle;
							line-height:42px;" onclick="javascript:window.location.href='qualitycheck.html'">
					Quality Check
				</div>
				-->
				<div id="qualityCheckButton" class="buttonClass" style="font-size: 17px; width: 120px;">
						Quality Check
				</div>
				<script type="text/javascript">
					$('#qualityCheckButton').click(function(){
						window.location.href="qualitycheck.jsp?orderNumber=<%=orderNumber%>";
					});
				</script>

				
				<!--
                <div class="labout span_1_of_a1">
			       <h3>Contact Info</h3>
			       <div class="address">
				                <p>500 Lorem Ipsum Dolor Sit,</p>
						   		<p>22-56-2-9 Sit Amet, Lorem,</p>
						   		<p>USA</p>
				   		<p>Phone:(00) 222 666 444</p>
				   		<p>Fax: (000) 000 00 00 0</p>
				 	 	<p>Email: <span>support[at]leoimages.com</span></p>
				   		<p>Follow on: <span>Facebook</span>, <span>Twitter</span></p>
				   </div>
			    </div>
				-->
		        <div class="clear"></div>	
		      </div>
		   </div>
   	     </div>
   	</div>
	<div class="footer">
	   	<div class="wrap">
	   		<div class="copy">
			   <p>
			   Copyright &copy; 2018.Bonzzy All rights reserved.
			   <!--<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a>-->
			   </p>
		    </div>
	   	</div>
    </div>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>