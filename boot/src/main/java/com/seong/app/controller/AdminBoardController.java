package com.seong.app.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.seong.app.model.adminboard.AdminBoardService;
import com.seong.app.model.adminboard.AdminBoardVO;


@Controller
public class AdminBoardController {
	
	@Autowired
	private AdminBoardService adminboardServiceImpl;
	
	@RequestMapping("/getAdminBoardList.do")
	public String getAdminBoardList(AdminBoardVO vo, Model model) {
		List<AdminBoardVO> datas = adminboardServiceImpl.getBoardList(vo);
		model.addAttribute("datas", datas);
		return "/jsp-adminboard/list";
	}
	
	@RequestMapping("/getAdminBoard.do")
	public String getAdminBoard(HttpSession session, AdminBoardVO vo, Model model) {
		if ((String) session.getAttribute("sessionID") == null) {
			vo.setId("");
		} else {
			vo.setId((String) session.getAttribute("sessionID"));
		}
		model.addAttribute("data", adminboardServiceImpl.getBoard(vo));
		return "/jsp-adminboard/view";
	}
	
	@RequestMapping("/insertAdminBoard.do")
	public String insertAdminBoard(HttpSession session, HttpServletRequest request, AdminBoardVO vo) throws IllegalStateException, IOException {
		vo.setId((String) session.getAttribute("sessionID"));
		fileUpload(request, vo);
		adminboardServiceImpl.insertBoard(vo);
		return "redirect:/getAdminBoardList.do";
	}
	
	@RequestMapping("/updateAdminBoardView.do")
	public String getUpdateView(AdminBoardVO vo, HttpSession session, Model model) {
		vo.setId((String) session.getAttribute("sessionID"));
		model.addAttribute("data", adminboardServiceImpl.getBoard(vo));
		return "/jsp-adminboard/updateAdmin";
	}
	
	@RequestMapping("/updateAdminBoard.do")
	public String updateAdminBoard(AdminBoardVO vo, HttpSession session, HttpServletRequest request) throws IllegalStateException, IOException {		
		vo.setId((String) session.getAttribute("sessionID"));
		fileUpload(request, vo);
		adminboardServiceImpl.updateBoard(vo);
		return "redirect:/getAdminBoard.do?b_id=" + vo.getB_id();
	}
	
	@ResponseBody
	@RequestMapping("/deleteAdminBoard.do")
	public String deleteAdminBoard(AdminBoardVO vo) {
		int res = adminboardServiceImpl.deleteBoard(vo);
//		System.out.println("res : " + res);
		if (res > 0) {
			return "true";
		} else {
			return "false";
		}
	}
	
	// ????????? ????????? ?????? ??????
	public static void fileUpload(HttpServletRequest request, AdminBoardVO vo) throws IllegalStateException, IOException {
		String imgPath = null;
		String savePath = request.getSession().getServletContext().getRealPath("/images/preview/"); // ?????? ???????????? ??????
		String loadPath = "/images/preview/"; // ?????? ?????? ?????? - ???????????? ????????? ???????????? ??????, ?????? ????????????
		
		MultipartFile fileUpload = vo.getFileUpload(); // ?????? ????????????
		
		if (!fileUpload.isEmpty()) {
			String originFileNme = fileUpload.getOriginalFilename(); // ?????? ?????????
			String ext = StringUtils.getFilenameExtension(originFileNme); // ?????? ????????? ????????????
			String newInfImgFileName = "img_" + UUID.randomUUID() + "." + ext; // ?????? ?????? ??????
			
			imgPath = loadPath + newInfImgFileName; // ?????? ?????? ??????
			vo.setImg_path(imgPath);
			
			File file = new File(savePath + newInfImgFileName); // ?????? ???????????? ?????? ?????? ??????
			
			fileUpload.transferTo(file);
		}
	}
}
