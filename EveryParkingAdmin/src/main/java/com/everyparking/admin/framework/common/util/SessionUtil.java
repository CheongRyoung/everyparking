package com.everyparking.admin.framework.common.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Enumeration;
import java.util.HashMap;

public class SessionUtil {


    /**
     * session에 데이터 생성
     * @param request
     * @param key
     * @param object
     */
    public static void setSessionData(HttpServletRequest request, String key, Object object){
        setSessionData(request.getSession(), key, object);
    }

    /**
     * session에 데이터 생성
     * @param session
     * @param key
     * @param object
     */
    public static void setSessionData(HttpSession session, String key, Object object){
        session.setAttribute(key, object);
    }

    /**
     * 세션정보 지우기
     * @param session
     */
    public static void clearSession(HttpSession session){
        Enumeration<String> enumeration = session.getAttributeNames();
        while(enumeration.hasMoreElements()){
            String key = enumeration.nextElement();
            session.removeAttribute(key);
        }
    }

    /**
     * targetMap에 Session의 user정보로 작성자, 수정자 셋팅
     * @param request
     * @param targetMap
     */
    public static void setCreator(HttpServletRequest request, HashMap targetMap){
        setCreator(request.getSession(), targetMap);
    }

    /**
     * targetMap에 Session의 user정보로 작성자, 수정자 셋팅
     * @param session
     * @param targetMap
     */
    public static void setCreator(HttpSession session, HashMap targetMap){
        HashMap<String,Object> user = (HashMap<String, Object>)session.getAttribute("member");
        targetMap.put("REG_SEQ", user.get("USER_SEQ"));
        targetMap.put("MOD_SEQ", user.get("USER_SEQ"));
    }
}
