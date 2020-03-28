package web.sample;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.RequestDispatcher;
import web.sample.LastException;

/**
 * サーブレット実装クラス OriginalUncaughtException
 */
@WebServlet("/OriginalUncaughtException")
public class OriginalUncaughtException extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OriginalUncaughtException() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//例外の内容やトレース内容をLogに出力したい場合やユーザーに画面出力したい場合にここへ書きます。
		
		String title = RequestDispatcher.ERROR_EXCEPTION_TYPE;
		String place = RequestDispatcher.ERROR_SERVLET_NAME;
		String param = RequestDispatcher.ERROR_STATUS_CODE;
		String message = RequestDispatcher.ERROR_MESSAGE;
		LastException.SetLastException(title, place, param, message);
		
		request.setAttribute("msg", message);
		RequestDispatcher reqdispathcer = request.getRequestDispatcher("/errormsg.html");
		reqdispathcer.forward(request, response);
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
