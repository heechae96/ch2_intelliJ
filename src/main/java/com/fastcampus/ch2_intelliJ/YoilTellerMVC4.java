package com.fastcampus.ch2_intelliJ;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Calendar;

@Controller
public class YoilTellerMVC4 {
    // 예외처리
    @ExceptionHandler(Exception.class)
    public String catcher(Exception e) {
        e.printStackTrace();
        return "yoilError";
    }

    @RequestMapping("/getYoilMVC4") // http://localhost:8080/ch2/getYoilMVC4?year=2022&month=11&day=1
    public String main(MyDate date, Model model) {  // year, month, day를 MyDate라는 class로 묶은것
        System.out.println("date=" + date);

        // 1. 유효성 검사
        if (!isValid(date)) {
            return "yoilError";
        }

        // 2. 처리
        char yoil = getYoil(date);

        // 3. Model에 작업한 결과를 저장
        model.addAttribute("myDate", date);
        model.addAttribute("yoil", yoil);

        // 4. 작업 결과를 보여줄 view의 이름을 반환
        return "yoil";

    }

    private char getYoil(MyDate date) {
        return getYoil(date.getYear(), date.getMonth(), date.getDay());
    }

    private char getYoil(int year, int month, int day) {
        Calendar cal = Calendar.getInstance();
        cal.set(year, month - 1, day);

        int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
        return " 일월화수목금토".charAt(dayOfWeek);
    }

    private boolean isValid(MyDate date) {
        return isValid(date.getYear(), date.getMonth(), date.getDay());
    }

    private boolean isValid(int year, int month, int day) {
        if (year == -1 || month == -1 || day == -1)
            return false;

        return (1 <= month && month <= 12) && (1 <= day && day <= 31); // 간단히 체크
    }
}