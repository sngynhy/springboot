package com.seong.app.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.seong.app.model.member.MemberService;
import com.seong.app.model.member.MemberVO;


@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberServiceImpl;
	
	@ResponseBody
	@RequestMapping("/login.do")
	public boolean login(HttpSession session, HttpServletResponse response, MemberVO vo) {
		if (memberServiceImpl.getMember(vo) != null) {
			session.setAttribute("sessionID", vo.getId());
			return true;
		} else { // 로그인 실패
			return false;
		}
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "index";
	}
	
	@ResponseBody
	@RequestMapping("/insertMember.do")
	public boolean insertMember(MemberVO vo) throws Exception {
		if (memberServiceImpl.insertMember(vo) > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	@ResponseBody
	@RequestMapping("/checkID.do")
	public boolean checkID(@RequestParam("id") String id, HttpServletResponse response) throws Exception {
		if (memberServiceImpl.checkID(id) > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	@RequestMapping("/mypage.do")
	public String getMember(HttpSession session, MemberVO vo, Model model) {
		vo.setId((String) session.getAttribute("sessionID"));
		model.addAttribute("data", memberServiceImpl.getMember(vo));
		return "/jsp-member/mypage";
	}
	
	@ResponseBody
	@RequestMapping("/checkPW.do")
	public boolean checkPw(HttpServletResponse response, MemberVO vo, Model model) throws IOException {
		if (memberServiceImpl.getMember(vo) != null) {
			return true;
		} else {
			return false;
		}
	}
	
	@RequestMapping("/updateView.do")
	public String udpateView(HttpSession session, HttpServletResponse response, MemberVO vo, Model model) throws IOException {
		vo.setId((String) session.getAttribute("sessionID"));
		model.addAttribute("data", memberServiceImpl.getMember(vo));
		return "/jsp-member/updateMember";
	}
	
	@ResponseBody
	@RequestMapping("/updateMember.do")
	public boolean updateMember(HttpSession session, MemberVO vo, Model model) throws IOException {
		vo.setId((String) session.getAttribute("sessionID"));
		if (memberServiceImpl.updateMember(vo) > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	@ResponseBody
	@RequestMapping("/updatePw.do")
	public boolean updatePw(HttpSession session, HttpServletResponse response, MemberVO vo, Model model) throws IOException {
		vo.setId((String) session.getAttribute("sessionID")); // �ڵ� �α׾ƿ� �� ������ ��츦 ����� sessionID ���� ���� ���� �Ǵ� �ʿ�
		if (memberServiceImpl.updateMember(vo) > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	@RequestMapping("/deleteMember.do")
	public String deleteMember(HttpSession session, MemberVO vo) throws Exception {
		vo.setId((String) session.getAttribute("sessionID"));
		memberServiceImpl.deleteMember(vo);
		session.invalidate();
		return "index";
	}
}
