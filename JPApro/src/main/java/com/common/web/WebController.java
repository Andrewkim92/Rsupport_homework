package com.common.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.common.domain.posts.BoardRepository;
import com.common.domain.posts.BoardVO2;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class WebController {

	private BoardRepository boardVORepo;
	
	@GetMapping("/")
	public String main(Model model,Pageable pageable) {
		
		Page<BoardVO2> voList = boardVORepo.findAll(pageable);
		
		model.addAttribute("voList", voList);
		
		model.addAttribute("curPageNum", pageable.getPageNumber());
		
		int countPage = 4;
		
		int startPage = ((pageable.getPageNumber() - 1) / 5) * 5 + 1;  // 왜 1 을 더할까요?
		int endPage = startPage + countPage - 1;  // 왜 1 을 뺄까요?
		
		if(voList.getTotalPages() >= endPage) {
		
		}else {
			endPage = voList.getTotalPages();
		}
		
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalPages", voList.getTotalPages());
		model.addAttribute("hasNext", voList.hasNext());
		model.addAttribute("hasPrevious", voList.hasPrevious());
		return "home";
	}
	
	@GetMapping("/makeData")
	public String makeData(Model model) {
		
		List<BoardVO2> testVOList = new ArrayList<BoardVO2>();
		for(int i=0; i<20; i++) {
			BoardVO2 testVO = new BoardVO2();
			testVO.setContent("test");
			testVO.setSubject(""+i);
			testVO.setWriter(""+i);
			testVOList.add(testVO);
		}
		
		boardVORepo.saveAll(testVOList);
		
		return "redirect:";
	}
	
	@GetMapping("/writeBoard")
	public String writeBoard(Model model) {
		
		return "boardDetail";
	}

	@RequestMapping(value = "/writeBoardAct", method = RequestMethod.POST)
	public String writeBoardAct(Model model,BoardVO2 vo) {
		
		boardVORepo.save(vo);
		//write 글
		
		return "redirect:";
	}
	
	@RequestMapping(value = "/deleteBoard", method = RequestMethod.POST)
	public String deleteBoard(Model model,BoardVO2 vo) {
		
		System.out.println("id = "+vo.getId());
		boardVORepo.deleteById(vo.getId());
		
		
		return "redirect:";
	}
	
	@GetMapping("/detailBoard")
	public String detailBoard(Model model,int id) {
		
		model.addAttribute("vo", boardVORepo.getOne(id));
		return "boardDetail2";
	}
	
	@GetMapping("/searchBoard")
	public String searchBoard(Model model,BoardVO2 vo,String opt,String condition) {
		
		if(opt.equals("subject")) {
			model.addAttribute("voList", boardVORepo.findBySubjectContaining(condition));
		}else if(opt.equals("wrtier")) {
			model.addAttribute("voList", boardVORepo.findByWriterContaining(condition));
		}else if(opt.equals("modifiedDate")) {
			model.addAttribute("voList", boardVORepo.findBymodifiedDateContaining(condition));
		}else if(opt.equals("createdDate")) {
			model.addAttribute("voList", boardVORepo.findBycreatedDateContaining(condition));
		}else if(opt.equals("content")) {
			model.addAttribute("voList", boardVORepo.findByContentContaining(condition));
		}
		return "home";
	}
	
	@GetMapping("/searchBoardPage")
	public String searchBoardPage(Model model,BoardVO2 vo,String opt,String condition,Pageable pageable) {
		
		if(opt==null) {
			opt="subject";
		}
		
		if(opt.equals("subject")) {
			model.addAttribute("voList", boardVORepo.findFirstBySubjectContaining(condition, pageable));
		}else if(opt.equals("wrtier")) {
			model.addAttribute("voList", boardVORepo.findByWriterContaining(condition));
		}else if(opt.equals("modifiedDate")) {
			model.addAttribute("voList", boardVORepo.findBymodifiedDateContaining(condition));
		}else if(opt.equals("createdDate")) {
			model.addAttribute("voList", boardVORepo.findBycreatedDateContaining(condition));
		}else if(opt.equals("content")) {
			model.addAttribute("voList", boardVORepo.findByContentContaining(condition));
		}else {
			model.addAttribute("voList", null);
		}
		
		return "home";
	}
	
}
