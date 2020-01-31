package com.music.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.music.dao.MusicDao;
import com.music.dao.UserDao;
import com.music.entity.Music;
import com.music.entity.User;

@SuppressWarnings("serial")
public class Controller extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf("."));
		
		if("register".equals(path)) {
			processRegister(request,response);
		}else if("login".equals(path)) {
			processLogin(request,response);
		}else if("findMusic".equals(path)) {
			processFindMusic(request,response);
		}else if("cancel".equals(path)) {
			processCancel(request,response);
		}else if("message".equals(path)) {
			processMessage(request,response);
		}
	}
	
	
	
	



	/**
	 * 留言
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	@SuppressWarnings("unchecked")
	private void processMessage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String username=request.getParameter("username");
		String comment = request.getParameter("comment");
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss E");
		String time = sdf.format(date);
		String str = username+"留言:"+comment+"   "+time;
		List<String> messages = (List<String>) request.getSession().getAttribute("messages");
		if(messages==null) {
			messages = new ArrayList<String>();
		}
		messages.add(str);
		request.getSession().setAttribute("messages", messages);//session绑定
		request.getRequestDispatcher("message.jsp").forward(request, response);//转发
		
	}

	
	
	/**
	 * 注销登陆
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void processCancel(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.getSession().invalidate();//删除
		response.sendRedirect("index.jsp");
	}
	
	
	

	/**
	 *歌单
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void processFindMusic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String str = request.getParameter("str");
		MusicDao dao = new MusicDao();
		List<Music> musics = null;
		if(str!=null) {
			musics = dao.ifMusic(str);//关键字查询
			
		}else {
			musics = dao.findMusic();
		}
		for (Music music : musics) {
			System.out.println(music.getUrl());
		}
		request.setAttribute("findMusic", musics);
		request.getRequestDispatcher("show.jsp").forward(request, response);//转发
		
	}



	/**
	 * 登录
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void processLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String validatecode = request.getParameter("validatecode").toLowerCase();
		UserDao dao = new UserDao();
		
		try {
			User user = dao.selectUser(username);
			if(user!=null && user.getPassword().equals(password)) {
				String code = request.getSession().getAttribute("code").toString().toLowerCase();//获取绑定数据
				if(!validatecode.equalsIgnoreCase(code)) {
					request.setAttribute("login", "验证码错误");
					request.getRequestDispatcher("login.jsp").forward(request, response);
				}
				request.getSession().setAttribute("user", user);//绑定数据
				request.getRequestDispatcher("index.jsp").forward(request, response);//转发到首页
			}else {
				request.setAttribute("login", "用户名或密码错误");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "网络不稳定,请稍后再尝试");
			request.getRequestDispatcher("err.jsp").forward(request, response);
		}
	}



	/**
	 * 注册
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void processRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String OKpassword = request.getParameter("OKpassword");
		String gender = request.getParameter("gender");
		String age = request.getParameter("age");
		String email = request.getParameter("email");
		if(username==null || password==null || age==null || email==null || username=="" || password=="" || age=="" || email=="") {
			request.setAttribute("error", "内容不能为空");
			request.getRequestDispatcher("/register.jsp").forward(request, response);
		}else {
			if(password.equals(OKpassword)) {
				UserDao dao = new UserDao();
				User user = new User();
				user.setUsername(username);
				user.setPassword(password);
				user.setGender(gender);
				user.setAge(Integer.parseInt(age));
				user.setEmail(email);
				try {
					dao.insertUser(user);
					response.sendRedirect("login.jsp");//重定向到登陆页面
				} catch (Exception e) {
					e.printStackTrace();
					request.setAttribute("msg", "网络不稳定,请稍后再尝试");
					request.getRequestDispatcher("err.jsp").forward(request, response);
				}
			}else {
				request.setAttribute("error", "两次输入的密码不一致！");
				request.getRequestDispatcher("/register.jsp").forward(request, response);
			}
		}
	}
	

}
