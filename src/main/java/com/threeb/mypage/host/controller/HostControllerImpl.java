package com.threeb.mypage.host.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.threeb.house.vo.HouseVO;
import com.threeb.house.vo.ImageVO;
import com.threeb.member.vo.MemberVO;
import com.threeb.mypage.host.service.HostService;
import com.threeb.mypage.vo.BookingVO;
import com.threeb.mypage.vo.ReviewVO;

@Controller("hostController")
@RequestMapping(value = "/mypage/host")
public class HostControllerImpl implements HostController {
	
	private static final String HOUSE_IMAGE_REPO = "c:\\house\\house_image";
	@Autowired HostService hostService;
	@Autowired MemberVO loginMember;
	@Autowired HouseVO houseVO;
	@Autowired BookingVO bookingVO;
	@Autowired ReviewVO reviewVO;
	
	//숙소 관리 페이지
	@RequestMapping(value = {""}, method = RequestMethod.GET)
	public ModelAndView hostPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav=new ModelAndView(viewName);
		//세션에 저장된 로그인 회원정보 가져오기
		HttpSession session=request.getSession();
		loginMember=(MemberVO)session.getAttribute("member");
		//로그인 회원 숙소,예약,후기 정보 가져오기
		Map listHost=hostService.listHost(loginMember.getMember_id());
		mav.addObject("listHost", listHost);
		return mav;
	}
	
	//숙소 등록 페이지
	@Override
	@RequestMapping(value = "/uploadForm.do", method = RequestMethod.GET)
	public ModelAndView uploadForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav=new ModelAndView(viewName);
		return mav;
	}
	
	//숙소 등록
	@Override
	@RequestMapping(value = "/addNewHouse.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewHouse(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		String imageFileName = null;
		Map<String, Object> houseMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = multipartRequest.getParameter(name);
			houseMap.put(name, value);
			System.out.println("값 확인 : name : " + name + ", value:" + value);
		}
		// 로그인 시 세션에 저장된 회원 정보에서 글쓴이 아이디를 얻어와서 Map에 저장합니다.
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String member_id = memberVO.getMember_id();
		houseMap.put("member_id", member_id);

		List<String> fileList = upload(multipartRequest);
		System.out.println("첨부된 파일 리스트 : " + fileList);

		List<ImageVO> imageFileList = new ArrayList<ImageVO>();
		System.out.println("ImageVO의 imageFileList ------");

		if(fileList!=null&&fileList.size()!= 0) {
			for(String fileName:fileList) {
				ImageVO imageVO = new ImageVO();
				imageVO.setFilename(fileName);
				imageFileList.add(imageVO);
				System.out.println(imageVO.getFilename());
			}
			houseMap.put("imageFileName", imageFileList.get(0).getFilename());
			houseMap.put("imageFileList", imageFileList);
		}
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int house_id = hostService.addNewHouse(houseMap);
			System.out.println("house_id : " + house_id);
			if(imageFileList!=null&&imageFileList.size()!=0) {
				for(ImageVO imageVO : imageFileList) {
					imageFileName = imageVO.getFilename();

					System.out.println("이미지 잘 들어가는지" + imageFileName);
					File srcFile = new File(HOUSE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
					System.out.println("srcFile : " + srcFile);

					File destDir = new File(HOUSE_IMAGE_REPO + "\\" + house_id);
					System.out.println("destDir" + destDir);

					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
			}
			message = "<script>";
			message += "	alert('숙소가 등록되었습니다.');";
			message += "	location.href='" + multipartRequest.getContextPath() + "/mypage/host.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			if(imageFileList != null && imageFileList.size() != 0) {
				for(ImageVO imageVO : imageFileList) {
					imageFileName = imageVO.getFilename();
					File srcFile = new File(HOUSE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
					srcFile.delete();
				}
			}
			message = "<script>";
			message += "	alert('오류가 발생했습니다. 다시 시도해주세요.');";
			message += "	location.href='" + multipartRequest.getContextPath() + "/mypage/host.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	
	// 다중 이미지 업로드하기
	private List<String> upload(MultipartHttpServletRequest multipartRequest) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		List<MultipartFile> MPfileList = multipartRequest.getFiles("file");
		System.out.println("MultipartFileList: " + MPfileList);

		List<String> fileList = new ArrayList<String>();
		for (MultipartFile mf : MPfileList) {
			String fileName = mf.getName();
			String originFileName = mf.getOriginalFilename();
			System.out.println("originFileName : " + originFileName);
			System.out.println("fileName : " + fileName);
			fileList.add(originFileName);

			File file = new File(HOUSE_IMAGE_REPO + "\\temp" + "\\");

			System.out.println("uploadFILE : " + file);

			if (file.exists()) {
				if (file.getParentFile().mkdirs()) {
					file.createNewFile();
				}
			}
			mf.transferTo(new File(HOUSE_IMAGE_REPO + "\\" + "temp\\" + originFileName));
		}
		return fileList;
	}
	
	//숙소 삭제
	@Override
	@RequestMapping(value = "/deleteHouse.do", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity deleteHouse(@RequestParam("id") int house_id, HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		response.setContentType("text/html; charset=utf-8");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			hostService.deleteHouse(house_id);
			File destDir = new File(HOUSE_IMAGE_REPO + "\\" + house_id);
			FileUtils.deleteDirectory(destDir);

			message = "<script>";
			message += "	alert('숙소가 삭제되었습니다.');";
			message += "	location.href='" + request.getContextPath() + "/mypage/host.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			message = "<script>";
			message += "	alert('오류가 발생하였습니다. 다시 시도해 주세요.');";
			message += "	location.href='" + request.getContextPath() + "/mypage/host.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	
	//예약 취소
	@Override
	@RequestMapping(value = "/cancelBooking.do", method = RequestMethod.GET)
	public ResponseEntity cancelBooking(@RequestParam("id") int booking_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders=new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		try {
			hostService.cancelBooking(booking_id);
			message="<script>";
			message+="	alert('예약이 취소되었습니다.');";
			message+="	location.href='"+request.getContextPath()+"/mypage/host.do';";
			message+="</script>";
			resEnt=new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch (Exception e) {
			message="<script>";
			message+="	alert('오류가 발생했습니다. 다시 시도해주세요.');";
			message+="	location.href='"+request.getContextPath()+"/mypage/host.do';";
			message+="</script>";
			resEnt=new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt; 
	}

}
