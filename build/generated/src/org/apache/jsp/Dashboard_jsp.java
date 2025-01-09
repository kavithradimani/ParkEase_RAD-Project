package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Connection;
import classes.DBConnector;

public final class Dashboard_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<script src=\"Dash.js\"></script>\n");
      out.write("\n");
  
     int vehicleOwnerCount = 0;
    int inChargeOperatorCount = 0;

    try {
        Connection connection = DBConnector.getConnection();

        
        PreparedStatement vehicleOwnerStmt = connection.prepareStatement("SELECT COUNT(*) FROM user WHERE user_role = 'customer'");
        ResultSet vehicleOwnerResult = vehicleOwnerStmt.executeQuery();
        if (vehicleOwnerResult.next()) {
            vehicleOwnerCount = vehicleOwnerResult.getInt(1);
        }

       
        PreparedStatement inChargeOperatorStmt = connection.prepareStatement("SELECT COUNT(*) FROM User WHERE user_role = 'in charge operator'");
        ResultSet inChargeOperatorResult = inChargeOperatorStmt.executeQuery();
        if (inChargeOperatorResult.next()) {
            inChargeOperatorCount = inChargeOperatorResult.getInt(1);
        }

        connection.close();

    } catch (Exception e) {
        e.printStackTrace();
    }


      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("  <meta charset=\"UTF-8\">\n");
      out.write("  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("<link href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css\" rel=\"stylesheet\" id=\"bootstrap-css\">\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"Dashboard.css\">\n");
      out.write("<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js\"></script>\n");
      out.write("<script src=\"https://kit.fontawesome.com/b0ede3d087.js\" crossorigin=\"anonymous\"></script>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("<div id=\"throbber\" style=\"display:none; min-height:120px;\"></div>\n");
      out.write("<div id=\"noty-holder\"></div>\n");
      out.write("<div id=\"wrapper\">\n");
      out.write("    <!-- Navigation -->\n");
      out.write("    <nav class=\"navbar navbar-inverse navbar-fixed-top\" role=\"navigation\">\n");
      out.write("        \n");
      out.write("        <div class=\"navbar-header\">\n");
      out.write("            <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\".navbar-ex1-collapse\">\n");
      out.write("                <span class=\"sr-only\">Toggle navigation</span>\n");
      out.write("                <span class=\"icon-bar\"></span>\n");
      out.write("                <span class=\"icon-bar\"></span>\n");
      out.write("                <span class=\"icon-bar\"></span>\n");
      out.write("            </button>\n");
      out.write("            \n");
      out.write("            <div class=\"heading\">\n");
      out.write("                <h1>PARKEASE</h1>\n");
      out.write("             </div>\n");
      out.write("        </div>\n");
      out.write("       \n");
      out.write("        \n");
      out.write("        <!-- Sidebar Menu Items -->\n");
      out.write("        <div class=\"collapse navbar-collapse navbar-ex1-collapse\">\n");
      out.write("            <ul class=\"nav navbar-nav side-nav\">\n");
      out.write("                <li>\n");
      out.write("                    <a href=\"Dashboard.jsp\" data-toggle=\"collapse\" data-target=\"#submenu-1\"><i class=\"fas fa-tachometer-alt-average\"></i></i></i> DASHBOARD </a>\n");
      out.write("                    \n");
      out.write("                </li>           \n");
      out.write("                \n");
      out.write("                <li>\n");
      out.write("                    <a href=\"assignParking.jsp\"><i class=\"fa fa-fw fa-user-plus\"></i> IN CHARGE OPERATOR</a>\n");
      out.write("                </li>\n");
      out.write("\n");
      out.write("                <li>\n");
      out.write("                  <a href=\"User.jsp\"><i class=\"fa fa-fw fa-user-plus\"></i> VEHICLE OWNERS</a>\n");
      out.write("              </li>\n");
      out.write("                \n");
      out.write("              <button class=\"btn btn-danger\" type=\"submit\" name=\"logout\" >LOGOUT</button>\n");
      out.write("            </ul>\n");
      out.write("\n");
      out.write("           \n");
      out.write("        </div>\n");
      out.write("       \n");
      out.write("    </nav>\n");
      out.write("\n");
      out.write("    <div id=\"page-wrapper\">\n");
      out.write("        <div class=\"container-fluid\">\n");
      out.write("            <!-- Page Heading -->\n");
      out.write("            <div class=\"row\" id=\"main\" >\n");
      out.write("                <div class=\"col-sm-12 col-md-12 well\" id=\"content\">\n");
      out.write("                    <h1>Welcome to ParkEase!</h1>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <!--vehicle owners-->\n");
      out.write("    <div class=\"container bootstrap snippet\">\n");
      out.write("  <div class=\"row\">\n");
      out.write("    <div class=\"col-lg-2 col-sm-6\">\n");
      out.write("      <div class=\"circle-tile \">\n");
      out.write("        <a href=\"User.jsp\"><div class=\"circle-tile-heading dark-blue\"><i class=\"fa fa-users fa-fw fa-3x\"></i></div></a>\n");
      out.write("        <div class=\"circle-tile-content dark-blue\">\n");
      out.write("          <div class=\"circle-tile-description text-faded\"> Vehicle <br> Owners</div>\n");
      out.write("          <div class=\"circle-tile-number text-faded \">");
      out.print( vehicleOwnerCount );
      out.write("</div>\n");
      out.write("         \n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("     \n");
      out.write("<!--incharge operators-->\n");
      out.write("    <div class=\"col-lg-2 col-sm-6\">\n");
      out.write("      <div class=\"circle-tile \">\n");
      out.write("        <a href=\"assignParking.jsp\"><div class=\"circle-tile-heading red\"><i class=\"fa fa-users fa-fw fa-3x\"></i></div></a>\n");
      out.write("        <div class=\"circle-tile-content red\">\n");
      out.write("          <div class=\"circle-tile-description text-faded\"> In Charge <br> Operators </div>\n");
      out.write("          <div class=\"circle-tile-number text-faded \">");
      out.print( inChargeOperatorCount );
      out.write("</div>\n");
      out.write("         \n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div> \n");
      out.write("  </div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<!--footer-->\n");
      out.write("<footer>\n");
      out.write("    <div class=\"footer-content\">\n");
      out.write("      <p> Copyright© ParkEase | 2023. All rights reserved.</p>\n");
      out.write("    </div>\n");
      out.write("  </footer>\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
