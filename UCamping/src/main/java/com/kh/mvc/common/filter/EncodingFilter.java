package com.kh.mvc.common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

@WebFilter(filterName="encoding", urlPatterns="/*")
public class EncodingFilter implements Filter {


    public EncodingFilter() {
        
    }

    public void init(FilterConfig fConfig) throws ServletException {
	}
    
    // 컨테이너가 현재 요청에 필터를 적용하겠다고 판단하면 호출한다.
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest hr = (HttpServletRequest)request;
		String requestMethod = hr.getMethod();
		
		
		if(requestMethod.equals("POST")) {
			hr.setCharacterEncoding("UTF-8");
		}
		
		chain.doFilter(hr, response);	
	}
	
	public void destroy() {

	}


	

}
