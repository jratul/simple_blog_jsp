package com.simple.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
/*
 * 	EncodingFilter�� post ��� �Ķ���� �������� ��
 * �ѱ��� ������ �ʵ��� ���ڵ� ������ �ڵ����� ���ִ� ������ �Ѵ�.
 * 
 * ������ ���� ������ WEB-INF/web.xml ������ �Ǿ� �ִ�.
 */
public class EncodingFilter implements Filter{
	//�ʵ�
	private String encoding;

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		//1. ��û�� ����ä�� �ؾ��� �۾� �ۼ�
		if(req.getCharacterEncoding()==null) {
			//�ʵ忡 ����� ���ڵ� ���� �����ϱ�
			req.setCharacterEncoding(encoding);
		}
		
		//2. ���� �۾� �����ϱ�
		chain.doFilter(req, res);
	}

	//���Ͱ� ���� ���۵� �� ȣ��Ǵ� �޼ҵ�(��ü ���� ����)
	@Override
	public void init(FilterConfig config) throws ServletException {
		/*
		 * �Ʒ��� ���� web.xml ������ ���� �߿��� utf-8 ���ڿ�
		 * �о��
		 * <init-param>
		 * 		<param-name>encoding</param-name>
		 * 		<param-value>utf-8</param-value>
		 * </init-param>
		 */
		//�ϰϿ� ���ڿ��� ��� �ʵ忡 �����Ѵ�.
		encoding = config.getInitParameter("encoding");
		
	}

}
