package com.common.domain.posts;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BoardRepository extends JpaRepository<BoardVO2, Integer>{
	
	public List<BoardVO2> findBySubjectLike(String condition);
	public List<BoardVO2> findBySubjectContaining(String condition);
	public List<BoardVO2> findByContentLike(String condition);
	public List<BoardVO2> findByContentContaining(String condition);
	public List<BoardVO2> findByWriterLike(String condition);
	public List<BoardVO2> findByWriterContaining(String condition);
	public List<BoardVO2> findBycreatedDateLike(String condition);
	public List<BoardVO2> findBycreatedDateContaining(String condition);
	public List<BoardVO2> findBymodifiedDateLike(String condition);
	public List<BoardVO2> findBymodifiedDateContaining(String condition);
	
	public Page<BoardVO2> findFirstBySubjectContaining(String condition, Pageable pageable);
}