
package com.testengine.bean;
public class User implements java.io.Serializable{
private String username,password,email,mobile,Address,Dob,Fname,Mname,message;

    





public String getname() {
	return username;
}

public void setname(String username) {
	this.username = username;
}


public String getpass() {
	return password;
}

public void setpass(String password) {
	this.password = password;
}

public String getemail() {
	return email;
}

public void setemail(String email) {
	this.email = email;
}

public String getmobile() {
	return mobile;
}

public void setmobile(String mobile) {
	this.mobile = mobile;
}

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getDob() {
        return Dob;
    }

    public void setDob(String Dob) {
        this.Dob = Dob;
    }

    public String getFname() {
        return Fname;
    }

    public void setFname(String Fname) {
        this.Fname = Fname;
    }

    public String getMname() {
        return Mname;
    }

    public void setMname(String Mname) {
        this.Mname = Mname;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

  }
