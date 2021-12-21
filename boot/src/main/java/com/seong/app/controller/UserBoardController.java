package com.seong.app.controller;

import java.io.IOException;
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
	private CategoryService categoryServiceImpl; // ����, ����, ���� ��
	@Autowired
	private NationService nationServiceImpl; // �ĸ�, ����, ��Ż���� ��
	@Autowired
	private AreaService areaServiceImpl; // ����, �ƽþ� ��
	@Autowired
	private ReplyService replyServiceImpl; // ���
	@Autowired
	private LikeService likeServiceImpl; // ��
	
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
		
		int listCnt = userboardServiceImpl.getBoardListCount(vo); // ��ü �Խñ� ��
//		System.out.println("��ü �Խñ� �� : " + listCnt);
		PaginationVO pagination = new PaginationVO(listCnt, curPage);
		vo.setStartIndex(pagination.getStartIndex()); // �Խñ� ���� index
		vo.setCntPerPage(vo.getStartIndex() + pagination.getPageSize());
		
//		System.out.println("start index : "+ vo.getStartIndex());
//		System.out.println("cntPerPage : " + vo.getCntPerPage());
		
		List<UserBoardVO> datas = userboardServiceImpl.getBoardList(vo); // ���� ������ �Խñ� ��� ��ȸ - 10���� 
		
		model.addAttribute("datas", datas); // ���� ���� - setAttribute�� ����
		model.addAttribute("b_type", vo.getB_type()); // �Խ��� ���� - ���� ī�װ� ID
		model.addAttribute("cate_id", vo.getCate_id()); // ���� ī�װ� ID
		model.addAttribute("n_id", vo.getN_id()); // ���� ID
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
	public String updateBoard(UserBoardVO vo, Model model) {
		userboardServiceImpl.updateBoard(vo);
		return "redirect:/getBoard.do?b_id=" + vo.getB_id();
	}
	
	
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(UserBoardVO vo, Model model) throws IOException {
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
