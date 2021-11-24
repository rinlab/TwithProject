package com.twith.domain;

import lombok.Data;

@Data
public class RecruitDTO {
   private int recruitnum;
   private String recruittitle;
   private String userid;
   private String recruitcontents;
   private int readcnt;
   private int moimnum;
   private String regdate;
}