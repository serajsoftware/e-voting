/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package evoting.dao;

import evoting.dbutil.DBConnection;
import evoting.dto.UserDTO;
import evoting.dto.UserInfo;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Keshri
 */
public class UserDAO {
      private static PreparedStatement ps1,ps2,ps3,ps4,ps5;
      
    static{
        try{
            ps1=DBConnection.openDBConnection().prepareStatement("select user_type from user_details where adhar_no=? and password=?");
            ps2=DBConnection.openDBConnection().prepareStatement("select adhar_no,username,gender,email,mobile_no,address,city from user_details where user_type='Voter'");
            ps3=DBConnection.openDBConnection().prepareStatement("select * from user_details where adhar_no=?");
            ps4=DBConnection.openDBConnection().prepareStatement("delete from user_details where adhar_no=?");
            ps5=DBConnection.openDBConnection().prepareStatement("select adhar_no from user_details where user_type='Voter'");
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
    } 
    public static String validateUser(UserDTO user) throws SQLException{
        ps1.setString(1, user.getUserid());
        ps1.setString(2, user.getPassword());
        ResultSet rs=ps1.executeQuery();
        if(rs.next()){
            return rs.getString(1);
        }
        return null;
    }
    public static ArrayList<UserInfo> getAllUserDetails() throws SQLException
    {
        ResultSet rs=ps2.executeQuery();
        ArrayList<UserInfo> userList=new ArrayList<>();
        while(rs.next())
        {
            UserInfo user=new UserInfo();
            user.setAdharNo(rs.getString(1));
            user.setUserName(rs.getString(2));
            user.setGender(rs.getString(3));
            user.setEmailId(rs.getString(4));
            user.setMobileNo(rs.getString(5));
            user.setAddress(rs.getString(6));
            user.setCity(rs.getString(7));
            user.setUserType("Voter");
            userList.add(user);
        }
        return userList;
    }
    public static UserInfo getUserById(String adharid)throws SQLException
    {
        ps3.setString(1, adharid);
        ResultSet rs=ps3.executeQuery();
        UserInfo user=new UserInfo();
        if(rs.next())
        {
            user.setAdharNo(rs.getString(1));
            user.setPassword(rs.getString(2));
            user.setUserName(rs.getString(3));
            user.setAddress(rs.getString(4));
            user.setCity(rs.getString(5));
            user.setEmailId(rs.getString(6));
            user.setMobileNo(rs.getString(7));
            user.setUserType(rs.getString(8));
            user.setGender(rs.getString(9));
            return user;
        }
        return null;
    }
    public static boolean removeUser(UserInfo user)throws SQLException
    {
        ps4.setString(1,user.getAdharNo());
        return (ps4.executeUpdate())!=0;
    }
    
    public static ArrayList<String> getAllAdharNo()throws SQLException
    {
      ResultSet rs=ps5.executeQuery();
      ArrayList<String> adhar=new ArrayList<>();
      while(rs.next())
      {
          adhar.add(rs.getString(1));
      }
      return adhar;
    }
               
}
