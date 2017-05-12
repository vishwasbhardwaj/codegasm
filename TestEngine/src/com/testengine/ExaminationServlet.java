package com.testengine;

import java.io.IOException;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/ExaminationServlet")
public class ExaminationServlet extends HttpServlet 
{
    private static final long serialVersionUID = 1L;
    private ServletConfig config;
    String Page="Examination.jsp";
    public ExaminationServlet() 
    {
        super();
    }
    public void init(ServletConfig config) throws ServletException
    {
        this.config=config;
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        String msg="No More Questions";
        HttpSession ses=request.getSession(true);
        String subject=(String)ses.getAttribute("sub");
        Connection con=null;
        ResultSet rs=null;
        int c=0;
        PreparedStatement pstmt=null;
        response.setContentType("text/html");
        List qlist=new ArrayList();
        try
        {
         
            con=ConnectionProvider.getCon();
            pstmt=con.prepareStatement("SELECT * from questions where lang=?");
            pstmt.setString(1,subject);
            pstmt.executeQuery();
            rs=pstmt.getResultSet();
            while(rs.next())
            {
                qlist.add(rs.getInt(8));
                qlist.add(rs.getString(2));
                qlist.add(rs.getString(7));
                qlist.add(rs.getString(3));
                qlist.add(rs.getString(4));
                qlist.add(rs.getString(5));
                qlist.add(rs.getString(6));
            }
             HttpSession sess=request.getSession(true);
             String sesid=sess.getId();
             sess.setAttribute("qlist",qlist);
              
             RequestDispatcher rd=request.getRequestDispatcher(Page);
             System.out.println(sesid);
             System.out.println(subject);
             if(rd !=null)
             {
                 rd.forward(request, response);
             }
              
         rs.close();
         pstmt.close();
         con.close();
        }
        catch(SQLException sqle)
         {
             System.out.println("SQL Error");
         }
     
          
        try
        {
            HttpSession sess=request.getSession();
            String sesid=sess.getId();
           
            con=ConnectionProvider.getCon();
            String name=request.getParameter("fname");
            String qid=request.getParameter("qid");
            String corans=request.getParameter("corans");
            String option=request.getParameter("option");
            pstmt=con.prepareStatement("INSERT INTO result (username,QID,Answer,seloption,sessid) values(?,?,?,?,?)");
            pstmt.setString(1,name);
            pstmt.setString(2,qid);
            pstmt.setString(3,corans);
            pstmt.setString(4,option);
            pstmt.setString(5,sesid);
             
            c=pstmt.executeUpdate();
            System.out.println(name);
            System.out.println(qid);
            System.out.println(corans);
            System.out.println(option);
            System.out.println(sesid);
             rs.close();
             pstmt.close();
             con.close();
        }
        catch(SQLException sqle)
         {
             System.out.println("SQL Error");
         }
    }
     
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        doGet(request,response);
    }
 
}
