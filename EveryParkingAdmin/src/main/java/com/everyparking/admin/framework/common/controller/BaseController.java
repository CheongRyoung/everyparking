package com.everyparking.admin.framework.common.controller;

import com.everyparking.admin.framework.common.vo.Ajax;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import java.util.List;

@Controller
public class BaseController {

    @Autowired
    MappingJackson2JsonView jsonView;

    /**
     * 기본 조회용 ModelAndView 작성
     * @return
     */
    public ModelAndView createMav(){
        return createMav(Ajax.SEARCH.TEXT+"."+Ajax.TPYE_SUCCESS);
    }


    /**
     * 기본 조회용 ModelAndView (리스트 기본 셋팅) 작성
     * @return
     */
    public ModelAndView createMav(List list){
        ModelAndView mav = createMav(Ajax.SEARCH.TEXT+"."+Ajax.TPYE_SUCCESS);
        setList(mav, list);
        return mav;
    }


    /**
     * 기본 조회용 ModelAndView (리스트, 카운트 셋팅) 작성
     * @return
     */
    public ModelAndView createMav(List list, int totalCnt){
        ModelAndView mav = createMav(Ajax.SEARCH.TEXT+"."+Ajax.TPYE_SUCCESS);
        setList(mav, list, totalCnt);
        return mav;
    }



    /**
     * 기본 조회용 ModelAndView (data 오브젝트 셋팅) 작성
     * @return
     */
    public ModelAndView createMav(Object data){
        ModelAndView mav = createMav(Ajax.SEARCH.TEXT+"."+Ajax.TPYE_SUCCESS);
        setData(mav, data);
        return mav;
    }


    /**
     * ModelAndView에 오브젝트 셋팅
     * @return
     */
    public void setData(ModelAndView mav, Object data){
        mav.addObject("data", data);
    }

    /**
     * ModelAndView 에 리스트 셋업 ( 리스크 사이즈로 토탈셋)
     * @param mav
     * @param list
     */
    public void setList(ModelAndView mav, List list){
        setList(mav, list, list.size());
    }

    /**
     * ModelAndView 에 리스트 셋업
     * @param mav
     * @param list
     * @param totalCnt
     */
    public void setList(ModelAndView mav, List list, int totalCnt){
        mav.addObject("list", list);
        mav.addObject("totalCnt", totalCnt);
    }

    /**
     * 기본형 ModelAndView 작성
     * @param type
     * @return
     */
    public ModelAndView createMav(String type){
        ModelAndView mav = new ModelAndView(jsonView);

        if(type.indexOf(Ajax.TPYE_SUCCESS) > -1){
            if(type.indexOf(Ajax.SEARCH.TEXT) > -1) {
                mav.addObject(Ajax.MASSAGE, Ajax.SEARCH.SUCCESS);
                mav.addObject(Ajax.CODE, Ajax.SUCCESS);
            } else if(type.indexOf(Ajax.SAVE.TEXT) > -1) {
                mav.addObject(Ajax.MASSAGE, Ajax.SAVE.SUCCESS);
                mav.addObject(Ajax.CODE, Ajax.SUCCESS);
            } else if(type.indexOf(Ajax.DELETE.TEXT) > -1){
                mav.addObject(Ajax.MASSAGE, Ajax.DELETE.SUCCESS);
                mav.addObject(Ajax.CODE, Ajax.SUCCESS);
            } else if(type.indexOf(Ajax.UPDATE.TEXT) > -1) {
                mav.addObject(Ajax.MASSAGE, Ajax.UPDATE.SUCCESS);
                mav.addObject(Ajax.CODE, Ajax.SUCCESS);
            }
        }else{
            if(type.indexOf(Ajax.SEARCH.TEXT) > -1) {
                mav.addObject(Ajax.MASSAGE, Ajax.SEARCH.FAIL);
                mav.addObject(Ajax.CODE, Ajax.FAIL);
            } else if(type.indexOf(Ajax.SAVE.TEXT) > -1) {
                mav.addObject(Ajax.MASSAGE, Ajax.SAVE.FAIL);
                mav.addObject(Ajax.CODE, Ajax.FAIL);
            } else if(type.indexOf(Ajax.DELETE.TEXT) > -1){
                mav.addObject(Ajax.MASSAGE, Ajax.DELETE.FAIL);
                mav.addObject(Ajax.CODE, Ajax.FAIL);
            } else if(type.indexOf(Ajax.UPDATE.TEXT) > -1) {
                mav.addObject(Ajax.MASSAGE, Ajax.UPDATE.FAIL);
                mav.addObject(Ajax.CODE, Ajax.FAIL);
            }
        }
        return mav;
    }



}
