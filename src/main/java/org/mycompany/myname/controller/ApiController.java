package org.mycompany.myname.controller;


import com.google.gson.Gson;
import org.mycompany.myname.service.PartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Sergey Zhukov
 * @version 1.0
 */

@Controller
public class ApiController {

    @Autowired
    private PartService partService;

    @ResponseBody
    @RequestMapping(value = "/api/parts", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    public String apiParts(@RequestParam(value = "page", required = false) Integer page,
                            @RequestParam(value = "bind", required = false) Boolean bind,
                            HttpServletResponse response) {

        Cookie cookie = new Cookie("count", String.valueOf(this.partService.countParts(bind)));
        response.addCookie(cookie);
        Integer currentPage = 0;
        if (page != null) currentPage = page - 1;
        return new Gson().toJson(this.partService.listParts(currentPage, bind));
    }

    @ResponseBody
    @RequestMapping(value = "/api/count", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    public String apiCount(@RequestParam(value = "bind", required = false) Boolean bind) {
        return new Gson().toJson(this.partService.countParts(bind));
    }
}
