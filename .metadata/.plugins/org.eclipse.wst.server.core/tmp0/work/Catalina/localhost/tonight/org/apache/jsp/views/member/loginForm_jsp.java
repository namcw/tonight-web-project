/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
 * Generated at: 2017-10-25 01:39:56 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.views.member;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class loginForm_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

final java.lang.String _jspx_method = request.getMethod();
if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
return;
}

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"ko\">\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"/tonight/css/bootstrap.min.css\">\r\n");
      out.write("<title>Login Page</title>\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("\r\n");
      out.write("body, html {\r\n");
      out.write("    height: 100%;\r\n");
      out.write("    background-repeat: no-repeat;\r\n");
      out.write("    background-image: url('/tonight/img/loginbackground.jpg');\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".card-container.card {\r\n");
      out.write("    max-width: 350px;\r\n");
      out.write("    padding: 40px 40px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".btn {\r\n");
      out.write("    font-weight: 700;\r\n");
      out.write("    height: 36px;\r\n");
      out.write("    -moz-user-select: none;\r\n");
      out.write("    -webkit-user-select: none;\r\n");
      out.write("    user-select: none;\r\n");
      out.write("    cursor: default;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("/*\r\n");
      out.write(" * Card component\r\n");
      out.write(" */\r\n");
      out.write(".card {\r\n");
      out.write("    background-color: #F7F7F7;\r\n");
      out.write("    /* just in case there no content*/\r\n");
      out.write("    padding: 20px 25px 30px;\r\n");
      out.write("    margin: 0 auto 25px;\r\n");
      out.write("    margin-top: 50px;\r\n");
      out.write("    /* shadows and rounded borders */\r\n");
      out.write("    -moz-border-radius: 2px;\r\n");
      out.write("    -webkit-border-radius: 2px;\r\n");
      out.write("    border-radius: 2px;\r\n");
      out.write("    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);\r\n");
      out.write("    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);\r\n");
      out.write("    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".profile-img-card {\r\n");
      out.write("    width: 96px;\r\n");
      out.write("    height: 96px;\r\n");
      out.write("    margin: 0 auto 10px;\r\n");
      out.write("    display: block;\r\n");
      out.write("    -moz-border-radius: 50%;\r\n");
      out.write("    -webkit-border-radius: 50%;\r\n");
      out.write("    border-radius: 50%;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("/*\r\n");
      out.write(" * Form styles\r\n");
      out.write(" */\r\n");
      out.write(".profile-name-card {\r\n");
      out.write("    font-size: 16px;\r\n");
      out.write("    font-weight: bold;\r\n");
      out.write("    text-align: center;\r\n");
      out.write("    margin: 10px 0 0;\r\n");
      out.write("    min-height: 1em;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".reauth-email {\r\n");
      out.write("    display: block;\r\n");
      out.write("    color: #404040;\r\n");
      out.write("    line-height: 2;\r\n");
      out.write("    margin-bottom: 10px;\r\n");
      out.write("    font-size: 14px;\r\n");
      out.write("    text-align: center;\r\n");
      out.write("    overflow: hidden;\r\n");
      out.write("    text-overflow: ellipsis;\r\n");
      out.write("    white-space: nowrap;\r\n");
      out.write("    -moz-box-sizing: border-box;\r\n");
      out.write("    -webkit-box-sizing: border-box;\r\n");
      out.write("    box-sizing: border-box;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".sign-form #inputEmail,\r\n");
      out.write(".sign-form #inputPassword {\r\n");
      out.write("    direction: ltr;\r\n");
      out.write("    height: 44px;\r\n");
      out.write("    font-size: 16px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".sign-form input[type=email],\r\n");
      out.write(".sign-form input[type=password],\r\n");
      out.write(".sign-form input[type=text],\r\n");
      out.write(".sign-form button {\r\n");
      out.write("    width: 100%;\r\n");
      out.write("    display: block;\r\n");
      out.write("    margin-bottom: 10px;\r\n");
      out.write("    z-index: 1;\r\n");
      out.write("    position: relative;\r\n");
      out.write("    -moz-box-sizing: border-box;\r\n");
      out.write("    -webkit-box-sizing: border-box;\r\n");
      out.write("    box-sizing: border-box;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".sign-form .form-control:focus {\r\n");
      out.write("    border-color: rgb(104, 145, 162);\r\n");
      out.write("    outline: 0;\r\n");
      out.write("    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgb(104, 145, 162);\r\n");
      out.write("    box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgb(104, 145, 162);\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".btn.btn-signin {\r\n");
      out.write("    /*background-color: #4d90fe; */\r\n");
      out.write("    background-color: rgb(104, 145, 162);\r\n");
      out.write("    /* background-color: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));*/\r\n");
      out.write("    padding: 0px;\r\n");
      out.write("    font-weight: 700;\r\n");
      out.write("    font-size: 16px;\r\n");
      out.write("    height: 50px;\r\n");
      out.write("    -moz-border-radius: 1px;\r\n");
      out.write("    -webkit-border-radius: 1px;\r\n");
      out.write("    border-radius: 1px;\r\n");
      out.write("    border: none;\r\n");
      out.write("    -o-transition: all 0.218s;\r\n");
      out.write("    -moz-transition: all 0.218s;\r\n");
      out.write("    -webkit-transition: all 0.218s;\r\n");
      out.write("    transition: all 0.218s;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".btn.btn-signin:hover,\r\n");
      out.write(".btn.btn-signin:active,\r\n");
      out.write(".btn.btn-signin:focus {\r\n");
      out.write("    background-color: rgb(12, 97, 33);\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".forgot-password {\r\n");
      out.write("    color: rgb(104, 145, 162);\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".forgot-password:hover,\r\n");
      out.write(".forgot-password:active,\r\n");
      out.write(".forgot-password:focus{\r\n");
      out.write("    color: rgb(12, 97, 33);\r\n");
      out.write("}\r\n");
      out.write("\t\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<div class=\"container\">\r\n");
      out.write("\t<div class=\"card card-container\">\r\n");
      out.write("\t    <img id=\"profile-img\" class=\"profile-img-card\" src=\"/tonight/img/logo.png\" />\r\n");
      out.write("\t    <p id=\"profile-name\" class=\"profile-name-card\">TONIGHT</p>\r\n");
      out.write("\t    <form action=\"/tonight/login\" method=\"post\" class=\"sign-form\">\r\n");
      out.write("\t        <span id=\"reauth-email\" class=\"reauth-email\">오신것을 환영합니다.</span>\r\n");
      out.write("\t        <input type=\"text\" class=\"form-control\" name=\"memberid\" placeholder=\"아이디\" required autofocus>\r\n");
      out.write("\t        <input type=\"password\" class=\"form-control\" name=\"memberpwd\" placeholder=\"패스워드\" required>\r\n");
      out.write("\t\r\n");
      out.write("\t        <button class=\"btn btn-lg btn-primary btn-block btn-signin\" type=\"submit\">로그인</button>\r\n");
      out.write("\t    </form><!-- /form -->\r\n");
      out.write("\t    <a href=\"#\" class=\"forgot-password\">\r\n");
      out.write("\t\t\t아이디/패스워드 찾기\r\n");
      out.write("\t    </a>\r\n");
      out.write("\t    <a href=\"/tonight/views/member/enrollForm.html\" class=\"forgot-password pull-right\">\r\n");
      out.write("\t\t\t회원가입\r\n");
      out.write("\t    </a>\r\n");
      out.write("\t</div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<script src=\"/tonight/js/jquery-3.2.1.min.js\"></script>\r\n");
      out.write("<script src=\"/tonight/js/bootstrap.min.js\"></script>\r\n");
      out.write("<script type ='text/JavaScript'>\r\n");
      out.write("\t");
if(("1").equals(request.getParameter("error"))){
      out.write("\r\n");
      out.write("\t\talert('아이디 또는 비밀번호를 잘못 입력하셨습니다!');\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tlocation.href=\"");
      out.print( request.getRequestURI() );
      out.write("\";\r\n");
      out.write("\t");
 } 
      out.write("\r\n");
      out.write("</script> \r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
