package com.tutorialspoint.struts2;

import java.util.*;

public class HelloDate {
   private Date currentDate;
   
   public String execute() throws Exception{
      setCurrentDate(new Date());
      return "success";
   }
   public void setCurrentDate(Date date){
      this.currentDate = date;
   }
   public Date getCurrentDate(){
      return currentDate;
   }
}