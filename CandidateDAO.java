
package evoting.dao;

import evoting.dbutil.DBConnection;
import evoting.dto.CandidateDTO;
import evoting.dto.CandidateDetails;
import evoting.dto.CandidateInfo;
import evoting.dto.Candidatepojo;
import evoting.dto.UpdateCandidateDTO;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;

/**
 *
 * @author Keshri
 */
public class CandidateDAO {
    private static PreparedStatement ps1,ps2,ps3,ps4,ps5,ps6,ps7,ps8,ps9;
    private static Statement st1,st2,st3;
    static
    {
       try{
           st1=DBConnection.openDBConnection().createStatement();
           ps1=DBConnection.openDBConnection().prepareStatement("select username from user_details where adhar_no=?");
           st2=DBConnection.openDBConnection().createStatement();
           ps2=DBConnection.openDBConnection().prepareStatement("insert into candidate values(?,?,?,?,?)");
           st3=DBConnection.openDBConnection().createStatement();
           ps3=DBConnection.openDBConnection().prepareStatement("select * from candidate where candidate_id=?");
           ps4=DBConnection.openDBConnection().prepareStatement("update candidate set party=?,city=?,symbol=? where candidate_id=?");
           ps5=DBConnection.openDBConnection().prepareStatement("delete from candidate where candidate_id=?");
           ps6=DBConnection.openDBConnection().prepareStatement("select candidate_id,username,party,symbol from candidate,user_details where candidate.user_id=user_details.adhar_no and candidate.city=(select city from user_details where adhar_no=?)");
           ps7=DBConnection.openDBConnection().prepareStatement("select party,symbol from candidate where party=?");
           ps8=DBConnection.openDBConnection().prepareStatement("select adhar_no from  user_details where user_type='Voter' and adhar_no not in(select user_id from candidate)");
           ps9=DBConnection.openDBConnection().prepareStatement("select candidate_id from candidate where party=? and city=?");
       }
       
       catch(SQLException ex){
           ex.printStackTrace();
       }
    }
    public static String getNewId()throws SQLException
    {
        ResultSet rs=st1.executeQuery("select max(candidate_id) from candidate");
        rs.next();
        String cid=rs.getString(1);
        if(cid==null)
            return "C101";
        else
        {
            
            int id=Integer.parseInt(cid.substring(1));
            return "C"+(id+1);
        }
       
    }

