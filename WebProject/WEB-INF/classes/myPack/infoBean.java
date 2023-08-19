package myPack;

public class infoBean implements java.io.Serializable{


    private String username;
    private String password;
    private String email;
    private String phone;
    private String type;


    public infoBean() {

    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUsername() {
        return username;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    public String getPassword() {
        return password;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }
   
    public void setPhone(String phone) {
        this.phone=phone;
    }
    
    public String getPhone() {
        return phone;
    }
   
    public void setType(String type) {
        this.type = type;
    }
    
    public String getType() {
        return type;
    }

   
}