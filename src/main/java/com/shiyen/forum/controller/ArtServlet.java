package com.shiyen.forum.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.google.gson.Gson;
import com.shiyen.art.model.ArtDTO;
import com.shiyen.art.model.ArtReplyDTO;
import com.shiyen.art.model.ArtService;
import com.shiyen.art.model.ArtVO;

@WebServlet("/art")
public class ArtServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("application/json; charset=UTF-8");
		String action = req.getParameter("act");
		
		switch (action) {
		
		case "getOneForumArt": {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
//			接收參數和錯誤驗證
			Integer gameId = Integer.valueOf(req.getParameter("gameId").trim()); 
			if (gameId == null ) {
				errorMsgs.add("遊戲編號錯誤");
			}
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/game/gameList.jsp");
				failureView.forward(req, res);
				return;//程式中斷
			}
			
//			查詢資料
			ArtService artSvc = new ArtService();
			List<ArtDTO> artDTO = artSvc.getAllArtByGameId(Integer.valueOf(gameId));
			if (artDTO == null) {
				errorMsgs.add("查無資料");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/game/gameList.jsp");
				failureView.forward(req, res);
				return;//程式中斷
			}
//			傳送資料
			Gson gson = new Gson();
			String json = gson.toJson(artDTO);
			System.out.println(json);
			res.getWriter().write(json);
			
			break;
		}
//獲取首篇文章
		case "getArt":{
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
//			接收參數和錯誤驗證
			String artId = req.getParameter("artId");
			if (artId == null || (artId.trim()).length() == 0) {
				errorMsgs.add("遊戲編號錯誤");
			}
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/forum/oneForum.jsp");
				failureView.forward(req, res);
				return;//程式中斷
			}
//			查詢資料
			ArtService artSvc = new ArtService();
			ArtDTO  artDTO = artSvc.getOneArt(Integer.valueOf(artId));
			if (artDTO == null) {
				errorMsgs.add("查無資料");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/forum/oneForum.jsp");
				failureView.forward(req, res);
				return;//程式中斷
			}
//			傳送資料
			Gson gson = new Gson();
			String json = gson.toJson(artDTO);
			System.out.println(json);
			res.getWriter().write(json);
			
			break;
			
		}


		case "getReply":{
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
		
//			接收參數和錯誤驗證
			String artId = req.getParameter("artId");
			System.out.println(artId);
			
			
//			查詢資料
			ArtService artSvc = new ArtService();
			List<ArtReplyDTO> artReplyDTO = artSvc.getReply(Integer.valueOf(artId));
			if (artReplyDTO == null) {
				errorMsgs.add("查無資料");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/forum/oneForum.jsp");
				failureView.forward(req, res);
				return;//程式中斷
			}
//			傳送資料
			Gson gson = new Gson();
			String json = gson.toJson(artReplyDTO);
			System.out.println(json);
			res.getWriter().write(json);
			
			break;
			
		}
	}	
  }

}