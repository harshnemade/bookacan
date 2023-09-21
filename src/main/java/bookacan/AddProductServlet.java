package bookacan;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.sql.*;
 
@WebServlet("/AddProductServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)   // 50MB
public class AddProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();	
		try{
		    String appPath = request.getServletContext().getRealPath("/");
	
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/water","root","");
	
			int pid = Integer.parseInt(request.getParameter("pid"));
			String proddesc = request.getParameter("proddesc");
			float rate = Float.parseFloat(request.getParameter("rate"));
			int qty = Integer.parseInt(request.getParameter("qty"));
			int suppid = Integer.parseInt(request.getParameter("sid"));
			
			PreparedStatement ps = con.prepareStatement(
				"insert into product(pname,price,qty_in_hand,suppid) values(?,?,?,?)");
	
			ps.setString(1,proddesc);
			ps.setFloat(2,rate);
			ps.setInt(3,qty);
			ps.setInt(4, suppid);
			ps.executeUpdate();
	
			for (Part part : request.getParts()) {
				String fileName = extractFileName(part);
	
			    if(!fileName.equals("")){
			    	part.write(appPath + "images/"+pid+".jpg");
			    }
			}
	
			response.sendRedirect("add_products.jsp");
		}
		catch(Exception e){
			out.println("<h4>"+e+"</h4>");
		}	
    }
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }
}
