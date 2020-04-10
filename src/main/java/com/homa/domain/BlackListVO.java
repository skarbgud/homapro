package com.homa.domain;

public class BlackListVO {

   private int black_num;
   private String userId;
   private String userName;
   
   public int getBlack_num() {
      return black_num;
   }
   public void setBlack_num(int black_num) {
      this.black_num = black_num;
   }
   public String getUserId() {
      return userId;
   }
   public void setUserId(String userId) {
      this.userId = userId;
   }
   public String getUserName() {
      return userName;
   }
   public void setUserName(String userName) {
      this.userName = userName;
   }
}