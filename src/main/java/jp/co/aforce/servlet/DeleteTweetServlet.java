package jp.co.aforce.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jp.co.aforce.dao.TweetDAO;

@WebServlet("/delete_tweet")
public class DeleteTweetServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String deleteString = request.getParameter("delete");
		int delete = Integer.parseInt(deleteString);
		
		TweetDAO tweetDAO = new TweetDAO();
		try {
			tweetDAO.deleteTweet(delete);
			session.setAttribute("Tweet_SuccessOrError", "success");
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("Tweet_SuccessOrError", "error");
		}
		
		response.sendRedirect("tweet_list");
	}	
}