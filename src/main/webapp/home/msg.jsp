<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mike.game.model.*"%>
<%@ page import="com.mike.genre.model.*"%>
<%@ page import="com.mike.label.model.*"%>
<%@ page import="com.mike.msg.model.*"%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OaSis - 系統訊息</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<style>
		html{
			height:100%;
		}
		.card{
			overflow: hidden;
		}
		.card-img-top{
			height:100%;
			width:100%;
			object-fit: contain;
		}
		#cardImgContainer{
			width: 100%;
			height: 200px;
		   	overflow: hidden;
		   	background-color: LightGray;
		}
		#btn-container{
			display: flex;
            justify-content: flex-end;
		}
		#main{
			min-height: 400px;
		}
	</style>
	<link rel="stylesheet" href="/oasis/home/resources/background.css">
</head>

<body>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	
	<%@ include file="/home/navbar.jsp" %>
	
	<%
		MsgAdminService msgAdminSvc = new MsgAdminService();
		MsgUserService msgUserSvc = new MsgUserService();
		int userId = user.getUserId();
	%>
	
	<div id="content">
	    <h1 class="mx-5 my-2 fw-bold">系統訊息</h1>
    	<div id="main" class="mx-5 border border-primary border-2 rounded p-4 bg-white">
	    	
	
	
	
			<div class="alert alert-info container text-center mt-5" id="deletedNotiftication" role="alert" style="display:none;">
		   		 成功刪除訊息!
			</div>
			<div class="alert alert-danger container text-center mt-5" id="deletingErrorNotiftication" role="alert" style="display:none;">
		   		 刪除訊息時發生錯誤
			</div>
			
			<ul class="list-group">
			
			<%
				if(user.getUserIdentity().toString().equals("ADMINISTRATOR")){
					List<Msg> adminMsgList = msgAdminSvc.getMsgListForAdmin(Msg.TYPE_REGULAR_APPLY_FOR_COMPANY);
					if(adminMsgList.size() >0){
						for(int i = 0; i<adminMsgList.size();i++){
							Msg msg = adminMsgList.get(i);
							if(msg!=null){
			%>			
				<li class="list-group-item">
				
					<div class="card" style="width: 70%;  justify-content: center;">
					    <div class="card-body">
					    	<h5 class="card-title">申請廠商身份</h5>
					    	<hr>
					    	<p class="card-text"><%= msg.getContent() %></p>
					    	<button href="#" data-msg-id="<%= i %>" data-msg-type="<%= msg.getType() %>" class="del-msg card-link btn btn-outline-danger">刪除訊息</button>
					    </div>
					</div>
					
				</li>
			<%			
							}
						}
					}
				}
			%>
			
			
			<%
			
				List<String> redisKeys = msgUserSvc.getExistingRedisKeyForOneUser(userId);
				System.out.println("line 104");
				for(String redisKey:redisKeys){
					System.out.println(redisKey);
					System.out.println("line 107");
					List<Msg> msgList = msgUserSvc.getMsgListByRedisKey(redisKey);
					if(msgList.size() >0){
						System.out.println("line 111");
						for(int i = 0; i<msgList.size();i++){
							System.out.println("line 113");
							Msg msg = msgList.get(i);
							System.out.println(msg);
							if(msg!=null){
								System.out.println("line 116");
			%>			
				<li class="list-group-item">
				
					<div class="card" style="width: 70%;  justify-content: center;">
					    <div class="card-body">
					    	<h5 class="card-title">訂閱通知</h5>
					    	<hr>
					    	<p class="card-text"><%= msg.getContent() %></p>
					    	<button href="#" data-msg-id="<%= i %>" data-msg-type="<%= msg.getType() %>" class="card-link del-msg btn btn-outline-danger">刪除訊息</button>
					    </div>
					</div>
					
				</li>
			<%			
							}
						}
					}
				}
			%>
			
			
			
			</ul>
		</div>
	</div>
			
			
	<script>
		$(document).ready(function() {
		  $("button.del-msg").click(function(e) {
			  e.preventDefault();
			  console.log("del-msg has been clicked!")
			
			  const parentLi = $(this).closest('li');
		    let data = {
				  			"msgId": $(this).data("msg-id"),
				  			"msgType": $(this).data("msg-type")
		    			};
		
		    $.ajax({
		      type: "POST",
		      url: "/oasis/deleteMsg",
		      data: data,
		      success: function(response) {
		        console.log("成功刪除一筆訊息:", response);
		        $("#deletedNotiftication").fadeIn(250).fadeOut(3000);
		        parentLi.remove();
		      },
		      error: function(jqXHR, textStatus, errorThrown) {
		        console.error("刪除訊息時發生錯誤");
		        $("#deletingErrorNotiftication").fadeIn(250).fadeOut(3000);
		      }
		    });
		  });
		});
	</script>

</body>

</html>