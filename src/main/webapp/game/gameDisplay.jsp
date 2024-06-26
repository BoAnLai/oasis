<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mike.game.model.*"%>
<%@ page import="com.mike.genre.model.*"%>
<%@ page import="com.mike.label.model.*"%>
<%@ page import="com.ryan.subs.model.*"%>

<%
    List<GameVO> gameList = GameService.listAll();
%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OaSis - 遊戲列表</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<style>
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
	</style>
	<link rel="stylesheet" href="/oasis/home/resources/background.css">
</head>

<body>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	
	<%@ include file="/home/navbar.jsp" %>
	<%
		
	List<SubsVO> subsList = new ArrayList<SubsVO>();
		if(user != null){
			//取得 userId
			Integer userId = user.getUserId();
		
			//使用方法取得list
			SubsService subsService = new SubsService();
		
			subsList = subsService.findByUserId(userId);
		}
	%>
	
	<div class="row row-cols-md-4">
	
	
		<% for(GameVO game: gameList){ %>
			<div class="col mb-3">
				<div class="card h-100">
					<div id="cardImgContainer" class="col-md-4">
					  <img src="<%= game.getGameImg() %>" class="card-img-top" alt="...">
					</div>
				  <div class="card-body">
				  	<div class="h-75">
					    <h5 class="card-title fw-bold"><%= game.getGameName() %></h5>
					    <p class="card-text">
					    	<% 
							   List<GenreVO> genreList = GameService.getGenresByGameId(game.getGameId());
							   for(GenreVO genre: genreList){ 
							%>
			    				<%= genre.getGenreName() %> <br>
							<% } %>
				    </p>
				  	</div>
				  	<div id="btn-container" class="mb-1">
				  		
				  		<% 
				  		   boolean foundSubscription = false;
				  		   if(subsList!=null){
					  		   for(SubsVO subs: subsList) {
					  		
							       if (subs.getSubsGameId() == game.getGameId()) {
									  foundSubscription = true;
						%>
				  			<button class="subBtn btn btn-outline-danger mx-3 subBtn" data-game-id="<%= game.getGameId() %>" data-subs-id="<%= subs.getSubsId() %>" data-type="game">取消訂閱</button>
				  		<% 
					  					break;  
					  			   }
							    }
				  		    }
							 
				  		    if (!foundSubscription){ 
						%>
							<button class="subBtn btn btn-danger mx-3 subBtn" data-game-id="<%= game.getGameId() %>" data-type="game">訂閱遊戲</button>
						<%  } %>
				  					  			  		
				  		<form action="/oasis/game/forum/<%= game.getGameId() %>" method="POST">
						  <button type="submit" class="btn btn-primary">文章列表</button>
						</form>
				  	</div>
				  </div>
				  
				</div>
			</div>
		<% } %>
	</div>

	<script>
		$(document).ready(function() {
		  $(".subBtn").click(function(e) {
			  e.preventDefault();
			  console.log("subBtn has been clicked!")
			  
		    let data = {
				  			"userId": <%= user!=null?user.getUserId():null %>,
		    				"gameId": $(this).data('gameId'),
		    				"subsType": $(this).data('type'),
		    				"subsId": $(this).data('subsId')
		    			};
		
		    $.ajax({
		      type: "POST",
		      url: "/oasis/subs.do",
		      data: data,
		      success: function(response) {
		    	  alert('成功！');
		        // $("#updatedNotiftication").fadeIn(250).fadeOut(3000);
		      },
		      error: function(jqXHR, textStatus, errorThrown) {
		        console.error("訂閱錯誤");
		        // $("#wrongCellphoneNotiftication").fadeIn(250).fadeOut(3000);
		      }
		    });
		  });
		});
	</script>
		


</body>

</html>