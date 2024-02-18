package com.study.jsp.srv;

import java.util.ArrayList;
import java.util.List;

import com.study.jsp.model.BoardDTO;
import com.study.jsp.model.BoardVO;
import com.study.jsp.persistence.BoardMapper;

public class BoardServiceImpl implements BoardService {
  
  private BoardMapper dao;
  
  public BoardServiceImpl(BoardMapper dao) {
    this.dao = dao;
  }

  @Override
  public List<BoardDTO> findAll() {   

    //VO->DTO, VO->DTO 변환은 ModelMapper 라이브러리를 이용해서 처리
    List<BoardDTO> list = new ArrayList<BoardDTO>();
    
    for(BoardVO vo : dao.findAll()) {
      
      BoardDTO dto = new BoardDTO();

      dto.setCnt(vo.getCnt());
      dto.setContent(vo.getContent());
      dto.setNickname(vo.getNickname());
      dto.setRegdate(vo.getRegdate());
      dto.setSeq(vo.getSeq());
      dto.setTitle(vo.getTitle());
      dto.setUserid(vo.getUserid());
      
      list.add(dto);
    }
 
    return list;    
  }

  @Override
  public BoardDTO getOne(int seq) {    
    increaseCnt(seq);   
    BoardVO vo = dao.getOne(seq);
    
    BoardDTO dto = new BoardDTO();

    dto.setCnt(vo.getCnt());
    dto.setContent(vo.getContent());
    dto.setNickname(vo.getNickname());
    dto.setRegdate(vo.getRegdate());
    dto.setSeq(vo.getSeq());
    dto.setTitle(vo.getTitle());
    dto.setUserid(vo.getUserid());
    
    return dto;
  }

  @Override
  public int save(BoardDTO dto) { 
    
    //BoardDTODTO 파라미터를 받아서 BoardVO로 변환
    BoardVO vo = new BoardVO();
    
    vo.setContent(dto.getContent());
    vo.setNickname(dto.getNickname());
    vo.setTitle(dto.getTitle());
    vo.setUserid(dto.getUserid());    
    
    int result = dao.save(vo); 

    return result;
  }

  @Override
  public int update(BoardDTO dto) {
    
    BoardVO vo = new BoardVO();
    vo.setSeq(dto.getSeq());
    vo.setContent(dto.getContent());
    vo.setNickname(dto.getNickname());
    vo.setTitle(dto.getTitle());
    vo.setUserid(dto.getUserid()); 
    
    int result = dao.update(vo);       

    return result;
  }

  @Override
  public int delete(int seq) {
    int result = dao.delete(seq);    

    return result;
  }

  @Override
  public int increaseCnt(int seq) {
    int result = dao.increaseCnt(seq);   
    return result;
  }
  
}
