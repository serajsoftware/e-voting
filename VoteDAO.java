
package evoting.dao;

import evoting.dbutil.DBConnection;
import evoting.dto.CandidateInfo;
import evoting.dto.VoteDTO;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Base64;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 *
 * @author Keshri
 */
public class VoteDAO {
    private static PreparedStatement ps1,ps2,ps3,ps4,ps5,ps6;
    private static Statement st1;
    static
    {
      try
      {
          ps1=DBConnection.openDBConnection().prepareStatement("select candidate_id from voting where voter_id=?");
          ps2=DBConnection.openDBConnection().prepareStatement("select candidate_id,username,party,symbol from candidate,user_details where candidate.user_id=user_details.adhar_no and candidate.candidate_id=?");
          ps3=DBConnection.openDBConnection().prepareStatement("insert into voting values(?,?)");
          ps4=DBConnection.openDBConnection().prepareStatement("select candidate_id,count(*) as votes_obtain from voting group by candidate_id order by votes_obtain desc");
          ps5=DBConnection.openDBConnection().prepareStatement("select party,count(*) as votecount from candidate,voting where candidate.candidate_id=voting.candidate_id group by party order by votecount desc");
          st1=DBConnection.openDBConnection().createStatement();
          ps6=DBConnection.openDBConnection().prepareStatement("select gender,count(*) as votes from user_details,voting where user_details.adhar_no=voting.voter_id group by gender order by votes desc");
      }
      catch(SQLException ex)
      {
          ex.printStackTrace();
      }
    }
    public static String getCandidateId(String userid)throws SQLException 
    {
        ps1.setString(1, userid);
        ResultSet rs=ps1.executeQuery();
        if(rs.next())
            return rs.getString(1);
       return null;
    }
    public static CandidateInfo getVote(String candidateid)throws SQLException,IOException
    {
        ps2.setString(1, candidateid);
        ResultSet rs=ps2.executeQuery();
        CandidateInfo candidateInfo=new CandidateInfo();
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
            candidateInfo.setSymbol(base64Image);
            candidateInfo.setCandidateId(candidateid);
            candidateInfo.setCandidateName(rs.getString(2));
            candidateInfo.setParty(rs.getString(3));
            
        }
        return candidateInfo;
    }
    public static boolean addVote(VoteDTO voter)throws SQLException
    {
       ps3.setString(1, voter.getCandidateId());
       ps3.setString(2, voter.getVoterId());
       return ps3.executeUpdate()!=0;
    }
    public static Map<String,Integer> getResult() throws SQLException
    {
        Map<String,Integer> result=new LinkedHashMap<>();
        ResultSet rs=ps4.executeQuery();
        while(rs.next())
        {
             result.put(rs.getString(1),rs.getInt(2)); 
        }
        return result;
    }
    public static int getVoteCount()throws SQLException
    {
        ResultSet rs=st1.executeQuery("select count(*) from voting");
        if(rs.next())
            return rs.getInt(1);
        return 0;
    }
    public static Map<String,Integer> getResultByParty() throws SQLException
    {
        Map<String,Integer> result=new LinkedHashMap<>();
        ResultSet rs=ps5.executeQuery();
        while(rs.next())
        {
            result.put(rs.getString(1),rs.getInt(2));
        }
        return result;
    }
    public static Map<String,Integer> getVotesByGender() throws SQLException
    {
        Map<String,Integer> result=new LinkedHashMap<>();
        ResultSet rs=ps6.executeQuery();
        while(rs.next())
        {
            result.put(rs.getString(1),rs.getInt(2));
        }
        return result;
    }
}
