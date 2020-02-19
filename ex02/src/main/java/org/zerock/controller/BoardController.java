package org.zerock.controller;

import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.service.BoaordService;


@Controller
@RequestMapping("/board/*")
@AllArgsConstructor //이것을 이용해 생성자를 만든다
public class BoardController {

	private BoaordService service;
	
//	@GetMapping("/list")
//	public void list(Model model) {
//		System.out.println("여기 들어오는거냐 ??");
//		
//		log.info("list");
//		model.addAttribute("list",service.getList());
//		
//	}
	
	@GetMapping("list")
	public void list(Criteria cri, Model model) {
		//페이징 있는 리스트 !!
		System.out.println("list컨트롤러 들어옴");
		
//		log.info("list : "+cri);
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, 123));
		
		int total  = service.getTotal(cri);
		
		//페이징 전체데이터 개수 처리방법 
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		
	}
	
	
	@GetMapping("/register")
	public void register() {
		//get매핑이면 url에 이름이 jsp이름일경우
		//register.jsp로 이동!!
		
		
	}
	
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		//register.jps에서 post로 넘어온 값들이 title,content,writer의 name이 BoardVO에 변수와 일치시켜서 BoardVO로 매개변수를 받습니다.
		
		
//		log.info("register: "+board);
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());
		
		return "redirect:/board/list";
	}
	
	@GetMapping({"/get","/modify"}) //@ModelAttribute는 Model에 데이터를 지정한 이름으로 담아줌
	public void get(@RequestParam("bno") Long bno,  @ModelAttribute("cri") Criteria cri, Model model) {
		System.out.println("get컨트롤러 들어옴");
		
//		log.info("/get or modify");
		model.addAttribute("board",service.get(bno));
		
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
//		log.info("modify: "+ board);
		System.out.println("modify......post방식");
		
		if(service.modify(board)) {
			rttr.addFlashAttribute("result","sucess");
		}
		
		rttr.addFlashAttribute("pageNum", cri.getPageNum());
		rttr.addFlashAttribute("amount", cri.getAmount());
		
		
		return "redirect:/board/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
//		log.info("remove......");
		
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result","success"); //addFlashAttribute는 redirect처리에 일회성 데이터 전달하기때문에 사용
			
		}
		
		rttr.addFlashAttribute("pageNum", cri.getPageNum());
		rttr.addFlashAttribute("amount", cri.getAmount());
		
		
		return "redirect:/board/list";
	}
	
	
	
	
	
}
