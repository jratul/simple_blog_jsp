package com.simple.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 * �߰��� ��û�� ����ä�� Ư�� ������ �ϱ� ���� Ŭ����
 * 
 * 1. Filter �������̽��� �����Ѵ�.
 * 2. Filter�� ������ �����Ѵ�.
 */
@WebFilter({"/about.jsp", "/contact.jsp", "/post.jsp"})	//2.
public class LoginFilter implements Filter{ //1.

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		//���� type���� casting
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		
		//context path
		String cPath = request.getContextPath();
		//���� ��û�� url ������ �о�´�.(���� �̵��Ϸ��� ������)
		String url = request.getRequestURI();
		
		//���� ��ü�� ���ͼ�
		HttpSession session = request.getSession();
		//id�� ����Ǿ� �ִ��� �о�� ����.
		String id = (String) session.getAttribute("id");
		
		if(id==null) {	//�α������� �ʾ�����
			//�α����� �������� �̵��϶�� �����̷�Ʈ ������ �ش�.
			response.sendRedirect(cPath + "/login_form.jsp?url=" + url);
		} else {
			//��û�� �帧 ��� �����Ű��
			chain.doFilter(req, res);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}
	
}
