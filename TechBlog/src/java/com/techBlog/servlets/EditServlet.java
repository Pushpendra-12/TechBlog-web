package com.techBlog.servlets;

import com.techBlog.helper.Helper;
import com.techBlog.dao.UserDao;
import com.techBlog.entities.Message;
import com.techBlog.entities.User;
import com.techBlog.helper.ConnectionProvider;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class EditServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");

            // Fetching new data
            String name = request.getParameter("user_name");
            String email = request.getParameter("user_email");
            String password = request.getParameter("user_password");
            String about = request.getParameter("user_about");
            Part part = request.getPart("image");
            String imageName = part.getSubmittedFileName();

            //Getting user from sesson;
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentUser");
            user.setName(name);
            user.setEmail(email);
            user.setPassword(password);
            user.setAbout(about);
            String oldFile = user.getProfile();
            user.setProfile(imageName);

            //Update database
            UserDao dao = new UserDao(ConnectionProvider.getConnection());
            boolean ans = dao.updateUser(user);
            if (ans) {

                String path = request.getRealPath("/") + "profile-pics" + File.separator + user.getProfile();
                
                String pathOldFile = request.getRealPath("/") + "profile-pics" + File.separator +  oldFile;
                
                if(!oldFile.equals("default.png")){
                  Helper.deleteFile(pathOldFile);  
                }
                

                if (Helper.saveFile(part.getInputStream(), path)) {
                    out.println("Updated");
                    Message msg = new Message("Profile  details updated ", "success", "alert-success");
                    session.setAttribute("msg", msg);
                    response.sendRedirect("profile.jsp");

                } else {
                    ////
                    Message msg = new Message("Something went wrong ", "error", "alert-danger");
                    session.setAttribute("msg", msg);
                    response.sendRedirect("profile.jsp");
                }

            } else {
                out.println("Not updated");
                Message msg = new Message("Something went wrong ", "error", "alert-danger");
                session.setAttribute("msg", msg);
                response.sendRedirect("profile.jsp");
            }

            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
