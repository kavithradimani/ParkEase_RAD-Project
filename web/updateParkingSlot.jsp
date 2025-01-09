<%-- 
    Author     : KAVITHRA
--%>

<%@page import="admin.classes.ParkingSlot" %>
<%@page import="admin.classes.ParkingSlotDAO" %>
<%@page import="javax.servlet.http.HttpServletRequest" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
   String slotID = request.getParameter("slotID");
    String availability = request.getParameter("availability");
    String vehicleType = request.getParameter("vehicleType");
    String reservedData = request.getParameter("reservedData");
    

    ParkingSlot parkingSlot = new ParkingSlot(slotID, availability, vehicleType, reservedData);

    ParkingSlotDAO parkingSlotDAO = new ParkingSlotDAO();
    parkingSlotDAO.updateParkingSlot(parkingSlot);
%>


