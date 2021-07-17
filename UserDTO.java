
package evoting.dto;

/**
 *
 * @author Keshri
 */
public class UserDTO {
    private String userid;
    private String password;

    @Override
    public String toString() {
        return "UserDTO{" + "userid=" + userid + ", password=" + password + '}';
    }

    public UserDTO(String userid, String password) {
        this.userid = userid;
        this.password = password;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}
