package com.project.mydoctor;

import java.io.PrintWriter;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.mydoctor.service.MemberService;

//jisu_0204_비밀번호 찾기: 계정 있는지 확인 후 이메일로 임시 비밀번호 전송
//mydoctor453@gmail.com/ pwd: 'mydoc453/'
@Controller
public class SendMail {

	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private MemberService memberService;

	// mailSending 코드
	@RequestMapping(value = "password.find")
	public String mailSending(@RequestParam("name") String name, @RequestParam("id") String id,
			@RequestParam("email") String email, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		int key = memberService.idExist(name, id, email);// name, id, email일치하는 계정의 userkey가 1인지 확인
		String setfrom = "";
		String tomail = "";
		String title = "";
		String content = "";
		String uuid = "";
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		if (key == 1) {
			for (int i = 0; i < 5; i++) {
				uuid = UUID.randomUUID().toString().replaceAll("-", ""); // -를 제거.
				uuid = uuid.substring(0, 10);
				System.out.println("생성된 임시 비밀번호="+uuid.substring(0, 10));
			}
			int result = memberService.updatePass(uuid, id); // 임시비밀번호로 업데이트
			if (result == 1) {// 업데이트 성공
				out.println("<script>alert('가입시 입력한 이메일 주소로 임시 비밀번호가 전송되었습니다.');");
				out.println("location.href='main'");
				out.println("</script>");
				out.close();
				setfrom = "mydoctor453@gmail.com";
				tomail = email; // 받는 사람 이메일
				title = "My doctor, 임시 비밀번호 안내 드립니다."; // 제목
				content = "임시비밀번호는 " + uuid + " 입니다."; // 내용

			} else { // 업데이트 실패
				System.out.println("임시비밀번호로 update 실패");
				out.println("<script>alert('임시비밀번호 설정에 실패했습니다, 다시 시도해 주세요.');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			}
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				messageHelper.setFrom(setfrom);
				messageHelper.setTo(tomail);
				messageHelper.setSubject(title);
				messageHelper.setText(content);

				mailSender.send(message);
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		if (key == 0) {
			out.println("<script>");
			out.println("alert('탈퇴한 회원입니다. 회원가입 해주세요')");
			out.println("location.href='joinForm'");
			out.println("</script>");
			out.close();
		} else {
			out.println("<script>");
			out.println("alert('해당 정보가 없습니다. 다시한번 확인해 주세요')");
			out.println("history.back()");
			out.println("</script>");
			out.close();
		}

		return "main/main";
	}

}
