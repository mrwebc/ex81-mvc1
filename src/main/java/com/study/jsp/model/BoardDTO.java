package com.study.jsp.model;

import java.sql.Date;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class BoardDTO{  
  private int seq;
  private String title;
  private String nickname;
  private String content;
  private Date regdate;
  private int cnt;
  private String userid;
}