    public static String getUserNameById(String uid)throws SQLException
    {
        ps1.setString(1,uid);        
        ResultSet rs=ps1.executeQuery();
        if(rs.next())
        {
            return rs.getString(1);  
        }
        else
            return null;
    }
    public static ArrayList<String> getCity()throws SQLException
    {
        ArrayList<String> cityList=new ArrayList<>();
        ResultSet rs=st2.executeQuery("select distinct city from user_details");
        while(rs.next())
        {
            cityList.add(rs.getString(1));
        }
        return cityList;
    }
    public static boolean addCandidate(CandidateDTO candidate) throws SQLException
    {
        ps2.setString(1, candidate.getCandidateId());
        ps2.setString(2, candidate.getParty());
        ps2.setString(3, candidate.getUserid());
        ps2.setBinaryStream(4, candidate.getSymbol());
        ps2.setString(5, candidate.getCity());
        return ps2.executeUpdate()!=0;
    }
    public static ArrayList<String> getAllCandidateIds()throws SQLException
    {
      ResultSet rs=st3.executeQuery("select candidate_id from candidate");
      ArrayList<String> can_id=new ArrayList<>();
      while(rs.next())
      {
          can_id.add(rs.getString(1));
      }
      return can_id;
    }
    public static CandidateDetails getDetailsById(String cid)throws SQLException,IOException
    {
        ps3.setString(1, cid);
        ResultSet rs=ps3.executeQuery();
        CandidateDetails cdetails=new CandidateDetails();
        Blob blob;
        InputStream inputStream;
        byte[] buffer;
        byte[] imageBytes;
        int bytesRead;
        String base64Image;
        ByteArrayOutputStream outputStream;
        if(rs.next())
        {
            blob=rs.getBlob(4);
            inputStream=blob.getBinaryStream();
            outputStream=new ByteArrayOutputStream();
            buffer=new byte[4096];
            bytesRead=-1;
            while((bytesRead=inputStream.read(buffer))!=-1)
                    {
                        outputStream.write(buffer, 0, bytesRead);
                    }
            imageBytes=outputStream.toByteArray();
            Base64.Encoder en=Base64.getEncoder();
            base64Image=en.encodeToString(imageBytes);
            cdetails.setSymbol(base64Image);
            cdetails.setCandidateId(cid);
            cdetails.setCanididateName(getUserNameById(rs.getString(3)));
            cdetails.setParty(rs.getString(2));
            cdetails.setUserId(rs.getString(3));
            cdetails.setCity(rs.getString(5));
        }
        return cdetails;
    }
    public static boolean updateCandidate(UpdateCandidateDTO candidate)throws SQLException
    {
       ps4.setString(1, candidate.getParty());
       ps4.setString(2,candidate.getCity());
       ps4.setBinaryStream(3,candidate.getSymbol());
       ps4.setString(4,candidate.getCandidateId());
        return ps4.executeUpdate()!=0;
    }
    public static boolean removeCandidate(CandidateDTO candidate)throws SQLException
    {
       ps5.setString(1, candidate.getCandidateId());
        return ps5.executeUpdate()!=0;
    }
    public static ArrayList<CandidateInfo> viewCandidate(String userId)throws SQLException, IOException
    {
        ArrayList<CandidateInfo>candidateList=new ArrayList<>();
        ps6.setString(1, userId);
        ResultSet rs=ps6.executeQuery();
        Blob blob ;
        InputStream inputStream;
        ByteArrayOutputStream outputStream;
        byte[] buffer;
        int bytesRead;
        byte[] imageBytes;
        String base64Image;
        while(rs.next())
        {
            blob=rs.getBlob(4);
            inputStream = blob.getBinaryStream();
            outputStream = new ByteArrayOutputStream();
            buffer = new byte[4096];
            bytesRead = -1;
             while ((bytesRead = inputStream.read(buffer)) != -1) {
            outputStream.write(buffer, 0, bytesRead);                  
                }
             imageBytes = outputStream.toByteArray();
             base64Image = Base64.getEncoder().encodeToString(imageBytes);
            CandidateInfo candidate=new CandidateInfo();
            candidate.setCandidateId(rs.getString(1));
            candidate.setCandidateName(rs.getString(2));
            candidate.setParty(rs.getString(3));
            candidate.setSymbol(base64Image);
            candidateList.add(candidate);
        }
        return candidateList;
    }
    
    public static Candidatepojo getCandidateInfo(String party) throws Exception
    {
        ps7.setString(1, party);
        ResultSet rs=ps7.executeQuery();
        Candidatepojo cp=new Candidatepojo();
        Blob blob;
        InputStream inputStream;
        byte[] buffer;
        byte[] imageBytes;
        int bytesRead;
        String base64Image;
        ByteArrayOutputStream outputStream;
        if(rs.next())
        {
            blob=rs.getBlob(2);
            inputStream=blob.getBinaryStream();
            outputStream=new ByteArrayOutputStream();
            buffer=new byte[4096];
            bytesRead=-1;
            while((bytesRead=inputStream.read(buffer))!=-1)
                    {
                        outputStream.write(buffer, 0, bytesRead);
                    }
            imageBytes=outputStream.toByteArray();
            Base64.Encoder en=Base64.getEncoder();
            base64Image=en.encodeToString(imageBytes);
            cp.setSymbol(base64Image);
            cp.setParty(rs.getString(1));
        }
        return cp;
    }
    
    public static ArrayList<String> loadAdharId() throws SQLException
    {
        ArrayList<String> adharList=new ArrayList<>();
        ResultSet rs=ps8.executeQuery();
        while(rs.next())
        {
            adharList.add(rs.getString(1));
        }
        return adharList;
    }
    
    public static boolean searchCandidate(String party,String city)throws SQLException
    {
        ps9.setString(1, party);
        ps9.setString(2, city);
        ResultSet rs=ps9.executeQuery();
        if(rs.next())
        {
             String cid=rs.getString(1);
             return false;
        }
        return true;
    }
}
