/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
 * Generated at: 2017-10-25 01:53:13 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.views.accom;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import accom.model.vo.Accommodation;
import java.util.ArrayList;
import member.model.vo.Member;

public final class accomListView_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/views/accom/../includes/footer.jsp", Long.valueOf(1508895001737L));
    _jspx_dependants.put("/views/accom/../includes/header.jsp", Long.valueOf(1508895001740L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("accom.model.vo.Accommodation");
    _jspx_imports_classes.add("member.model.vo.Member");
    _jspx_imports_classes.add("java.util.ArrayList");
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

	ArrayList<Accommodation> list = (ArrayList<Accommodation>)request.getAttribute("list");
	int listCount = ((Integer)request.getAttribute("listCount")).intValue();
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
	int startPage = ((Integer)request.getAttribute("startPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>accomListView</title>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\tfunction showWriteAccom(){\r\n");
      out.write("\t\tlocation.href = \"views/accom/accomWriteForm.jsp\";\r\n");
      out.write("\t}\r\n");
      out.write("</script>\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("\t.jumbotron {\r\n");
      out.write("\t\tmargin-bottom: 0px;\r\n");
      out.write("\t    background-image: url(img/jumbotronbackground.jpg);\r\n");
      out.write("\t    background-position: 0% 25%;\r\n");
      out.write("\t    background-size: cover;\r\n");
      out.write("\t    background-repeat: no-repeat;\r\n");
      out.write("\t    color: white !important;\r\n");
      out.write("\t    min-height: 100px;\r\n");
      out.write("\t}\r\n");
      out.write("\t.jumbotron > div {\r\n");
      out.write("\t\tmargin-top: 30px;\r\n");
      out.write("\t}\r\n");
      out.write("\t.container-fluid {\r\n");
      out.write("\t\tmax-width: 1280px;\r\n");
      out.write("\t}\r\n");
      out.write("\t.col-sm-4 > #title {\r\n");
      out.write("\t\tfont-weight: bold; \r\n");
      out.write("\t\twhite-space: nowrap;\r\n");
      out.write("\t\toverflow: hidden;\r\n");
      out.write("\t\ttext-overflow: ellipsis;\r\n");
      out.write("\t\ttext-align: left;\r\n");
      out.write("\t}\r\n");
      out.write("\t.col-sm-4 > .else {\r\n");
      out.write("\t\twhite-space: nowrap;\r\n");
      out.write("\t\toverflow: hidden;\r\n");
      out.write("\t\ttext-overflow: ellipsis;\r\n");
      out.write("\t\ttext-align: left !important;\r\n");
      out.write("\t}\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write('\r');
      out.write('\n');
 Member member = (Member)session.getAttribute("member"); 
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"ko\">\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"/tonight/css/bootstrap.min.css\">\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("\t.navbar {\r\n");
      out.write("\t\tbackground-color: transparent;\r\n");
      out.write("\t\tborder-color: transparent;\r\n");
      out.write("\t}\r\n");
      out.write("\t.navbar:hover {\r\n");
      out.write("\t\tbackground-color: black !important;\r\n");
      out.write("\t}\r\n");
      out.write("\t.navbar a {\r\n");
      out.write("\t    color: white !important;\r\n");
      out.write("\t}\r\n");
      out.write("\t.navbar a:hover { color: red !important; }\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t@media (min-width: 768px) {\r\n");
      out.write("\t  .navbar-nav.navbar-center {\r\n");
      out.write("\t    position: absolute;\r\n");
      out.write("\t    left: 50%;\r\n");
      out.write("\t    transform: translatex(-50%);\r\n");
      out.write("\t  }\r\n");
      out.write("\t  #mobile-logo {\r\n");
      out.write("\t  \tdisplay: none !important;\r\n");
      out.write("\t  \tvisibility: hidden !important;\r\n");
      out.write("\t  }\r\n");
      out.write("\t}\r\n");
      out.write("\t@media (max-width: 767px) {\r\n");
      out.write("\t  #logo {\r\n");
      out.write("\t  \tdisplay: none !important;\r\n");
      out.write("\t  \tvisibility: hidden !important;\r\n");
      out.write("\t  }\r\n");
      out.write("\t  \r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<nav class=\"navbar navbar-default navbar-fixed-top\">\r\n");
      out.write("  <div class=\"container-fluid\">\r\n");
      out.write("    <div class=\"navbar-header\">\r\n");
      out.write("      <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\".navbar-collapse\">\r\n");
      out.write("        <span class=\"icon-bar\"></span>\r\n");
      out.write("        <span class=\"icon-bar\"></span>\r\n");
      out.write("        <span class=\"icon-bar\"></span>                        \r\n");
      out.write("      </button>\r\n");
      out.write("      <a class=\"navbar-brand\" id=\"mobile-logo\"href=\"/tonight/index.jsp\"><img width=\"30\" src=\"/tonight/img/logo.png\"></a>\r\n");
      out.write("    </div>\r\n");
      out.write("    \r\n");
      out.write("    <div class=\"collapse navbar-collapse\">\r\n");
      out.write("      <ul class=\"nav navbar-nav navbar-center\">\r\n");
      out.write("        <li><a href=\"#\">인기</a></li>\r\n");
      out.write("        <li><a href=\"/tonight/tlist\">여행&nbsp;&nbsp;&nbsp;&nbsp;</a></li>\r\n");
      out.write("        <li><a id=\"logo\" class=\"navbar-brand\" href=\"/tonight/index.jsp\"><img width=\"65\" src=\"/tonight/img/logo.png\"></a>\r\n");
      out.write("        <li><a href=\"/tonight/alist\">숙소</a></li>\r\n");
      out.write("        <li><a href=\"/tonight/views/customerservice/serviceListView.jsp\">고객센터</a></li>\r\n");
      out.write("      </ul>\r\n");
      out.write("      <ul class=\"nav navbar-nav navbar-right\">\r\n");
      out.write("      \t");
 if(member == null) { 
      out.write("\r\n");
      out.write("        \t<li><a href=\"/tonight/views/member/loginForm.jsp\">로그인&nbsp;&nbsp;</a></li>\r\n");
      out.write("        ");
 } else { 
      out.write("\r\n");
      out.write("        \t<li><a href=\"minfo?memberid=");
      out.print( member.getMemberId() );
      out.write("\">마이페이지</a></li>\r\n");
      out.write("        \t<li><a href=\"/tonight/logout\">로그아웃&nbsp;&nbsp;</a></li>\r\n");
      out.write("        ");
 } 
      out.write("\r\n");
      out.write("        </ul>\r\n");
      out.write("    </div>\r\n");
      out.write("  </div>\r\n");
      out.write("</nav>\r\n");
      out.write("<div id=\"startchange\"></div>\r\n");
      out.write("\r\n");
      out.write("<script src=\"/tonight/js/jquery-3.2.1.min.js\"></script>\r\n");
      out.write("<script src=\"/tonight/js/bootstrap.min.js\"></script>\r\n");
      out.write("<script>\r\n");
      out.write("\t$(function(){\r\n");
      out.write("\t\tvar scroll_start = 0;\r\n");
      out.write("\t\tvar startchange = $('#startchange');\r\n");
      out.write("\t\tvar offset = startchange.offset();\r\n");
      out.write("\r\n");
      out.write("\t\tif (startchange.length){\r\n");
      out.write("\t\t\t$(document).scroll(function() { \r\n");
      out.write("\t\t\t\tscroll_start = $(this).scrollTop();\r\n");
      out.write("\t\t\t\tif(scroll_start > offset.top) {\r\n");
      out.write("\t\t\t\t\t$('.navbar').css('background-color', 'rgba(0, 0, 0, 0.7)');\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\telse {\r\n");
      out.write("\t\t\t\t\t$('.navbar').css('background-color', 'transparent');\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t}\r\n");
      out.write("\t});\r\n");
      out.write("</script>\r\n");
      out.write("<script src=\"/tonight/js/jquery-3.2.1.min.js\"></script>\r\n");
      out.write("<script src=\"/tonight/js/bootstrap.min.js\"></script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
      out.write("\r\n");
      out.write("<div class=\"jumbotron\">\r\n");
      out.write("  <div class=\"container text-center\">\r\n");
      out.write("    <h3>강원도 숙소</h3>      \r\n");
      out.write("    <p>가나다라마바사아자차카타파하</p>\r\n");
      out.write("  </div>\r\n");
      out.write("</div>\r\n");
      out.write("<div align=\"center\">\r\n");
      out.write("\t<form action=\"/tonight/asearch\" method=\"post\">\r\n");
      out.write("\t<input type=\"search\" autocomplete name=\"keyword\" length=\"50\"> &nbsp;\r\n");
      out.write("\t<input type=\"submit\" value=\"숙소검색\">\r\n");
      out.write("\t</form>\r\n");
      out.write("</div>\r\n");
      out.write("<div class=\"container-fluid bg-3 text-center\">\r\n");
      out.write("\t<br><br>\r\n");
      out.write("\t");
 int cnt = 0; 
      out.write('\r');
      out.write('\n');
      out.write('	');

		for(Accommodation a : list){
	
      out.write("\r\n");
      out.write("\t\t<div class=\"col-sm-4\">\r\n");
      out.write("\t\t\t\t<a href=\"/tonight/adetail?accomId=");
      out.print( a.getAccId() );
      out.write("&page=");
      out.print( currentPage );
      out.write("\"><img src=\"");
      out.print( a.getAccImagePath() );
      out.write("\" class=\"img-responsive\" style=\"width:100%\" alt=\"Image\"></a>\r\n");
      out.write("\t\t\t\t<p id=\"title\">");
      out.print( a.getAccName() );
      out.write("</p>\r\n");
      out.write("\t\t\t\t<p class=\"else\">");
      out.print( a.getAccAddress() );
      out.write("</p>\r\n");
      out.write("\t\t\t\t<p class=\"else\">");
      out.print( a.getAccRank() );
      out.write("</p>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t    ");
 
	    	cnt++;
	    	if(cnt % 3 == 0) { 
	    
      out.write("\r\n");
      out.write("\t    \t<br><br>\r\n");
      out.write("\t    ");
 } 
      out.write("\r\n");
      out.write("    ");
 } 
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<br>\r\n");
      out.write("\r\n");
      out.write("<div align=\"center\">\r\n");
      out.write('\r');
      out.write('\n');
 if(currentPage <= 1){ 
      out.write("\r\n");
      out.write("\t[이전] &nbsp;\r\n");
 }else{ 
      out.write("\r\n");
      out.write("\t<a href=\"/tonight/alist?page=");
      out.print( currentPage - 1 );
      out.write("\">[이전]</a>\r\n");
 } 
      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');
 for(int p = startPage; p <= endPage; p++){ 
	if(p == currentPage){

      out.write("\r\n");
      out.write("\t<b><font size=\"4\" color=\"blue\">[");
      out.print( p );
      out.write("]</font></b>\r\n");
     }else{ 
      out.write("\r\n");
      out.write("\t<a href=\"/tonight/alist?page=");
      out.print( p );
      out.write('"');
      out.write('>');
      out.print( p );
      out.write("</a>\r\n");
 }} 
      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');
 if(currentPage >= maxPage){ 
      out.write("\r\n");
      out.write("\t[다음]\r\n");
 }else{ 
      out.write("\r\n");
      out.write("\t<a href=\"/tonight/alist?page=");
      out.print( currentPage + 1 );
      out.write("\">[다음]</a>\r\n");
 } 
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("<br>\r\n");
 if(member != null){ 
      out.write("\r\n");
      out.write("\t<div align=\"center\">\r\n");
      out.write("\t<button class=\"btn btn-outline-secondary\" onclick=\"showWriteAccom();\">숙소추가</button>\r\n");
      out.write("\t</div>\r\n");
 } 
      out.write("\r\n");
      out.write("<br><br><br>\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"/tonight/css/style.css\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<footer class=\"container-fluid text-center\">\r\n");
      out.write("\t<address>tonight</address>\r\n");
      out.write("\t<small>ⓒ  Gangnam Station Exit 10</small>\r\n");
      out.write("</footer>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
      out.write("\r\n");
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