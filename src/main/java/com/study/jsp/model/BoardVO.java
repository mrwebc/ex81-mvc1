package com.study.jsp.model;

import java.io.Serializable;
import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
//mapper.xml 에서 캐시를 사용할 경우 Serializable 이어야 한다.
//Serializable - 데이터를 한 시스템에서 다른 시스템이나 네트워크로 전송하거나 데이터를 파일에 저장할 때, 그 데이터를 전송가능한 형태로 변환해야 할때 상속받는 인터페이스
public class BoardVO implements Serializable{

  private static final long serialVersionUID = 1L;
  
  private int seq;
	private String title;
	private String nickname;
	private String content;
	private Date regdate;
	private int cnt;
	private String userid;
}


