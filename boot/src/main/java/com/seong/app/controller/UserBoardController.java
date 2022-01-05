package com.seong.app.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.seong.app.model.area.AreaService;
import com.seong.app.model.area.AreaVO;
import com.seong.app.model.category.CategoryService;
import com.seong.app.model.category.CategoryVO;
import com.seong.app.model.like.LikeService;
import com.seong.app.model.like.LikeVO;
import com.seong.app.model.nation.NationService;
import com.seong.app.model.nation.NationVO;
import com.seong.app.model.reply.ReplyService;
import com.seong.app.model.reply.ReplyVO;
import com.seong.app.model.userboard.PaginationVO;
import com.seong.app.model.userboard.UserBoardService;
import com.seong.app.model.userboard.UserBoardVO;


@Controller
@SessionAttributes("sidebarData")
public class UserBoardController {
	
	@Autowired
	private UserBoardService userboardServiceImpl;
	@Autowired
	private CategoryService categoryServiceImpl; // 교통, 숙소, 맛집 등
	@Autowired
	private NationService nationServiceImpl; // 파리, 영국, 이탈리아 등
	@Autowired
	private AreaService areaServiceImpl; // 유럽, 아시아 등
	@Autowired
	private ReplyService replyServiceImpl; // 댓글
	@Autowired
	private LikeService likeServiceImpl; // 찜
	
	@ModelAttribute("sidebarData")
	public Model getSideBarData(Model model) {
		List<CategoryVO> cateData = categoryServiceImpl.getCategoryList();
		model.addAttribute("cateData", cateData);
		List<NationVO> nationData = nationServiceImpl.getNationList();
		model.addAttribute("nationData", nationData);
		List<AreaVO> areaData = areaServiceImpl.getAreaList();
		model.addAttribute("areaDate", areaData);
		return model;
	}
	
	@RequestMapping("/main.do")
	public String main(Model model) {
		return "main";
	}
	
	@RequestMapping("/getBoardList.do")
	public String getBoardList(UserBoardVO vo, @RequestParam(defaultValue="1") int curPage, Model model) throws Exception {
		
		int listCnt = userboardServiceImpl.getBoardListCount(vo); // 전체 게시글 수
//		System.out.println("전체 게시글 수 : " + listCnt);
		PaginationVO pagination = new PaginationVO(listCnt, curPage);
		vo.setStartIndex(pagination.getStartIndex()); // 게시글 시작 index
		vo.setCntPerPage(vo.getStartIndex() + pagination.getPageSize());
		
//		System.out.println("start index : "+ vo.getStartIndex());
//		System.out.println("cntPerPage : " + vo.getCntPerPage());
		
		List<UserBoardVO> datas = userboardServiceImpl.getBoardList(vo); // 현재 페이지 게시글 목록 조회 - 10개씩 
		
		model.addAttribute("datas", datas); // 정보 저장 - setAttribute의 역할
		model.addAttribute("b_type", vo.getB_type()); // 게시판 종류 - 상위 카테고리 ID
		model.addAttribute("cate_id", vo.getCate_id()); // 하위 카테고리 ID
		model.addAttribute("n_id", vo.getN_id()); // 국가 ID
		model.addAttribute("pagination", pagination);
		return "/jsp-userboard/getBoardList";
	}
	
	@RequestMapping("/getBoard.do")
	public String getBoard(HttpSession session, UserBoardVO vo, ReplyVO rvo, Model model) {
		if ((String) session.getAttribute("sessionID") == null) {
			vo.setId("");
		} else {
			vo.setId((String) session.getAttribute("sessionID"));
		}
		model.addAttribute("data", userboardServiceImpl.getBoard(vo));
		model.addAttribute("rdata", replyServiceImpl.getReplyList(rvo));
		return "/jsp-userboard/readBoard";
	}
	
	@RequestMapping("/insertBoardView.do")
	public String insertView(HttpSession session, UserBoardVO vo, Model model) {
		vo.setId((String) session.getAttribute("sessionID"));
		model.addAttribute("data", vo);
		return "/jsp-userboard/insertBoard";
	}
	
	@RequestMapping("/insertBoard.do")
	public String insertBoard(HttpSession session, UserBoardVO vo) {
		vo.setId((String) session.getAttribute("sessionID"));
		userboardServiceImpl.insertBoard(vo);
		return "redirect:/getBoardList.do?b_type=" + vo.getB_type() + "&cate_id=" + vo.getCate_id() + "&a_id=" + vo.getA_id() + "&n_id=" + vo.getN_id();
	}
	
	@RequestMapping("/updateboardView.do")
	public String updateView(HttpSession session, UserBoardVO vo, Model model) {
		vo.setId((String) session.getAttribute("sessionID"));
		model.addAttribute("data", userboardServiceImpl.getBoard(vo));
		return "/jsp-userboard/updateBoard";
	}
	
	@RequestMapping("/updateBoard.do")
	public String updateBoard(UserBoardVO vo) {
		userboardServiceImpl.updateBoard(vo);
		return "redirect:/getBoard.do?b_id=" + vo.getB_id();
	}
	
	
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(UserBoardVO vo) {
		userboardServiceImpl.deleteBoard(vo);
		return "redirect:/getBoardList.do?b_type=" + vo.getB_type() + "&cate_id=" + vo.getCate_id() + "&a_id=" + vo.getA_id() + "&n_id=" + vo.getN_id();
	}
	
	@ResponseBody
	@RequestMapping("/insertLike.do")
	public String insertLike(LikeVO vo) {
		String result = "false";
		if(likeServiceImpl.insertLike(vo) > 0) {
			result = "true";
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/deleteLike.do")
	public String deleteLike(LikeVO vo) {
		String result = "false";
		if(likeServiceImpl.deleteLike(vo) > 0) {
			result = "true";
		}
		return result;
	}
}
