
package evoting.dao;

import evoting.dbutil.DBConnection;
import evoting.dto.UserDetails;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Keshri
 */
public class RegistrationDAO {
    private static PreparedStatement ps,ps1;
    static{
        try{
            ps=DBConnection.openDBConnection().prepareStatement("select * from user_details where adhar_no=?");
            ps1=DBConnection.openDBConnection().prepareStatement("insert into user_details values(?,?,?,?,?,?,?,?,?)");
            
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
    } 
    
    public static boolean searchUser(String userid) throws SQLException{
        ps.setString(1, userid);
        return ps.executeQuery().next();
    }
    public static boolean registerUser(UserDetails ud)throws SQLException{
        ps1.setString(1, ud.getUserid());
        ps1.setString(2, ud.getPassword());
        ps1.setString(3, ud.getUsername());
        ps1.setString(4, ud.getAddress());
        ps1.setString(5, ud.getCity());
        ps1.setString(6,ud.getEmail());
        ps1.setLong(7, ud.getMobile());
        ps1.setString(8, "Voter");
        ps1.setString(9, ud.getGender());
        return ps1.executeUpdate()!=0;
    }
}
