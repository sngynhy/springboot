package com.seong.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.seong.app.model.reply.ReplyService;
import com.seong.app.model.reply.ReplyVO;
import com.seong.app.model.userboard.UserBoardVO;


@Controller
public class ReplyController {
	
	@Autowired
	private ReplyService replyServiceImpl;
	
	@RequestMapping("/insertReply.do")
	public String insertReply(ReplyVO rvo, UserBoardVO uvo) { /// Ʈ����� ó��
		replyServiceImpl.insertReply(rvo);
		return "redirect:getBoard.do?b_id=" + rvo.getB_id() + "&b_type=" + uvo.getB_type() + "&cate_id=" + uvo.getCate_id() + "&a_id=" + uvo.getA_id() + "&n_id=" + uvo.getN_id();
	}
	@RequestMapping("/deleteReply.do")
	public String deleteReply(ReplyVO rvo, UserBoardVO uvo) { /// Ʈ����� ó��
		replyServiceImpl.deleteReply(rvo);
		return "redirect:getBoard.do?b_id=" + rvo.getB_id() + "&b_type=" + uvo.getB_type() + "&cate_id=" + uvo.getCate_id() + "&a_id=" + uvo.getA_id() + "&n_id=" + uvo.getN_id();
	}
}
