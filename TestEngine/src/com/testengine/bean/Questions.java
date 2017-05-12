package com.testengine.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.testengine.ConnectionProvider;

public class Questions {
    int qid;
    String lang, question,A,B,C,D,Answer,ans="";
	public int getQid() {
		return qid;
	}
	public void setQid(int qid) {
		this.qid = qid;
	}
	public String getLang() {
		return lang;
	}
	public void setLang(String lang) {
		this.lang = lang;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getA() {
		return A;
	}
	public void setA(String a) {
		A = a;
	}
	public String getB() {
		return B;
	}
	public void setB(String b) {
		B = b;
	}
	public String getC() {
		return C;
	}
	public void setC(String c) {
		C = c;
	}
	public String getD() {
		return D;
	}
	public void setD(String d) {
		D = d;
	}
	public String getAnswer() {
		return Answer;
	}
	public void setAnswer(String answer) {
		Answer = answer;
	}
	public String getAns() {
		return ans;
	}
	public void setAns(String ans) {
		this.ans = ans;
	}
    
	public boolean isCorrect()
	{
	  if ( ans != null )
	      return ans.equals(Answer) ;
	  else
	      return false;
    }


    public boolean add()
    {

     Connection con = null;
     PreparedStatement ps = null;
     try
     {
      con = ConnectionProvider.getCon();


      // get next itemid
      ps = con.prepareStatement("insert into questions  values (?,?,?,?,?,?,?)");
      ps.setString(1,lang);
      ps.setString(2,question);
      ps.setString(3,A);
      ps.setString(4,B);
      ps.setString(5,C);
      ps.setString(6,D);
      ps.setString(7,Answer);
      ps.executeUpdate();
      return true;
      }
      catch(Exception ex)
      {
       System.out.println(ex.getMessage());
       return false;
      }
      finally
      {
         ConnectionProvider.clean(con,ps);
      }

   }
}
